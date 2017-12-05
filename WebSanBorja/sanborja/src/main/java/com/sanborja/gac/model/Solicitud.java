/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sanborja.gac.model;

import java.io.Serializable;
import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 *
 * @author Marlon Cordova
 */

@Entity
@Table(name = "solicitudqr")
public class Solicitud extends Base implements Serializable{
    
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "idSolicitudQR")
    private Integer idSolicitudQR;
    
    @Column(name = "descripcion")
    private String descripcion;
    
    @Column(name="fechaCreacion")    
    private Timestamp fechaCreacion;
    
    @Column(name="fechaLimite")    
    private Timestamp fechaLimite;
    
    @Column(name = "imagen")
    private String imagen;
    
    @Column(name = "idMotivoQR")
    private Integer idMotivoQR;
            
    @Column(name = "idTipoSolicitud")
    private Integer idTipoSolicitud;
            
    @Column(name = "idPersona")
    private Integer idPersona;
    
    @Transient
    private Solicitante solicitante; 

    /**
     * @return the idSolicitudQR
     */
    public Integer getIdSolicitudQR() {
        return idSolicitudQR;
    }

    /**
     * @param idSolicitudQR the idSolicitudQR to set
     */
    public Solicitud setIdSolicitudQR(Integer idSolicitudQR) {
        this.idSolicitudQR = idSolicitudQR;
        return this;
    }

    /**
     * @return the descripcion
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * @param descripcion the descripcion to set
     */
    public Solicitud setDescripcion(String descripcion) {
        this.descripcion = descripcion;
        return this;
    }

    /**
     * @return the fechaCreacion
     */
    public Timestamp getFechaCreacion() {
        return fechaCreacion;
    }

    /**
     * @param fechaCreacion the fechaCreacion to set
     */
    public Solicitud setFechaCreacion(Timestamp fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
        return this;
    }

    /**
     * @return the fechaLimite
     */
    public Timestamp getFechaLimite() {
        return fechaLimite;
    }

    /**
     * @param fechaLimite the fechaLimite to set
     */
    public Solicitud setFechaLimite(Timestamp fechaLimite) {
        this.fechaLimite = fechaLimite;
        return this;
    }

    /**
     * @return the imagen
     */
    public String getImagen() {
        return imagen;
    }

    /**
     * @param imagen the imagen to set
     */
    public Solicitud setImagen(String imagen) {
        this.imagen = imagen;
        return this;
    }

    /**
     * @return the idMotivoQR
     */
    public Integer getIdMotivoQR() {
        return idMotivoQR;
        
    }

    /**
     * @param idMotivoQR the idMotivoQR to set
     */
    public Solicitud setIdMotivoQR(Integer idMotivoQR) {
        this.idMotivoQR = idMotivoQR;
        return this;
    }

    /**
     * @return the idTipoSolicitud
     */
    public Integer getIdTipoSolicitud() {
        return idTipoSolicitud;
    }

    /**
     * @param idTipoSolicitud the idTipoSolicitud to set
     */
    public Solicitud setIdTipoSolicitud(Integer idTipoSolicitud) {
        this.idTipoSolicitud = idTipoSolicitud;
        return this;
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
    public Solicitud setIdPersona(Integer idPersona) {
        this.idPersona = idPersona;
        return this;
    }

    /**
     * @return the solicitante
     */
    public Solicitante getSolicitante() {
        return solicitante;
    }

    /**
     * @param solicitante the solicitante to set
     */
    public Solicitud setSolicitante(Solicitante solicitante) {
        this.solicitante = solicitante;
        return this;
    }
    
    
    
}
