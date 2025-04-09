package com.ieslosalcores.api.embalses.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class Localidad {

    @Id
    private int codPostal;
    private String nombre;

    @JoinColumn(name ="provincia")
    @ManyToOne(fetch = FetchType.EAGER)
    private Provincia provincia;
}
