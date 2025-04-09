package com.ieslosalcores.api.embalses.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class Habitat {

    @JoinColumn(name ="especie")
    @ManyToOne(fetch = FetchType.EAGER)
    private Especie especie;

    @JoinColumn(name="embalse")
    @ManyToOne(fetch = FetchType.EAGER)
    private Embalse embalse;

}
