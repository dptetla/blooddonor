package com.example.blooddonor.donationcenter;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BloodDonationCenterController {

    private final BloodDonationCenterRepository bloodrepository;
    private final ProvinceRepository provinceRepository;

    public BloodDonationCenterController(BloodDonationCenterRepository bloodrepository, ProvinceRepository provinceRepository) {
        this.bloodrepository = bloodrepository;
        this.provinceRepository = provinceRepository;
    }

    @RequestMapping(value = "/login/center", method = RequestMethod.GET)
    public String getProvince(Model model){
        model.addAttribute("provinces", provinceRepository.findAll());
        model.addAttribute("center", new BloodDonationCenter());
        return "center";
    }
    @RequestMapping(value = "/login/center", method = RequestMethod.POST)
    public String getCenter(Model model, BloodDonationCenter center){
        model.addAttribute("provinces", provinceRepository.findAll());
        model.addAttribute("center", new BloodDonationCenter());
        model.addAttribute("bloodcenter", bloodrepository.findAllByProvinceId(center.getProvince().getId()));
        System.out.println(center.getId());
        System.out.println(center.getProvince().getId());
        System.out.println("abc");
        return "center";
    }
}
