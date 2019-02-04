package com.xmltopdf.controller;

import com.xmltopdf.service.DeleteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DeleteController {

    @Autowired
    private DeleteService deleteService;

    @DeleteMapping
    public String deleteFiles(@RequestParam("path") String path){
        return deleteService.deleteHtmlFiles(path);
    }

}
