package com.reservation.app;

import java.util.Calendar;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BillingRepository extends CrudRepository<Billing, Long>  {
    
    @Query(value = "SELECT * FROM BILLING", nativeQuery = true)
    List<Billing> findAll();

    @Query(value = "SELECT * FROM BILLING WHERE ID = ?1", nativeQuery = true)
    Optional<Billing> findById(Long id);

    @Query(value = "SELECT * FROM BILLING WHERE RESERVATION_ID = ?1", nativeQuery = true)
    Optional<Billing> findByReservationId(Long id);

    @Modifying(flushAutomatically = true)
    @Transactional()
    @Query(value = "INSERT INTO BILLING(ID,RESERVATION_ID,GUEST_FULL_NAME,GUEST_ID,DEPOSIT,ROOM_FEE,MISCELLANEOUS,MISC_DESCRIPTION,TOTAL,VAT,PAYMENT_METHOD,BILL_DATE) VALUES(?1,?2,?3,?4,?5,?6,?7,?8,?9,?10,?11,?12)", nativeQuery = true)
    int billOut(Long id, Long reservationId, String name, String guestId, Double deposit, Double roomFee, Double miscellaneous, String miscDescription, Double total, Double vat, String paymentMethod, Calendar billDate);
}
