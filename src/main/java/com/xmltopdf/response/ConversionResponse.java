package com.xmltopdf.response;

public class ConversionResponse {
    public ConversionResponse(String conversionLog) {

        this.conversionLog = conversionLog;
    }

   private String conversionLog;


    public String getConversionLog() {
        return conversionLog;
    }

    public void setConversionLog(String conversionLog) {
        this.conversionLog = conversionLog;
    }

}
