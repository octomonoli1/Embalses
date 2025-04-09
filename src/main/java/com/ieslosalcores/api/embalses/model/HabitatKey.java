package com.ieslosalcores.api.embalses.model;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.Data;

@Data
@Embeddable
public class HabitatKey {
    @Column(name="embalse")
    private int embalseId;
    @Column(name="especie")
    private int especie;
}
