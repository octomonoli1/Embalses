package com.ieslosalcores.api.embalses.services;

import com.ieslosalcores.api.embalses.model.Embalse;
import com.ieslosalcores.api.embalses.repositories.EmbalseRepository;
import jakarta.persistence.EntityManager;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;

import static org.springframework.data.jpa.domain.AbstractPersistable_.id;

@Service
@AllArgsConstructor
public class EmbalseService {

    @Autowired
    private EmbalseRepository embalseRepository;

    public List<Embalse> findAll(){
        return embalseRepository.findAll();
    }

    public Optional<Embalse> findById(final long id){
        return embalseRepository.findById(id);
    }

    public void updateAll(List<Embalse> embalses, Map<String, Object> estados){

        embalses.forEach(embalse -> {
            embalse.setCapacidadActual(Double.parseDouble(estados.get(embalse.getLocalizador()).toString()));
            embalseRepository.save(embalse);
        });
    }


}
