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

/**
 *
 * @author Marlon Cordova
 */
@Entity
@Table(name = "tiposolicitud")
public class TipoDocumento extends Base implements Serializable{
 
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "idTipoDocumento")
    private Integer idTipoDocumento;

    @Column(name = "codigo")
    private String codigo;

    @Column(name = "nombre")
    private String nombre;
    
    public Integer getIdTipoDocumento() {
        return idTipoDocumento;
    }


    public TipoDocumento setIdTipoDocumento(Integer idTipoDocumento) {
        this.idTipoDocumento = idTipoDocumento;
        return this;
    }


    public String getCodigo() {
        return codigo;
    }


    public TipoDocumento setCodigo(String codigo) {
        this.codigo = codigo;
        return this;
    }


    public String getNombre() {
        return nombre;
    }


    public TipoDocumento setNombre(String nombre) {
        this.nombre = nombre;
        return this;
    }	
}
