package com.xmltopdf.controller;

import com.xmltopdf.response.ConversionResponse;
import com.xmltopdf.service.XMLToPDFService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class XMLToPDFController {

    @Autowired
    private XMLToPDFService xmlToPDFService;


    @PostMapping("/convert")
    public ResponseEntity<ConversionResponse> convertToPdf(@RequestParam("path") String folderPath){
        return xmlToPDFService.convertToPDF(folderPath);
    }
}
