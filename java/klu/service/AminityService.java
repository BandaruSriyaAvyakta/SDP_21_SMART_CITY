package klu.service;

import klu.model.Aminity;
import klu.repository.AminityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AminityService {

    @Autowired
    private AminityRepository aminityRepository;

    public List<Aminity> getAllAminities() {
        return aminityRepository.findAll();
    }

    public Aminity getAminityById(Long id) {
        Optional<Aminity> aminity = aminityRepository.findById(id);
        return aminity.orElse(null); // Return null if not found
    }
}
