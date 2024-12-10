// AdminManager.java
package klu.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import klu.repository.AdminRepository;

@Service
public class AdminManager {
    
    @Autowired
    private AdminRepository adminRepository;

    public String loginAdmin(String uname, String pwd) {
        try {
            if (adminRepository.validateAdminCredentials(uname, pwd) == 0)
                throw new Exception("401");
            return "200"; // Successful login
        } catch (Exception e) {
            return e.getMessage(); // Error message if login fails
        }
    }
}