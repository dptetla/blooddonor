package com.example.blooddonor.user;

import lombok.Getter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {

    @GetMapping("/login/main")
    public String loginUser() {
        return "/main";
    }

    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public String login() {
        return "/login";
    }
}
