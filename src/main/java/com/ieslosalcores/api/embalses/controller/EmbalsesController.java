package com.ieslosalcores.api.embalses.controller;

import com.ieslosalcores.api.embalses.client.ApiClient;
import com.ieslosalcores.api.embalses.model.Embalse;
import com.ieslosalcores.api.embalses.services.EmbalseService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@AllArgsConstructor
@RequestMapping("/embalse")
public class EmbalsesController {

    @Autowired
    private EmbalseService embalseService;

    @Autowired
    private ApiClient apiClient;

    @GetMapping
    public ResponseEntity<List<Embalse>> list(){
        return ResponseEntity.ok(this.embalseService.findAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Embalse> findById(@PathVariable("id") long id){
        return this.embalseService.findById(id).map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.noContent().build());
    }

    @PostMapping("/sync")
    public ResponseEntity<List<Embalse>> syncEmbalse(){
        List<Embalse> result =  this.apiClient.getEmbalseData();
        this.embalseService.updateAll(result, this.apiClient.getEstadoEmbalse());
        return ResponseEntity.ok(this.embalseService.findAll());
    }
}
