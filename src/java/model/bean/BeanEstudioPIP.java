/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.bean;

/**
 *
 * @author Juanka
 */
public class BeanEstudioPIP {
    String id;
    String identificadorPIP;
    String descripcion;
    String montoInversionViable;
    String fechaDeclaracion;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getIdentificadorPIP() {
        return identificadorPIP;
    }

    public void setIdentificadorPIP(String identificadorPIP) {
        this.identificadorPIP = identificadorPIP;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getMontoInversionViable() {
        return montoInversionViable;
    }

    public void setMontoInversionViable(String montoInversionViable) {
        this.montoInversionViable = montoInversionViable;
    }

    public String getFechaDeclaracion() {
        return fechaDeclaracion;
    }

    public void setFechaDeclaracion(String fechaDeclaracion) {
        this.fechaDeclaracion = fechaDeclaracion;
    }
   
    
}
