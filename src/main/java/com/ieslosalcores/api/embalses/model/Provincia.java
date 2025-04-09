package com.ieslosalcores.api.embalses.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class Provincia {

    @Id
    private int cod;
    private String nombre;

    @JoinColumn(name ="comunidad")
    @ManyToOne(fetch = FetchType.EAGER)
    private ComunidadAutonoma comunidadAutonoma;
}
