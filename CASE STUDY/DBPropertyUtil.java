package util;

import java.io.*;
import java.util.*;

public class DBPropertyUtil {
    public static String getPropertyString(String fileName) {
        try (InputStream input = new FileInputStream(fileName)) {
            Properties prop = new Properties();
            prop.load(input);
            return "jdbc:mysql://" + prop.getProperty("host") + ":" +
                   prop.getProperty("port") + "/" +
                   prop.getProperty("dbname") +
                   "?user=" + prop.getProperty("user") +
                   "&password=" + prop.getProperty("password");
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}