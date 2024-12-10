package klu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import klu.model.City;

@Repository
public interface CityRepository extends JpaRepository<City, Long> {

    @Query("select count(C) from City C where C.id=:id")
    public Long getCityID(@Param("id") Long id);
}
