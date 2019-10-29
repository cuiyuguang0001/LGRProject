package com.lgr.controller;

import com.lgr.pojo.Boat;
import com.lgr.service.BoatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@CrossOrigin
@RestController
@RequestMapping("boat")
public class BoatController {

    @Autowired
    BoatService boatService;

    @PostMapping("boatList")
    public Map<String ,Object> boatList(Boat boat){
        return boatService.boatList(boat);
    }

}
