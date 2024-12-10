package klu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import klu.model.City;
import klu.model.CityManager;

@RestController
@RequestMapping("/city")
public class CityController {

    @Autowired
    CityManager CM;

    @PostMapping("/save")
    public String saveCity(@RequestBody City C) {
        return CM.addCity(C);
    }

    @GetMapping("/read")
    public String readCities() {
        return CM.getCities().toString();
    }

    @PutMapping("/update")
    public String updateCity(@RequestBody City C) {
        return CM.updateCity(C);
    }

    @DeleteMapping("/delete")
    public String deleteCity(@RequestParam("ID") Long id) {
        return CM.deleteCity(id);
    }
}
