package com.torneodefutbol.controllers;

import com.torneodefutbol.dominio.Futbol;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Usuario on 09/01/2018.
 */
@Controller
public class HomeController {


    @RequestMapping(value = "/home", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody List<Futbol> homeController() {

        List<Futbol> futbolList = new ArrayList<Futbol>();

        Futbol futbol = new Futbol(10,20);
        Futbol futbol2 = new Futbol(10,20);
        Futbol futbol3 = new Futbol(10,20);

        futbolList.add(futbol);
        futbolList.add(futbol2);
        futbolList.add(futbol3);

        return futbolList;
    }
}
