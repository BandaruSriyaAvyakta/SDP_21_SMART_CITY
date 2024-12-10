package klu.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import klu.repository.CityRepository;

@Service
public class CityManager {

    @Autowired
    CityRepository CR;

    public String addCity(City C) {
        if (CR.getCityID(C.getId()) == 0) {
            CR.save(C); // INSERT OPERATION

            Map<String, String> resp = new HashMap<String, String>();
            resp.put("code", "200");
            resp.put("msg", "New city has been added");
            return toJSON(resp);
        } else {
            Map<String, String> resp = new HashMap<String, String>();
            resp.put("code", "401");
            resp.put("msg", "City ID already exists!");
            return toJSON(resp);
        }
    }

    public List<String> getCities() {
        List<String> cityList = new ArrayList<String>();
        for (City C : CR.findAll()) {
            cityList.add(toJSON(C));
        }
        return cityList;
    }

    public String updateCity(City C) {
        CR.save(C); // UPDATE OPERATION

        Map<String, String> resp = new HashMap<String, String>();
        resp.put("code", "200");
        resp.put("msg", "City data has been updated");
        return toJSON(resp);
    }

    public String deleteCity(Long id) {
        CR.deleteById(id); // DELETE OPERATION

        Map<String, String> resp = new HashMap<String, String>();
        resp.put("code", "200");
        resp.put("msg", "City data has been deleted");
        return toJSON(resp);
    }

    // Convert into JSON
    public String toJSON(Object obj) {
        GsonBuilder GB = new GsonBuilder();
        Gson G = GB.create();
        return G.toJson(obj);
    }
}
