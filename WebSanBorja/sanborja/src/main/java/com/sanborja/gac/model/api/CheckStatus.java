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
public class CheckStatus {
    private String id ;
    private String apistatus ;
    private String apimessage ;
    private String codigo;

    public CheckStatus() {
            this.id="";
            this.apistatus="";
            this.apimessage="";
            this.codigo="";
    }

    public CheckStatus(String id,String apistatus,String apimessage, String codigo) {
            this.id=id;
            this.apistatus=apistatus;
            this.apimessage=apimessage;
            this.codigo = codigo;
    }

    public String getId() {
            return id;
    }
    public void setId(String id) {
            this.id = id;
    }
    public String getApistatus() {
            return apistatus;
    }
    public void setApistatus(String apistatus) {
            this.apistatus = apistatus;
    }
    public String getApimessage() {
            return apimessage;
    }
    public void setApimessage(String apimessage) {
            this.apimessage = apimessage;
    }

    public String getCodigo() {
            return codigo;
    }
    public void setCodigo(String codigo) {
            this.codigo = codigo;
    }
}