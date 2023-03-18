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
public interface ReservationRepository extends CrudRepository<Reservation, Long>  {
    
    @Query(value = "SELECT * FROM RESERVATION", nativeQuery = true)
    List<Reservation> findAll();

    @Query(value = "SELECT * FROM RESERVATION WHERE ID = ?1", nativeQuery = true)
    Optional<Reservation> findById(Long id);

    @Modifying
    @Transactional()
    @Query(value = "DELETE FROM RESERVATION WHERE ID = ?1", nativeQuery = true)
    int delete(Long id);

    @Modifying
    @Transactional()
    @Query(value = "UPDATE RESERVATION SET GUEST_FULL_NAME=?2, TO_DATE=?3, ROOM_ID=?4, PAX=?5, DEPOSIT=?6, CHECKIN=?7, STATUS='CHECKED-IN' WHERE ID = ?1", nativeQuery = true)
    int checkin(Long id, String name, Calendar toDate, Long roomId, Integer pax, Double deposit, Calendar checkin);

    @Modifying
    @Transactional()
    @Query(value = "UPDATE RESERVATION SET TO_DATE=?2, PAX=?3, CHECKOUT=?4, STATUS='CHECKED-OUT' WHERE ID = ?1", nativeQuery = true)
    int checkout(Long id, Calendar toDate, Integer pax, Calendar checkout);
}
