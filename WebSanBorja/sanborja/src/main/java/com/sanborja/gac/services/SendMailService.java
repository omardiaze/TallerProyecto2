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
    
    public void Send(String mail) throws IOException, AddressException, MessagingException{
        Properties props = System.getProperties();
        props.put("mail.smtps.host","smtp-relay.sendinblue.com");
        props.put("mail.smtps.auth","true");
        props.put("mail.smtp.port", "587"); //TLS Port
        props.put("mail.smtp.auth", "true"); //enable authentication
	props.put("mail.smtp.starttls.enable", "true");
        
        Session session = Session.getInstance(props, null);
        
        Message msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress("marloncordova@outlook.com"));
        
        msg.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(mail, false));
        
        msg.setSubject("Heisann "+System.currentTimeMillis());
        msg.setText("Med vennlig hilsennTov Are Jacobsen");
        msg.setHeader("X-Mailer", "Tov Are's program");
        msg.setSentDate(new Date());
        
        SMTPTransport t =
            (SMTPTransport)session.getTransport("smtps");
        
        t.connect("smtp-relay.sendinblue.com",587, "marloncordova@outlook.com", "zaDK13LMs9COJNb7");
        t.sendMessage(msg, msg.getAllRecipients());
        System.out.println("Response: " + t.getLastServerResponse());
        t.close();
        
    }
}
