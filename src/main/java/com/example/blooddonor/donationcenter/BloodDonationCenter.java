package com.example.blooddonor.donationcenter;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
public class BloodDonationCenter {

    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    private Province province;
    private String town;
    private String address;
    private String monday;
    private String tuesday;
    private String wednesday;
    private String thursday;
    private String friday;
    private String saturday;
    private String webPage;
}
