package klu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/aminity")
public class MVCController {

    @GetMapping("/")
    public ModelAndView aminity() {
        ModelAndView mvc = new ModelAndView();
        mvc.setViewName("aminity.jsp"); // Update the JSP name to aminity.jsp
        return mvc;
    }
}
