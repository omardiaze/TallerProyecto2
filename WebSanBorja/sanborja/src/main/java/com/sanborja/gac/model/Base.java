/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sanborja.gac.model;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import javax.validation.constraints.Min;

/**
 *
 * @author Marlon Cordova
 */
@MappedSuperclass
public class Base {
    
    //@Min(value = 1, message = "Seleccione un Estado valido.")
    @Column(name="estado")
    private String estado;

    

    public String getEstado() {
            return estado;
    }

    public Base setEstado(String estado) {
            this.estado = estado;
            return this;
    }

}
