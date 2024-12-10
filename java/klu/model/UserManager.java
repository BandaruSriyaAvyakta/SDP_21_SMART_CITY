package klu.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import klu.repository.UserRepository;

@Service
public class UserManager {

    @Autowired
    private UserRepository userRepository;

    // Method to save new user
    public String saveUser(User user) {
        try {
            // Check if username already exists
            if (userRepository.validateUsername(user.getUsername()) > 0)
                throw new Exception("Username already existed!");
            
            // Save the new user in the repository
            userRepository.save(user);
            return "New User has been added";
        } catch (Exception e) {
            return e.getMessage();
        }
    }

    // Method to validate user credentials during login
    public String loginUser(String uname, String pwd) {
        try {
            if (userRepository.validateCredentials(uname, pwd) == 0)
                throw new Exception("401"); // Unauthorized error

            return "200"; // Success
        } catch (Exception e) {
            return e.getMessage();
        }
    }
}
