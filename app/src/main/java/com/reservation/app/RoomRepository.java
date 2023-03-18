package com.reservation.app;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RoomRepository extends CrudRepository<Room, Long>  {
    
    @Query(value = "SELECT * FROM ROOM", nativeQuery = true)
    List<Room> findAll();
}
