package com.ieslosalcores.api.embalses.services;

import com.ieslosalcores.api.embalses.model.Habitat;
import com.ieslosalcores.api.embalses.repositories.HabitatRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HabitatService {

    @Autowired
    private HabitatRepository habitatRepository;

    public List<Habitat> findAll(){
        return this.habitatRepository.findAll();
    }


}
