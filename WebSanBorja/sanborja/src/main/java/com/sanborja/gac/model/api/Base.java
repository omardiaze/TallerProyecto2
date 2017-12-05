/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sanborja.gac.model.api;

/**
 *
 * @author Marlon Cordova
 */
public class Base {
    
    private String apistatus ;
    private String apimessage;

    public String getApistatus() {
            return apistatus;
    }
    public Base setApistatus(String apistatus) {
            this.apistatus = apistatus;
            return this;
    }
    public String getApimessage() {
            return apimessage;
    }
    public Base setApimessage(String apimessage) {
            this.apimessage = apimessage;
            return this;
    }

    public Base() {
            apistatus ="";
            apimessage="";
    }
}

