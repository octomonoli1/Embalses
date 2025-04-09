package com.ieslosalcores.api.embalses.controller;

import com.ieslosalcores.api.embalses.model.Embalse;
import com.ieslosalcores.api.embalses.model.Especie;
import com.ieslosalcores.api.embalses.model.Habitat;
import com.ieslosalcores.api.embalses.services.HabitatService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@AllArgsConstructor
@RequestMapping("/habitat")
public class HabitatController {

    @Autowired
    private HabitatService habitatService;

    @GetMapping
    public ResponseEntity<List<Habitat>> list(){
        return ResponseEntity.ok(this.habitatService.findAll());
    }

    @GetMapping("/embalse/{id}")
    public ResponseEntity<List<Especie>> especiesByEmbalse(@PathVariable("id") int embalseId){
        return ResponseEntity.ok(this.habitatService.especiesByEmbalse(embalseId));
    }

    @GetMapping("/especie/{id}")
    public ResponseEntity<List<Embalse>> embalsesByEspecie(@PathVariable("id") int especieId){
        return ResponseEntity.ok(this.habitatService.embalsesByEspecie(especieId));
    }
}
