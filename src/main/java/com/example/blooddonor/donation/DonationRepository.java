package com.example.blooddonor.donation;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DonationRepository extends JpaRepository <Donation, Long> {

    List<Donation> findAllByUserIdOrderByDayOfDonationDesc(Long userId);
    List<Double> findAllAmountByUserId(Long userId);
}
