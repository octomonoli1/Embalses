package com.ieslosalcores.api.embalses.services;

import com.ieslosalcores.api.embalses.model.User;
import com.ieslosalcores.api.embalses.repositories.UserRepository;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@AllArgsConstructor
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public List<User> findAll(){
        return this.userRepository.findAll();
    }

    public Optional<User> findByUsername(final String username){
        return this.userRepository.findByUsername(username);
    }
}
