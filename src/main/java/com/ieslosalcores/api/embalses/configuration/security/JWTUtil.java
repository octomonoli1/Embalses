package com.ieslosalcores.api.embalses.configuration.security;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import javax.crypto.SecretKey;
import java.util.Date;
import java.util.function.Function;

@Component
public class JWTUtil {

    @Value("${jwt.expiration}")
    private int jwtExpiration;

    public String generateToken(Authentication authentication) {
        UserDetails principal = (UserDetails) authentication.getPrincipal();

        return Jwts.builder()
                .subject(principal.getUsername())
                .issuedAt(new Date())
                .expiration(new Date(System.currentTimeMillis() + this.jwtExpiration))
                .signWith(getSigningKey())
                .compact();
    }

    private SecretKey getSigningKey(){
        return Jwts.SIG.HS256.key().build();
    }

    public boolean isTokenValid(String token, UserDetails userDetails) {
        String username = extractUsername(token);
        boolean isExpired = extractExpiration(token).before(new Date());

        return username.equals(userDetails.getUsername()) && !isExpired;
    }

    private <T> T getClaim(String token, Function<Claims, T> claimsResolver) {
        Claims payload = Jwts.parser()
                .verifyWith(getSigningKey())
                .build()
                .parseSignedClaims(token)
                .getPayload();

        return claimsResolver.apply(payload);
    }

    public String extractUsername(String token) {
        return getClaim(token, Claims::getSubject);
    }

    public Date extractExpiration(String token){
        return getClaim(token, Claims::getExpiration);
    }
}
