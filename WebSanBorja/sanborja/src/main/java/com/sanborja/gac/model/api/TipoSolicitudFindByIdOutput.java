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
public class TipoSolicitudFindByIdOutput extends Base{
    private int id;
    private String codigo;	
    private String nombre;
    private int estado;

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public TipoSolicitudFindByIdOutput setId(int id) {
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
    public TipoSolicitudFindByIdOutput setCodigo(String codigo) {
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
    public TipoSolicitudFindByIdOutput setNombre(String nombre) {
        this.nombre = nombre;
        return this;
    }

    /**
     * @return the estado
     */
    public int getEstado() {
        return estado;
    }

    /**
     * @param estado the estado to set
     */
    public TipoSolicitudFindByIdOutput setEstado(int estado) {
        this.estado = estado;
        return this;
    }
    
}