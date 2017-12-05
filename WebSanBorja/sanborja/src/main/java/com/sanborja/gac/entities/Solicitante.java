/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sanborja.gac.entities;

import java.io.Serializable;
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
@Table(name = "persona")
public class Solicitante extends Base implements Serializable{
    
    @Id
    @Column(name = "idPersona")
    private Integer idPersona;
    
    @Column(name = "telefono")
    private String telefono;
    
    @Column(name = "correo")
    private String correo;
    
    @Column(name = "direccion")
    private String direccion;
    
    @Transient
    private Persona persona; 

    /**
     * @return the idPersona
     */
    public Integer getIdPersona() {
        return idPersona;
    }

    /**
     * @param idPersona the idPersona to set
     */
    public Solicitante setIdPersona(Integer idPersona) {
        this.idPersona = idPersona;
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
    public Solicitante setTelefono(String telefono) {
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
    public Solicitante setCorreo(String correo) {
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
    public Solicitante setDireccion(String direccion) {
        this.direccion = direccion;
        return this;
    }

    /**
     * @return the persona
     */
    public Persona getPersona() {
        return persona;
    }

    /**
     * @param persona the persona to set
     */
    public Solicitante setPersona(Persona persona) {
        this.persona = persona;
        return this;
    }
    
    
}
