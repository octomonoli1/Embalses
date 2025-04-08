package com.ieslosalcores.api.embalses.services;

import com.ieslosalcores.api.embalses.model.Embalse;
import com.ieslosalcores.api.embalses.repositories.EmbalseRepository;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class EmbalseService {

    @Autowired
    private EmbalseRepository embalseRepository;

    public List<Embalse> findAll(){
        return null;
    }

}
