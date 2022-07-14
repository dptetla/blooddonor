package com.example.blooddonor.testresult;

import com.example.blooddonor.user.CurrentUser;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;

@Controller
public class TestResultController {

    private final TestResultRepository testResultRepository;

    public TestResultController(TestResultRepository testResultRepository) {
        this.testResultRepository = testResultRepository;
    }

    @RequestMapping(value = "/login/addresult", method = RequestMethod.GET)
    public String fillResult(Model model) {
        model.addAttribute("result", new TestResult());
        return "/addresult";
    }

    @RequestMapping(value = "/login/addresult", method = RequestMethod.POST)
    public String addResult(@AuthenticationPrincipal CurrentUser currentUser, @Valid TestResult testResult, BindingResult result) {
        if (result.hasErrors()) {
            return "/addresult";
        }
        testResult.setUser(currentUser.getUser());
        testResultRepository.save(testResult);
        return "redirect:/login/resultlist";
    }

    @RequestMapping(value = "/login/resultlist", method = RequestMethod.GET)
    public String listOfResult(Model model, @AuthenticationPrincipal CurrentUser currentUser){
        model.addAttribute("result", testResultRepository.findAllByUserIdOrderByDayOfTestDesc(currentUser.getUser().getId()));
    return "/resultlist";
    }

    @RequestMapping(value = "/login/editresult", method = RequestMethod.GET)
    public String editResult(Model model, @RequestParam Long id){
        model.addAttribute("result", testResultRepository.findById(id));
        return "/editresult";
    }

    @RequestMapping(value = "/login/editresult", method = RequestMethod.POST)
    public String saveResult(TestResult testResult, @AuthenticationPrincipal CurrentUser currentUser){
        testResult.setUser(currentUser.getUser());
        testResultRepository.save(testResult);
        return "redirect:/login/resultlist";
    }


    @RequestMapping(value = "/login/removeresult", method = RequestMethod.GET)
    public String removeResult(@RequestParam Long id){
        testResultRepository.deleteById(id);
        return "redirect:/login/resultlist";
    }


}


