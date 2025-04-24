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
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @Column(name ="cod_est")
    private String localizador;
    private String tipo;
    private String nombre;
    private double capacidad;
    private double capacidadActual;
    private String provincia;
    private String sistema;
    @Column(name = "dist_dem")
    private String cuenca;
    @Column(name="nombre_rio")
    private String rio;
    private String localizacion;
    @Column(name="nom_pres")
    private String presa;


}
