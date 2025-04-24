package com.ieslosalcores.api.embalses.client;

import com.ieslosalcores.api.embalses.model.Embalse;
import lombok.AllArgsConstructor;
import org.apache.coyote.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
@AllArgsConstructor
public class ApiClient {

    @Autowired
    public RestTemplate restTemplate;

    private final String embalsesDataUrl = "https://portalrediam.cica.es/embalses/api/json/embalses";
    private final String estadoEmbalsesFecha = "https://portalrediam.cica.es/embalses/api/json/andalucia";

    public List<Embalse> getEmbalseData(){
        return restTemplate.exchange(embalsesDataUrl, HttpMethod.GET, null,
                new ParameterizedTypeReference<List<Embalse>>() {}
        ).getBody();
    }

    public Map<String,Object> getEstadoEmbalse(){
        Date ayer = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(ayer);
        calendar.add(Calendar.DAY_OF_MONTH, -1);
        ayer = calendar.getTime();

        String pattern = "yyyy-MM-dd";
        SimpleDateFormat formatter = new SimpleDateFormat(pattern);
        return restTemplate.exchange(estadoEmbalsesFecha + "/" + formatter.format(ayer), HttpMethod.GET, null,
                new ParameterizedTypeReference<Map<String,Object>>() {}
        ).getBody();
    }

}
