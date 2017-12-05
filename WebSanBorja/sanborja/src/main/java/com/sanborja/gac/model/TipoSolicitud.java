/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sanborja.gac.model;

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
public class TipoSolicitud extends Base implements Serializable {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "idTipoSolicitud")
    private Integer idTipoSolicitud;

    @Column(name = "codigo")
    private String codigo;

    @Column(name = "nombre")
    private String nombre;
    
    public Integer getIdTipoSolicitud() {
        return idTipoSolicitud;
    }


    public TipoSolicitud setIdTipoSolicitud(Integer idTipoSolicitud) {
        this.idTipoSolicitud = idTipoSolicitud;
        return this;
    }


    public String getCodigo() {
        return codigo;
    }


    public TipoSolicitud setCodigo(String codigo) {
        this.codigo = codigo;
        return this;
    }


    public String getNombre() {
        return nombre;
    }


    public TipoSolicitud setNombre(String nombre) {
        this.nombre = nombre;
        return this;
    }	
}
