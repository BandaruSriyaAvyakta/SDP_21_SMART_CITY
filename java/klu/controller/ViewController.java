package klu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class ViewController {

    // Routing for login page
    @GetMapping("/")
    public ModelAndView login() {
        ModelAndView MV = new ModelAndView();
        MV.setViewName("index");  
        return MV;
    }

    // Routing for home page
    @GetMapping("/home")
    public ModelAndView home() {
        ModelAndView MV = new ModelAndView();
        MV.setViewName("home");
        return MV;
    }

    // Routing for signup page
    @GetMapping("/signup")
    public ModelAndView signUp() {
        ModelAndView MV = new ModelAndView();
        MV.setViewName("signup");
        return MV;
    }
}
