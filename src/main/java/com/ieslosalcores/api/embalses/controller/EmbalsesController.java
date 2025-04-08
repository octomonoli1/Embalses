package com.ieslosalcores.api.embalses.controller;

import com.ieslosalcores.api.embalses.model.Embalse;
import com.ieslosalcores.api.embalses.services.EmbalseService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@AllArgsConstructor
@RequestMapping("/embalse")
public class EmbalsesController {

    @Autowired
    private EmbalseService embalseService;

    @GetMapping()
    public ResponseEntity<List<Embalse>> list(){
        return ResponseEntity.ok(this.embalseService.findAll());
    }
}
