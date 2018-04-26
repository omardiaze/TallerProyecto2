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
public class TipoSolicitudInput {
    private int id;	
    private String codigo;
    private String nombre;
    private String estado;

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public TipoSolicitudInput setId(int id) {
        this.id = id;
        return this;
    }

    /**
     * @return the codigo
     */
    public String getCodigo() {
        return codigo;
    }

    /**
     * @param codigo the codigo to set
     */
    public TipoSolicitudInput setCodigo(String codigo) {
        this.codigo = codigo;
        return this;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public TipoSolicitudInput setNombre(String nombre) {
        this.nombre = nombre;
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
    public TipoSolicitudInput setEstado(String estado) {
        this.estado = estado;
        return this;
    }
    
    public TipoSolicitudInput(){
        this.id=0;
        this.codigo="";
        this.nombre="";
        this.estado="P";
    }
    
    
	
}
