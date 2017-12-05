/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sanborja.gac.entities;

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
@Table(name = "motivoQR")
public class MotivoQR   extends Base{
    
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "idMotivoQR")
    private Integer idMotivoQR;

    @Column(name = "codigo")
    private String codigo;

    @Column(name = "nombre")
    private String nombre;
    
    public Integer getIdMoticoQR() {
        return idMotivoQR;
    }

    public MotivoQR setIdMotivoQR(Integer idTipoSolicitud) {
        this.idMotivoQR = idTipoSolicitud;
        return this;
    }


    public String getCodigo() {
        return codigo;
    }


    public MotivoQR setCodigo(String codigo) {
        this.codigo = codigo;
        return this;
    }


    public String getNombre() {
        return nombre;
    }


    public MotivoQR setNombre(String nombre) {
        this.nombre = nombre;
        return this;
    }	
}
