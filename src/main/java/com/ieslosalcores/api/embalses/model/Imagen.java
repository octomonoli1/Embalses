package com.ieslosalcores.api.embalses.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class Imagen {

    @Id
    private int id;
    private String nombre;
    private String url;

}
