package com.lgr.controller;

import com.lgr.pojo.Boat;
import com.lgr.service.BoatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@CrossOrigin
@RestController
@RequestMapping("boat")
public class BoatController {

    @Autowired
    BoatService boatService;

    @PostMapping("boatList")
    public Map<String ,Object> boatList(@RequestBody Boat boat){
        return boatService.boatList(boat);
    }

    @PostMapping("boatAdd")
    public Map<String ,Object> boatAdd(@RequestBody Boat boat){
        return boatService.boatAdd(boat);
    }

    @PostMapping("boatEdit")
    public Map<String ,Object> boatEdit(@RequestBody Boat boat){
        return boatService.boatEdit(boat);
    }

    @PostMapping("boatDel")
    public Map<String ,Object> boatDel(@RequestBody Boat boat){
        return boatService.boatDel(boat);
    }

}
