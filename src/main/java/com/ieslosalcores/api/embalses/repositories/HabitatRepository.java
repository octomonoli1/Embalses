package com.ieslosalcores.api.embalses.repositories;

import com.ieslosalcores.api.embalses.model.Habitat;
import org.springframework.data.jpa.repository.JpaRepository;

public interface HabitatRepository extends JpaRepository<Habitat, Long> {
}
