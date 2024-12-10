package klu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import klu.model.Aminity;
import klu.model.AminityManager;

@RestController
@RequestMapping("/aminity")
public class AminityController {

    @Autowired
    AminityManager AM;

    @PostMapping("/save")
    public String saveAminity(@RequestBody Aminity A) {
        return AM.addAminity(A);
    }

    @GetMapping("/read")
    public List<Aminity> readAminity() {
        return AM.getAminities();
    }


    @PutMapping("/update")
    public String updateAminity(@RequestBody Aminity A) {
        return AM.updateAminity(A);
    }

    @DeleteMapping("/delete")
    public String deleteAminity(@RequestParam("ID") Long id) {
        return AM.deleteAminity(id);
    }
}
