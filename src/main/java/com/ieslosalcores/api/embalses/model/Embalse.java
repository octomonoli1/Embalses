package com.ieslosalcores.api.embalses.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@Entity
@AllArgsConstructor
public class Embalse {

    @Id
    private long id;
    private String nombre;
    private double capacidad;
    private double porcentajeActual;
    private boolean esNavegable;

}
