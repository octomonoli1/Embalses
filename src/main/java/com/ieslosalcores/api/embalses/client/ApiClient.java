package com.ieslosalcores.api.embalses.client;

import com.ieslosalcores.api.embalses.model.Embalse;
import lombok.AllArgsConstructor;
import org.apache.coyote.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.List;

@Service
@AllArgsConstructor
public class ApiClient {

    @Autowired
    public RestTemplate restTemplate;

    private final String embalsesDataUrl = "https://portalrediam.cica.es/embalses/api/json/embalses";

    public List<Embalse> getEmbalseData(){
        return restTemplate.exchange(embalsesDataUrl, HttpMethod.GET, null,
                new ParameterizedTypeReference<List<Embalse>>() {}
        ).getBody();
    }

}
