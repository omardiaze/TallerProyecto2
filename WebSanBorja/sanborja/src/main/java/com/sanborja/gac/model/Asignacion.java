/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sanborja.gac.model;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Marlon Cordova
 */
@Entity
@Table(name = "asignacion")
public class Asignacion {
    
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "idAsignacion")
    private Integer idAsignacion;
     
    @Column(name = "observacion")
    private String observacion;
    
    @Column(name="fecha")    
    private Timestamp fecha;
    
    @Column(name = "idSolicitudQR")
    private Integer idSolicitudQR;

    @Column(name = "idPersona")
    private Integer idPersona;
     
    /**
     * @return the idAsignacion
     */
    public Integer getIdAsignacion() {
        return idAsignacion;
    }

    /**
     * @param idAsignacion the idAsignacion to set
     */
    public Asignacion setIdAsignacion(Integer idAsignacion) {
        this.idAsignacion = idAsignacion;return this;
    }

    /**
     * @return the observacion
     */
    public String getObservacion() {
        return observacion;
    }

    /**
     * @param observacion the observacion to set
     */
    public Asignacion setObservacion(String observacion) {
        this.observacion = observacion;return this;
    }

    /**
     * @return the fecha
     */
    public Timestamp getFecha() {
        return fecha;
    }

    /**
     * @param fecha the fecha to set
     */
    public Asignacion setFecha(Timestamp fecha) {
        this.fecha = fecha;return this;
    }

    /**
     * @return the idSolicitudQR
     */
    public Integer getIdSolicitudQR() {
        return idSolicitudQR;
    }

    /**
     * @param idSolicitudQR the idSolicitudQR to set
     */
    public Asignacion setIdSolicitudQR(Integer idSolicitudQR) {
        this.idSolicitudQR = idSolicitudQR;return this;
    }

    /**
     * @return the idPersona
     */
    public Integer getIdPersona() {
        return idPersona;
    }

    /**
     * @param idPersona the idPersona to set
     */
    public Asignacion setIdPersona(Integer idPersona) {
        this.idPersona = idPersona;return this;
    }
    
    
    
}
