package com.ieslosalcores.api.embalses.configuration.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

@Configuration
public class EmbalsesConfig {

    @Bean
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }
}
