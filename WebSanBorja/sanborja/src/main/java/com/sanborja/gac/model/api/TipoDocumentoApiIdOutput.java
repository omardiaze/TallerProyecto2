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
public class TipoDocumentoApiIdOutput extends Base{
    
    private String numero;
    private String nombre;
    private String apellidos;
    private String telefono;
    private String correo;
    private String direccion;
    private int id;

    /**
     * @return the numero
     */
    public String getNumero() {
        return numero;
    }

    /**
     * @param numero the numero to set
     */
    public TipoDocumentoApiIdOutput setNumero(String numero) {
        this.numero = numero;
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
    public TipoDocumentoApiIdOutput setNombre(String nombre) {
        this.nombre = nombre;
        return this;
    }

    /**
     * @return the apellidos
     */
    public String getApellidos() {
        return apellidos;
    }

    /**
     * @param apellidos the apellidos to set
     */
    public TipoDocumentoApiIdOutput setApellidos(String apellidos) {
        this.apellidos = apellidos;
        return this;
    }

    /**
     * @return the telefono
     */
    public String getTelefono() {
        return telefono;
    }

    /**
     * @param telefono the telefono to set
     */
    public TipoDocumentoApiIdOutput setTelefono(String telefono) {
        this.telefono = telefono;
        return this;
    }

    /**
     * @return the correo
     */
    public String getCorreo() {
        return correo;
    }

    /**
     * @param correo the correo to set
     */
    public TipoDocumentoApiIdOutput setCorreo(String correo) {
        this.correo = correo;
        return this;
    }

    /**
     * @return the direccion
     */
    public String getDireccion() {
        return direccion;
    }

    /**
     * @param direccion the direccion to set
     */
    public TipoDocumentoApiIdOutput setDireccion(String direccion) {
        this.direccion = direccion;
        return this;
    }
    
    public TipoDocumentoApiIdOutput(){
        numero="";
        nombre="";
        apellidos="";
        telefono="";
        correo="";
        direccion="";
        id=0;
    }    

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public TipoDocumentoApiIdOutput setId(int id) {
        this.id = id;
        return this;
    }
}
