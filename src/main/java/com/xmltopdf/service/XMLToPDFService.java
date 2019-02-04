package com.xmltopdf.service;

import com.xmltopdf.response.ConversionResponse;
import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.w3c.tidy.Tidy;
import org.xhtmlrenderer.pdf.ITextRenderer;

import javax.xml.transform.*;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.InvalidPathException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Service
public class XMLToPDFService {

    public ResponseEntity<ConversionResponse> convertToPDF(String path) {

        if (isValidPath(path)) {
            try {
                //noinspection SpellCheckingInspection
                Stream<Path> pathForXmls = Files.walk(Paths.get(path));
                //noinspection SpellCheckingInspection
                Stream<Path> pathForXsls = Files.walk(Paths.get(path));


                List<String> xmlFiles = pathForXmls
                        .filter(f -> f.toString().endsWith(".xml"))
                        .map(f -> Files.isDirectory(f) ? f.toString() + "/" : f.toString()).collect(Collectors.toList());
                HashMap<String, String> xmlMap = new HashMap<>();
                for (String xml : xmlFiles) {
                    xmlMap.put(Paths.get(xml).getParent().toString(), xml);
                }


                List<String> xslFiles = pathForXsls
                        .filter(f -> f.toString().endsWith(".xsl"))
                        .map(f -> Files.isDirectory(f) ? f.toString() + "/" : f.toString()).collect(Collectors.toList());

                HashMap<String, String> xslMap = new HashMap<>();
                for (String xsl : xslFiles) {
                    xslMap.put(Paths.get(xsl).getParent().toString(), xsl);
                }


                if (xmlFiles.size() > 0 && xslFiles.size() > 0) {

                    for (Map.Entry<String, String> entry : xmlMap.entrySet()) {
                        String htmlFile = entry.getValue().replace(".xml", ".html");
                        String xHtmlFile = entry.getValue().replace(".xml", ".xhtml");
                        String pdfFileName = entry.getValue().replace(".xml", ".pdf");

                        String xhtml = convertXMLToXHTML(entry.getValue(), xslMap.get(entry.getKey()), htmlFile, xHtmlFile);

                        if (xhtml != null) {
                            createPDF(new File(xhtml), pdfFileName);
                        }
                    }

                } else {
                    return ResponseEntity.status(HttpStatus.NOT_FOUND).body(new ConversionResponse(
                            "This Folder Doesn't Contain Any XML Files or XSL files to Begin Conversion"
                    ));
                }

                return ResponseEntity.ok().body(new ConversionResponse(
                        "Converted " + xmlFiles.size() + "  XML Files to Using " + xslFiles.size() + "  XSL Files In the Folder: " + path
                ));


            } catch (IOException ioe) {
                ioe.printStackTrace();
            }
        } else {

            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new ConversionResponse(
                    "Invalid Path Specified. Conversion Failed"
            ));

            //should create a log File.

        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(new ConversionResponse(
                "Invalid Path Specified. Conversion Failed"
        ));

    }


    private void createPDF(File xhtmlFile, String pdfFileName) {
        try {
            String url = xhtmlFile.toURI().toURL().toString();
            OutputStream os = new FileOutputStream(pdfFileName);

            ITextRenderer renderer = new ITextRenderer();
            renderer.setDocument(url);
            renderer.layout();
            renderer.createPDF(os);

            os.close();
            FileUtils.deleteQuietly(xhtmlFile);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static boolean isValidPath(String path) {
        try {
            Paths.get(path);
        } catch (InvalidPathException | NullPointerException ex) {
            return false;
        }
        return true;
    }

    private String convertXMLToXHTML(String xmlFile,
                                     String xslFile,
                                     String htmlFile,
                                     String xhtmlFile) {
        if (xmlFile != null && xslFile != null) {
            Source xml = new StreamSource(new File(xmlFile));
            Source xsl = new StreamSource(xslFile);

            createHtmlFile(xml, xsl, htmlFile);

            File file = new File(htmlFile);

            try  {
                FileOutputStream fos = new FileOutputStream(xhtmlFile);
                InputStream is = new FileInputStream(file);
                Tidy tidy = new Tidy();
                tidy.setXHTML(true);
                tidy.parse(is, fos);
                fos.close();
                is.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            FileUtils.deleteQuietly(file);
            return xhtmlFile;
        }
        return null;
    }

    private void createHtmlFile(Source xml, Source xslt, String htmlFile) {
        StringWriter sw = new StringWriter();

        try {

            FileWriter fw = new FileWriter(htmlFile);
            TransformerFactory tFactory = TransformerFactory.newInstance();
            Transformer transform = tFactory.newTransformer(xslt);
            transform.transform(xml, new StreamResult(sw));
            fw.write(sw.toString());
            fw.close();


        } catch (IOException | TransformerException | TransformerFactoryConfigurationError e) {
            e.printStackTrace();
        }
    }

}
