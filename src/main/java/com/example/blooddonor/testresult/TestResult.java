package com.example.blooddonor.testresult;

import com.example.blooddonor.user.User;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Getter
@Setter
public class TestResult {

    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private Long id;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate dayOfTest;
    private Double RBC;
    private Double HGB;
    private Double HCT;
    private Double MCV;
    private Double MCH;
    private Double MCHC;
    private Double RDW;
    @ManyToOne
    private User user;
}
