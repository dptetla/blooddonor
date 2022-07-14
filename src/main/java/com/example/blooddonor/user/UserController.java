package com.example.blooddonor.user;

import com.example.blooddonor.donation.Donation;
import com.example.blooddonor.donation.DonationRepository;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.IOException;
import java.util.List;

@Controller
public class UserController {

    private final UserRepository userRepository;
    private final BCryptPasswordEncoder passwordEncoder;
    private final UserService userService;
    private final DonationRepository donationRepository;

    public UserController(UserRepository userRepository, BCryptPasswordEncoder passwordEncoder, UserService userService, DonationRepository donationRepository) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.userService = userService;
        this.donationRepository = donationRepository;
    }

//    @GetMapping("/create")
//    @ResponseBody
//    public String createUser() {
//        User user = new User();
//        user.setUserName("admin");
//        user.setFirstName("John");
//        user.setLastName("Kowalski");
//        user.setEmail("john.kowalski@example.com");
//        user.setPassword("admin");
//        userService.saveUser(user);
//        return "admin";
//    }

    @RequestMapping("/")
    public String home() {
        return "/start";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register(Model model) {
        model.addAttribute("user", new User());
        return "/register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String add(@Valid User user, HttpServletRequest request, BindingResult bindingResult) throws ServletException, IOException {
        String repassword = request.getParameter("repassword");
        User userExist = userService.findByUserName(user.getUserName());
        if (userExist != null){
            bindingResult.rejectValue("userName", "error.user", "Istnieje już taki użytkownik");
            return "/register";
        }
        if (bindingResult.hasErrors()){
            return "/register";
        }
        if (repassword.equals(user.getPassword())) {
            user.setPassword(passwordEncoder.encode(user.getPassword()));
            userRepository.save(user);
            return "/login";
        }
        return "/register";
    }


    @RequestMapping(value = "/login/userdetails", method = RequestMethod.GET)
    public String UserDetails(Model model,  @AuthenticationPrincipal CurrentUser currentUser){
        Double resultBlood = currentUser.getUser().getAmountOfBlood();
        model.addAttribute("user", userRepository.findById(currentUser.getUser().getId()));
        List<Donation>list = donationRepository.findAllByUserIdOrderByDayOfDonationDesc(currentUser.getUser().getId());
        for (Donation blood : list) {
            resultBlood += blood.getAmount();
            System.out.println(blood.getAmount());
        }
        System.out.println("wynik: " + resultBlood);
        model.addAttribute("result", String.format("%.2f", resultBlood));
        return "/userdetails";
    }


    @RequestMapping(value = "/login/userdetailsedit", method = RequestMethod.GET)
    public String details(Model model, @AuthenticationPrincipal CurrentUser currentUser){
        model.addAttribute("details", userRepository.findById(currentUser.getUser().getId()));
        return "/userdetailsedit";
    }

    @RequestMapping(value = "/login/userdetailsedit", method = RequestMethod.POST)
    public String update(User user, @AuthenticationPrincipal CurrentUser currentUser){
        User u = userRepository.findById(currentUser.getUser().getId()).get();
        u.setSex(user.getSex());
        u.setAge(user.getAge());
        u.setBloodGroup(user.getBloodGroup());
        u.setAmountOfBlood(user.getAmountOfBlood());
        userRepository.save(u);
        return "redirect:/login/userdetails";
    }

    @RequestMapping(value = "/login/edituser", method = RequestMethod.GET)
    public String userEdit(Model model, @AuthenticationPrincipal CurrentUser currentUser){
        model.addAttribute("user", userRepository.findById(currentUser.getUser().getId()));
        return "/edituser";
    }

    @RequestMapping(value = "/login/edituser", method = RequestMethod.POST)
    public String userUpdate(User user,HttpServletRequest request, @AuthenticationPrincipal CurrentUser currentUser){
        User u = userRepository.findById(currentUser.getUser().getId()).get();
        u.setUserName(user.getUserName());
        u.setFirstName(user.getFirstName());
        u.setLastName(user.getLastName());
        u.setEmail(user.getEmail());
        String repassword = request.getParameter("repassword");
        if (repassword.equals(user.getPassword()) && !user.getPassword().isBlank()) {
            u.setPassword(passwordEncoder.encode(user.getPassword()));
            userRepository.save(u);
            return "redirect:/login/main";
        }
        return "/login/edituser";
    }
}