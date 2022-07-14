package com.example.blooddonor.donationcenter;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BloodDonationCenterRepository extends JpaRepository<BloodDonationCenter, Long> {
    List<BloodDonationCenter> findAllByProvinceId(Long id);
}
