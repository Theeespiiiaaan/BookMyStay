package com.reservation.app;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Builder;
import lombok.Data;
import lombok.ToString;
import lombok.experimental.Tolerate;

@Data
@Builder
@Entity
@ToString
public class Reservation implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    private String guestFullName;
    private String guestId;
    @Temporal(TemporalType.DATE)
    private Date fromDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    private Date toDate;
    @Temporal(TemporalType.TIMESTAMP)
    private Date checkin;
    @Temporal(TemporalType.TIMESTAMP)
    private Date checkout;
    @ManyToOne
    private Room room;
    private Integer pax;
    private String status;
    private Double deposit;

    @Transient
    private Double miscellaneous;
    @Transient
    private String miscDescription;
    @Transient
    private String paymentMethod;

    @Tolerate
    public Reservation(){ /* no-arg constructor */ }
}
