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
@Table(name = "queja")
public class Queja {
    
    @Id  
    @Column(name = "idSolicitudQR")
    private Integer idSolicitudQR;
    
    @Column(name = "numero")
    private String numero;
    
      /**
     * @return the idSolicitudQR
     */
    public Integer getIdSolicitudQR() {
        return idSolicitudQR;
    }

    /**
     * @param idSolicitudQR the idSolicitudQR to set
     */
    public Queja setIdSolicitudQR(Integer idSolicitudQR) {
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
    public Queja setNumero(String numero) {
        this.numero = numero;
        return this;
    }
 
}
