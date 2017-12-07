/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sanborja.gac.services;

import java.io.IOException;

import java.io.*;
import java.net.InetAddress;
import java.util.Properties;
import java.util.Date;

import javax.mail.*;

import javax.mail.internet.*;

import com.sun.mail.smtp.*;
/**
 *
 * @author Marlon Cordova
 */
public class SendMailService {
    
    public void Send(String mail,String tipo,String numero,String persona, String codigo) throws IOException, AddressException, MessagingException{
 
        final String fromEmail = "systemnotification@smilereference.com";//"marloncordova@outlook.com"; //requires valid gmail id
        final String password = "gCb2TQcR7YzAOP1U";//"zaDK13LMs9COJNb7"; // correct password for gmail id


        System.out.println("TLSEmail Start");
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp-relay.sendinblue.com"); //SMTP Host
        props.put("mail.smtp.port", "587"); //TLS Port
        props.put("mail.smtp.auth", "true"); //enable authentication
        props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS

        //create Authenticator object to pass in Session.getInstance argument
        Authenticator auth = new Authenticator() {
                //override the getPasswordAuthentication method
                protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(fromEmail, password);
                }
        };
        Session session = Session.getInstance(props, auth);
        
        StringBuilder sb=new StringBuilder();
        sb.append("Estimado(a) "+ persona+", usted acaba de registrar ");
        
        if(tipo.equals("reclamo")){
            sb.append("el reclamo número " +numero );
        }else if(tipo.equals("queja")){
            sb.append("la queja número " +numero );
        }
         sb.append(" en nuestra plataforma. <a href=\"https://www.youtube.com/watch?v=dQw4w9WgXcQ\"> Ingrese aquí</a> para saber nuestra respuesta.<br><br> Atte. Oficina Gestión de Atención al Cuidadano");
       
        EmailUtil.sendEmail(session, mail,"Se registro su "+ tipo+" satisfactoriamente",sb.toString());
         
        
    }
}
