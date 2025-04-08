package com.ieslosalcores.api.embalses.repositories;

import com.ieslosalcores.api.embalses.model.Embalse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EmbalseRepository extends JpaRepository<Embalse, Long> {
}
