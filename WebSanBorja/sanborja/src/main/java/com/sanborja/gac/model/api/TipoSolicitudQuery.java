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
public class TipoSolicitudQuery {
    private Integer id;   
    private String codigo;  
    private String nombre;
    private String estado;
    /**
     * @return the id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public TipoSolicitudQuery setId(Integer id) {
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
    public TipoSolicitudQuery setCodigo(String codigo) {
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
    public TipoSolicitudQuery setNombre(String nombre) {
        this.nombre = nombre;
        return this;
    }
    
    /**
     * @return the nombre
     */
    public String getEstado() {
        return estado;
    }

    /**
     * @param nombre the nombre to set
     */
    public TipoSolicitudQuery setEstado(String estado) {
        this.estado = estado;
        return this;
    }
}
