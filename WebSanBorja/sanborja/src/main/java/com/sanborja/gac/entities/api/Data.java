/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sanborja.gac.entities.api;

import java.util.List;
/**
 *
 * @author Marlon Cordova
 */
public class Data<T> {
    private String apistatus ;
    private String apimessage;
    private List<T> data;

    public String getApistatus() {
            return apistatus;
    }
    public Data<T> setApistatus(String apistatus) {
            this.apistatus = apistatus;
            return this;
    }
    public String getApimessage() {
            return apimessage;
    }
    public Data<T> setApimessage(String apimessage) {
            this.apimessage = apimessage;
            return this;
    }
    public List<T> getData() {
            return data;
    }
    public Data<T> setData(List<T> data) {
            this.data = data;
            return this;
    }

    public Data() {
            apistatus ="";
            apimessage="";
            data=null;
    }
}
