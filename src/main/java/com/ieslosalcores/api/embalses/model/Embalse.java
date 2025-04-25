package com.ieslosalcores.api.embalses.model;

import com.fasterxml.jackson.annotation.JsonProperty;
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
    @JsonProperty("fid")
    private long id;
    @JsonProperty("cod_est")
    private String localizador;
    private String tipo;
    private String nombre;
    private double capacidad;
    private double capacidadActual;
    private String provincia;
    private String sistema;
    @JsonProperty("dist_dem")
    private String cuenca;
    @JsonProperty("nombre_rio")
    private String rio;
    @JsonProperty("nom_pres")
    private String presa;


}
