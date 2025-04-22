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
    private String localizador;
    private String tipo;
    private String nombre;
    private double capacidad;
    private double capacidadActual;
    private String provincia;
    private String sistema;
    private String cuenca;
    private String rio;
    private String localizacion;
    private String presa;


}
