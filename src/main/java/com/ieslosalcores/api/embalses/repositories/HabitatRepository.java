package com.ieslosalcores.api.embalses.repositories;

import com.ieslosalcores.api.embalses.model.Embalse;
import com.ieslosalcores.api.embalses.model.Especie;
import com.ieslosalcores.api.embalses.model.Habitat;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Collection;
import java.util.List;

public interface HabitatRepository extends JpaRepository<Habitat, Long> {

    @Query("select h.especie from Habitat h where h.embalse.id = :embalseId")
    List<Especie> findEspeciesByEmbalse(@Param("embalseId") int embalseId);

    @Query("select h.embalse from Habitat h where h.especie.id = :especieId")
    List<Embalse> findEmbalsesByEspecie(@Param("especieId") int especieId);

}
