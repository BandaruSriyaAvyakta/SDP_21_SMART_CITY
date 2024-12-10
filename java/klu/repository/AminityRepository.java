package klu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import klu.model.Aminity;

@Repository
public interface AminityRepository extends JpaRepository<Aminity, Long> {
    // Custom queries if needed
}
