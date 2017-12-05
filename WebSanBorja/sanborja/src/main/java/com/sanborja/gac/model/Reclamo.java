/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sanborja.gac.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Marlon Cordova
 */
@Entity
@Table(name = "reclamo")
public class Reclamo {
    
    @Id  
    @Column(name = "idSolicitudQR")
    private Integer idSolicitudQR;
    
    @Column(name = "numero")
    private String numero;
    
    @Column(name = "codigoSirec")
    private String codigoSirec;

    /**
     * @return the idSolicitudQR
     */
    public Integer getIdSolicitudQR() {
        return idSolicitudQR;
    }

    /**
     * @param idSolicitudQR the idSolicitudQR to set
     */
    public Reclamo setIdSolicitudQR(Integer idSolicitudQR) {
        this.idSolicitudQR = idSolicitudQR;
        return this;
    }

    /**
     * @return the numero
     */
    public String getNumero() {
        return numero;
    }

    /**
     * @param numero the numero to set
     */
    public Reclamo setNumero(String numero) {
        this.numero = numero;
        return this;
    }

    /**
     * @return the codigoSirec
     */
    public String getCodigoSirec() {
        return codigoSirec;
    }

    /**
     * @param codigoSirec the codigoSirec to set
     */
    public Reclamo setCodigoSirec(String codigoSirec) {
        this.codigoSirec = codigoSirec;
        return this;
    }
    
    
}
