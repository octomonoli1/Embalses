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

    private final String embalsesDataUrl = "https://portalrediam.cica.es/embalses/api/json/";

    public List<Embalse> getEmbalseData(){
        return restTemplate.exchange(embalsesDataUrl + "/embalses", HttpMethod.GET, null,
                new ParameterizedTypeReference<List<Embalse>>() {}
        ).getBody();
    }

    public Map<String,Object> getEstadoEmbalse(){

        Map<String,Object> result = restTemplate.exchange(embalsesDataUrl + "/andalucia/" + calculaAyer(), HttpMethod.GET, null,
                new ParameterizedTypeReference<Map<String,Object>>() {}
        ).getBody();

        if(result!=null){
            result.remove("fecha");
            result.remove("fid");
        }

        return result;
    }

    private String calculaAyer(){
        Date hoy = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(hoy);
        calendar.add(Calendar.DAY_OF_MONTH, -1);
        hoy = calendar.getTime();

        String pattern = "yyyy-MM-dd";
        SimpleDateFormat formatter = new SimpleDateFormat(pattern);

        return formatter.format(hoy);
    }

}
