package klu.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import klu.repository.AminityRepository;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

@Service
public class AminityManager {

    @Autowired
    AminityRepository AR;

    public String addAminity(Aminity A) {
        if (AR.existsById(A.getId())) {
            Map<String, String> resp = new HashMap<>();
            resp.put("code", "401");
            resp.put("msg", "Aminity ID already exists!");
            return toJSON(resp);
        }
        AR.save(A);
        Map<String, String> resp = new HashMap<>();
        resp.put("code", "200");
        resp.put("msg", "New aminity added successfully!");
        return toJSON(resp);
    }

    public List<Aminity> getAminities() {
        return AR.findAll();
    }

    public String updateAminity(Aminity A) {
        AR.save(A);
        Map<String, String> resp = new HashMap<>();
        resp.put("code", "200");
        resp.put("msg", "Aminity data has been updated!");
        return toJSON(resp);
    }

    public String deleteAminity(Long id) {
        AR.deleteById(id);
        Map<String, String> resp = new HashMap<>();
        resp.put("code", "200");
        resp.put("msg", "Aminity has been deleted!");
        return toJSON(resp);
    }

    private String toJSON(Object obj) {
        GsonBuilder GB = new GsonBuilder();
        Gson G = GB.create();
        return G.toJson(obj);
    }
}
