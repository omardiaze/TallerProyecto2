/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sanborja.gac.model.api;

import java.util.List;

/**
 *
 * @author Marlon Cordova
 */
public class AsignacionInput {
    private int idArea;
    private int idEmpleado;
    private String observacion;
    private List<Integer> solicitudes;

    /**
     * @return the idEmpleado
     */
    public int getIdEmpleado() {
        return idEmpleado;
    }

    /**
     * @param idEmpleado the idEmpleado to set
     */
    public AsignacionInput setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;return this;
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
    public AsignacionInput setObservacion(String observacion) {
        this.observacion = observacion;return this;
    }

    /**
     * @return the solicitudes
     */
    public List<Integer> getSolicitudes() {
        return solicitudes;
    }

    /**
     * @param solicitudes the solicitudes to set
     */
    public AsignacionInput setSolicitudes(List<Integer> solicitudes) {
        this.solicitudes = solicitudes;return this;
    }

    /**
     * @return the idArea
     */
    public int getIdArea() {
        return idArea;
    }

    /**
     * @param idArea the idArea to set
     */
    public AsignacionInput setIdArea(int idArea) {
        this.idArea = idArea;return this;
    }
    
    
    public AsignacionInput(){
        this.idArea=0;
        this.idEmpleado =0;
        this.observacion = "";
    }
    
}
