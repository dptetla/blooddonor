package com.example.blooddonor.donation;

import com.example.blooddonor.user.CurrentUser;
import com.example.blooddonor.user.UserService;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
public class DonationController {

    private final UserService userService;
    private final DonationRepository donationRepository;

    public DonationController(UserService userService, DonationRepository donationRepository) {
        this.userService = userService;
        this.donationRepository = donationRepository;
    }


    @RequestMapping (value = "/login/adddonation", method = RequestMethod.GET)
    public String fillDonation(Model model){
        model.addAttribute("donation", new Donation());
        return "/adddonation";
    }

    @RequestMapping(value = "/login/adddonation", method = RequestMethod.POST)
    public String addDonation(@Valid Donation donation, BindingResult result, @AuthenticationPrincipal CurrentUser currentUser){
        if(result.hasErrors()){
            return "/adddonation";
        }
        donation.setUser(currentUser.getUser());
        donationRepository.save(donation);
        return "redirect:/login/listdonation";
    }

    @RequestMapping(value = "/login/listdonation", method = RequestMethod.GET)
    public String list(@AuthenticationPrincipal CurrentUser currentUser, Model model){
        model.addAttribute("list", donationRepository.findAllByUserIdOrderByDayOfDonationDesc(currentUser.getUser().getId()));
        return "/listdonation";
    }
    @RequestMapping(value = "/login/editdonation", method = RequestMethod.GET)
    public String editDonation(@RequestParam Long id, Model model){
        model.addAttribute("donation", donationRepository.findById(id));
        return "/editdonation";
    }

    @RequestMapping(value = "/login/editdonation", method = RequestMethod.POST)
    public String update(Donation donation, @AuthenticationPrincipal CurrentUser currentUser){
        donation.setUser(currentUser.getUser());
        donationRepository.save(donation);
        return "redirect:/login/listdonation";
    }

    @RequestMapping(value = "/login/remove", method = RequestMethod.GET)
    private String remove (@RequestParam Long id){
        donationRepository.deleteById(id);
        return "redirect:/login/listdonation";
    }

    @RequestMapping(value = "/login/confirm", method = RequestMethod.GET)
    public String confirm(@RequestParam Long id, Model model){
        model.addAttribute("id", id);
        return "/confirm";
    }



}
