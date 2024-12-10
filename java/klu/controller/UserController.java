package klu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import klu.model.User;
import klu.model.UserManager;

@RestController
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserManager userManager;

    // Endpoint to add a new user
    @PostMapping("/save")
    public String addUser(@RequestBody User user) {
        return userManager.saveUser(user);
    }

    // Endpoint to handle user login
    @PostMapping("/login")
    public String login(@RequestBody User user) {
        return userManager.loginUser(user.getUsername(), user.getPassword());
    }
}
