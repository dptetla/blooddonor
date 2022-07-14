package com.example.blooddonor.donation;

import com.example.blooddonor.user.User;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Getter
@Setter
public class Donation {

    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    private User user;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate dayOfDonation;
    private String description;
    private String component;
    private Double amount;

}
