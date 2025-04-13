package com.ieslosalcores.api.embalses.configuration.security;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import java.security.Key;
import java.util.Date;

@Component
public class JWTUtil {
    private final String jwtSecret = "01234567890";
    private final int jwtExpiration = 1000*60*5;

    public String generateToken(Authentication authentication) {
        UserDetails principal = (UserDetails) authentication.getPrincipal();

        return Jwts.builder()
                .subject(principal.getUsername())
                .issuedAt(new Date())
                .expiration(new Date(System.currentTimeMillis() + this.jwtExpiration)) // 10 horas
                .signWith(getSigningKey())
                .compact();
    }

    private Key getSigningKey(){
        byte[] keyBytes = Decoders.BASE64.decode(this.jwtSecret);
        return Keys.hmacShaKeyFor(keyBytes);
    }
}
