/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sanborja.gac.model.api;

import java.util.Date;

/**
 *
 * @author Marlon Cordova
 */
public class SolicitudQuery {
    
    private int id;
    private String numero;
    private String tipo;
    private int idTipo;
    private String solicitante;
    private int idMotivo;
    private String motivo;
    private String estado;
    private String fechaCreacion;
    private String fechaLimite;

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public SolicitudQuery setId(int id) {
        this.id = id;
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
    public SolicitudQuery setNumero(String numero) {
        this.numero = numero;
        return this;
    }

    /**
     * @return the tipo
     */
    public String getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public SolicitudQuery setTipo(String tipo) {
        this.tipo = tipo;
        return this;
    }

    /**
     * @return the idTipo
     */
    public int getIdTipo() {
        return idTipo;
    }

    /**
     * @param idTipo the idTipo to set
     */
    public SolicitudQuery setIdTipo(int idTipo) {
        this.idTipo = idTipo;
        return this;
    }

    /**
     * @return the solicitante
     */
    public String getSolicitante() {
        return solicitante;
    }

    /**
     * @param solicitante the solicitante to set
     */
    public SolicitudQuery setSolicitante(String solicitante) {
        this.solicitante = solicitante;
        return this;
    }

    /**
     * @return the idMotivo
     */
    public int getIdMotivo() {
        return idMotivo;
    }

    /**
     * @param idMotivo the idMotivo to set
     */
    public SolicitudQuery setIdMotivo(int idMotivo) {
        this.idMotivo = idMotivo;
        return this;
    }

    /**
     * @return the motivo
     */
    public String getMotivo() {
        return motivo;
    }

    /**
     * @param motivo the motivo to set
     */
    public SolicitudQuery setMotivo(String motivo) {
        this.motivo = motivo;
        return this;
    }

    /**
     * @return the estado
     */
    public String getEstado() {
        return estado;
    }

    /**
     * @param estado the estado to set
     */
    public SolicitudQuery setEstado(String estado) {
        this.estado = estado;
        return this;
    }

    /**
     * @return the fechaCreacion
     */
    public String getFechaCreacion() {
        return fechaCreacion;
    }

    /**
     * @param fechaCreacion the fechaCreacion to set
     */
    public SolicitudQuery setFechaCreacion(String fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
        return this;
    }

    /**
     * @return the fechaLimite
     */
    public String getFechaLimite() {
        return fechaLimite;
    }

    /**
     * @param fechaLimite the fechaLimite to set
     */
    public SolicitudQuery setFechaLimite(String fechaLimite) {
        this.fechaLimite = fechaLimite;
        return this;
    }
    
    
}
