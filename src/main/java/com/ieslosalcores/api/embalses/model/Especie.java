package com.ieslosalcores.api.embalses.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class Especie {

    @Id
    private int id;
    private String nombreComun;
    private String nombreCientifico;
    private String origen;
    private boolean peligro;
}
