package com.xmltopdf.service;

import org.springframework.stereotype.Service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.InvalidPathException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Service
public class DeleteService {

    private static Object apply(Path f) {
        try {
            Files.delete(f.toAbsolutePath());
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }


    public String deleteHtmlFiles(String path) {
        if (isValidPath(path)) {
            try {
                Stream<Path> htmlPath = Files.walk(Paths.get(path));
                Stream<Path> xhtmlPath = Files.walk(Paths.get(path));


                htmlPath
                        .filter(f -> f.toString().endsWith(".html"))
                        .map(DeleteService::apply);

                xhtmlPath
                        .filter(f -> f.toString().endsWith(".xhtml"))
                        .map(DeleteService::apply);


            } catch (IOException ioe) {
                ioe.printStackTrace();
            }
        }

        return "Deleted";
    }


    private static boolean isValidPath(String path) {
        try {
            Paths.get(path);
        } catch (InvalidPathException | NullPointerException ex) {
            return false;
        }
        return true;
    }
}
