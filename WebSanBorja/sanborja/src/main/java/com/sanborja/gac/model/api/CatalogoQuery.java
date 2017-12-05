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
public class CatalogoQuery {
    private int valor;
    private String nombre;

    /**
     * @return the valor
     */
    public int getValor() {
        return valor;
    }

    /**
     * @param valor the valor to set
     */
    public CatalogoQuery setValor(int valor) {
        this.valor = valor;
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
    public CatalogoQuery setNombre(String nombre) {
        this.nombre = nombre;
        return this;
    }
    
    public  CatalogoQuery(){}
    
    public CatalogoQuery (int valor,String nombre ){
        this.valor = valor;
        this.nombre = nombre;
    }
    
}
