package com.ieslosalcores.api.embalses.services;

import com.ieslosalcores.api.embalses.model.Embalse;
import com.ieslosalcores.api.embalses.repositories.EmbalseRepository;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

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

}
