package klu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import klu.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    // Query to check if username already exists
    @Query("select count(u) from User u where u.username = :uname")
    public int validateUsername(@Param("uname") String uname);
    
    // Query to validate user credentials (username and password)
    @Query("select count(u) from User u where u.username = :uname and u.password = :pwd")
    public int validateCredentials(@Param("uname") String uname, @Param("pwd") String pwd);
}
