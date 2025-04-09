package com.ieslosalcores.api.embalses.controller;

import com.ieslosalcores.api.embalses.model.Habitat;
import com.ieslosalcores.api.embalses.services.HabitatService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
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
}
