package com.ieslosalcores.api.embalses.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class Embalse {

    @Id
    private long id;
    private String nombre;
    private double capacidad;
    private double porcentajeActual;
    private boolean esNavegable;

    @JoinColumn(name = "tipoPresa")
    @ManyToOne(fetch = FetchType.EAGER)
    private TipoPresa tipoPresa;

    @JoinColumn(name ="localidad")
    @ManyToOne(fetch = FetchType.EAGER)
    private Localidad localidad;

    @JoinColumn(name ="imagen")
    @ManyToOne(fetch = FetchType.EAGER)
    private Imagen imagen;

}
