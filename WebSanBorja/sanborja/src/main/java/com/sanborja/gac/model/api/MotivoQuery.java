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
public class MotivoQuery {
    private Integer id;   
    private String codigo;  
    private String nombre;
    private String estado; /**
     * @return the id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public MotivoQuery setId(Integer id) {
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
    public MotivoQuery setCodigo(String codigo) {
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
    public MotivoQuery setNombre(String nombre) {
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
    public MotivoQuery setEstado(String estado) {
        this.estado = estado;
        return this;
    }
    
    public MotivoQuery(){}
    
    public MotivoQuery(int id,String codigo, String nombre,String estado){
        this.id=id;
        this.codigo=codigo;
        this.nombre = nombre;
        this.estado= estado;
    }
    
}
