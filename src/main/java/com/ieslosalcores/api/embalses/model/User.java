package com.ieslosalcores.api.embalses.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class User {

    @Id
    private int id;
    private String username;
    private String password;
    private boolean enabled;

    @JoinColumn(name = "authority")
    @ManyToOne(fetch = FetchType.EAGER)
    private Authority authority;
}
