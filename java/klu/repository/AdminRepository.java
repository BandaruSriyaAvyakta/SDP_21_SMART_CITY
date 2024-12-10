package klu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import klu.model.Admin;

@Repository
public interface AdminRepository extends JpaRepository<Admin, Long> {
    
    @Query("select count(a) from Admin a where a.username = :uname and a.password = :pwd")
    public int validateAdminCredentials(@Param("uname") String uname, @Param("pwd") String pwd);
}
