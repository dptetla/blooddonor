package com.example.blooddonor.donationcenter;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Setter
@Getter
public class Province {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
}
