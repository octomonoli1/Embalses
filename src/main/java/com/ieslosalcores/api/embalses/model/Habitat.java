package com.ieslosalcores.api.embalses.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class Habitat {

    @EmbeddedId
    @JsonIgnore
    private HabitatKey id;

    @JoinColumn(name ="especie", insertable=false, updatable=false)
    @ManyToOne(fetch = FetchType.EAGER)
    private Especie especie;

    @JoinColumn(name="embalse",  insertable=false, updatable=false)
    @ManyToOne(fetch = FetchType.EAGER)
    private Embalse embalse;

}
