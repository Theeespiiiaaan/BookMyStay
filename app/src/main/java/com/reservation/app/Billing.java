package com.reservation.app;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Builder;
import lombok.Data;
import lombok.ToString;
import lombok.experimental.Tolerate;

@Data
@Builder
@Entity
@ToString
public class Billing implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    @OneToOne
    private Reservation reservation;
    private String guestFullName;
    private String guestId;
    private Double deposit;
    private Double roomFee;
    private Double miscellaneous;
    private String miscDescription;
    private Double total;
    private Double vat;
    private String paymentMethod;
    @Temporal(TemporalType.TIMESTAMP)
    private Date billDate;

    @Tolerate
    public Billing(){ /* no-arg constructor */ }
}
