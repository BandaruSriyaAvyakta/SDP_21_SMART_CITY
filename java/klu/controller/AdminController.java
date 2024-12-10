// AdminController.java
package klu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import klu.model.Admin;
import klu.model.AdminManager;

@RestController
@RequestMapping("/admin")
public class AdminController {
    
    @Autowired
    private AdminManager adminManager;

    @PostMapping("/login")
    public String login(@RequestBody Admin admin) {
        return adminManager.loginAdmin(admin.getUsername(), admin.getPassword());
    }
    @GetMapping("/adminhome")
    public ModelAndView adminhome() {
        ModelAndView MV = new ModelAndView();
        MV.setViewName("adminhome");
        return MV;
    }
}