package com.reservation.app;

import java.util.Calendar;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AppController {
    
    @Autowired
    private ReservationRepository reservationRepository;
    @Autowired
    private RoomRepository roomRepository;
    @Autowired
    private BillingRepository billingRepository;

    @GetMapping("/")
    public String home(){
        return "index";
    }

    @GetMapping("/reservations")
    public String reservations(HttpServletRequest request){
        request.setAttribute("reservations", this.reservationRepository.findAll());
        return "reservations";
    }

    @GetMapping("/delete-reservation")
    public String deleteReservations(HttpServletRequest request, @RequestParam long reservationId){
        this.reservationRepository.delete(reservationId);
        request.setAttribute("reservations", this.reservationRepository.findAll());
        return "redirect:reservations";
    }

    @GetMapping("/checkin")
    public String checkin(HttpServletRequest request, @RequestParam long reservationId){
        Reservation reservation = this.reservationRepository.findById(reservationId).get();
        request.setAttribute("reservation", reservation);
        request.setAttribute("rooms", this.roomRepository.findAll());
        return "checkin";
    }

    @PostMapping("/checkin-submit")
    public String checkinSubmit(HttpServletRequest request, @ModelAttribute("reservation")Reservation res, BindingResult result) {
        Calendar calToDate = Calendar.getInstance();
        calToDate.setTime(res.getToDate());
        Calendar now = Calendar.getInstance();
        now.setTime(new Date());
        
        this.reservationRepository.checkin(res.getId(), 
            res.getGuestFullName(), 
            calToDate, 
            res.getRoom().getId(), 
            res.getPax(), 
            res.getDeposit(), 
            now);

        Reservation updatedReservation = this.reservationRepository.findById(res.getId()).get();
        request.setAttribute("reservation", updatedReservation);
        request.setAttribute("rooms", this.roomRepository.findAll());
        return "redirect:checkin-success?reservationId=" + res.getId();
    }

    @GetMapping("/checkin-success")
    public String checkinSuccess(HttpServletRequest request, @RequestParam long reservationId){
        Reservation reservation = this.reservationRepository.findById(reservationId).get();
        request.setAttribute("reservation", reservation);
        return "checkin-success";
    }

    @GetMapping("/checkout")
    public String checkout(HttpServletRequest request, @RequestParam long reservationId){
        Reservation reservation = this.reservationRepository.findById(reservationId).get();
        request.setAttribute("reservation", reservation);
        return "checkout";
    }

    @PostMapping("/checkout-submit")
    public String checkoutSubmit(HttpServletRequest request, @ModelAttribute("reservation")Reservation res, BindingResult result) {
        Calendar calToDate = Calendar.getInstance();
        calToDate.setTime(res.getToDate());
        Calendar now = Calendar.getInstance();
        now.setTime(new Date());
        
        this.reservationRepository.checkout(res.getId(), 
            calToDate, 
            res.getPax(), 
            now);
        Reservation updatedReservation = this.reservationRepository.findById(res.getId()).get();

        Billing billing = new Billing();
        billing.setGuestFullName(res.getGuestFullName());
        billing.setGuestId(updatedReservation.getGuestId());

        long dateBeforeInMs = updatedReservation.getFromDate().getTime();
        long dateAfterInMs = updatedReservation.getToDate().getTime();
        long timeDiff = Math.abs(dateAfterInMs - dateBeforeInMs);
        long daysDiff = TimeUnit.DAYS.convert(timeDiff, TimeUnit.MILLISECONDS);

        billing.setRoomFee(updatedReservation.getRoom().getRate() * daysDiff);
        billing.setDeposit(updatedReservation.getDeposit() != null ? updatedReservation.getDeposit() : 0);
        billing.setMiscellaneous(res.getMiscellaneous() != null ? res.getMiscellaneous() : 0);
        billing.setMiscDescription(res.getMiscDescription());
        Double total = billing.getRoomFee() + billing.getMiscellaneous() - billing.getDeposit();
        Double vat = total * 0.12;
        billing.setTotal(total);
        billing.setVat(vat);
        billing.setPaymentMethod(res.getPaymentMethod());

        this.billingRepository.billOut(res.getId(), res.getId(), 
            billing.getGuestFullName(), 
            billing.getGuestId(), 
            billing.getDeposit(),
            billing.getRoomFee(), 
            billing.getMiscellaneous(), 
            billing.getMiscDescription(), 
            billing.getTotal(), 
            billing.getVat(), 
            billing.getPaymentMethod(), 
            now);
        
        request.setAttribute("reservation", updatedReservation);
        return "redirect:checkout-success?reservationId=" + res.getId();
    }

    @GetMapping("/checkout-success")
    public String checkoutSuccess(HttpServletRequest request, @RequestParam long reservationId){
        Reservation reservation = this.reservationRepository.findById(reservationId).get();
        Billing billing = this.billingRepository.findByReservationId(reservationId).get();
        request.setAttribute("reservation", reservation);
        request.setAttribute("billing", billing);
        return "bill";
    }
}
