package com.ieslosalcores.api.embalses.services;

import com.ieslosalcores.api.embalses.model.Embalse;
import com.ieslosalcores.api.embalses.model.Especie;
import com.ieslosalcores.api.embalses.model.Habitat;
import com.ieslosalcores.api.embalses.repositories.HabitatRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class HabitatService {

    @Autowired
    private HabitatRepository habitatRepository;

    public List<Habitat> findAll(){
        return this.habitatRepository.findAll();
    }

    public List<Especie> especiesByEmbalse(int embalseId) {
        return new ArrayList<>(this.habitatRepository.findEspeciesByEmbalse(embalseId));
    }

    public List<Embalse> embalsesByEspecie(int especieId) {
        return new ArrayList<>(this.habitatRepository.findEmbalsesByEspecie(especieId));
    }


}
