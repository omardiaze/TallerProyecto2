/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 *
 * @author Juanka
 */
public class Utils {
    
    public static String formatGetDate(String date){
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try{
           String dateInString = date.substring(0,19);
           return new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(formatter.parse(dateInString));
        }
        catch (ParseException|NullPointerException e){
           return date;
        }
    }
    
}
