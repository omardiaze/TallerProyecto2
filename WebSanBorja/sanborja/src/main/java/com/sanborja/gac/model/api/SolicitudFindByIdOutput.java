/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sanborja.gac.model.api;
import java.util.Date;
/**
 *
 * @author Marlon Cordova
 */
public class SolicitudFindByIdOutput extends Base{
     private int id;
    private String numero;
    private String tipo;
    private int idTipo;
    private String solicitante;
    private int idMotivo;
    private String motivo;
    private String estado;
    private Date fechaCreacion;
    private Date fechaLimite;
    private String descripcion;
    private String file;
    private String tipoDocumento;
    private String numeroDocumento;
    private String correo;
    private String telefono;
    private String direccion;
    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public SolicitudFindByIdOutput setId(int id) {
        this.id = id;
        return this;
    }

    /**
     * @return the numero
     */
    public String getNumero() {
        return numero;
    }

    /**
     * @param numero the numero to set
     */
    public SolicitudFindByIdOutput setNumero(String numero) {
        this.numero = numero;
        return this;
    }

    /**
     * @return the tipo
     */
    public String getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public SolicitudFindByIdOutput setTipo(String tipo) {
        this.tipo = tipo;
        return this;
    }

    /**
     * @return the idTipo
     */
    public int getIdTipo() {
        return idTipo;
    }

    /**
     * @param idTipo the idTipo to set
     */
    public SolicitudFindByIdOutput setIdTipo(int idTipo) {
        this.idTipo = idTipo;
        return this;
    }

    /**
     * @return the solicitante
     */
    public String getSolicitante() {
        return solicitante;
    }

    /**
     * @param solicitante the solicitante to set
     */
    public SolicitudFindByIdOutput setSolicitante(String solicitante) {
        this.solicitante = solicitante;
        return this;
    }

    /**
     * @return the idMotivo
     */
    public int getIdMotivo() {
        return idMotivo;
    }

    /**
     * @param idMotivo the idMotivo to set
     */
    public SolicitudFindByIdOutput setIdMotivo(int idMotivo) {
        this.idMotivo = idMotivo;
        return this;
    }

    /**
     * @return the motivo
     */
    public String getMotivo() {
        return motivo;
    }

    /**
     * @param motivo the motivo to set
     */
    public SolicitudFindByIdOutput setMotivo(String motivo) {
        this.motivo = motivo;
        return this;
    }

    /**
     * @return the estado
     */
    public String getEstado() {
        return estado;
    }

    /**
     * @param estado the estado to set
     */
    public SolicitudFindByIdOutput setEstado(String estado) {
        this.estado = estado;
        return this;
    }

    /**
     * @return the fechaCreacion
     */
    public Date getFechaCreacion() {
        return fechaCreacion;
    }

    /**
     * @param fechaCreacion the fechaCreacion to set
     */
    public SolicitudFindByIdOutput setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
        return this;
    }

    /**
     * @return the fechaLimite
     */
    public Date getFechaLimite() {
        return fechaLimite;
    }

    /**
     * @param fechaLimite the fechaLimite to set
     */
    public SolicitudFindByIdOutput setFechaLimite(Date fechaLimite) {
        this.fechaLimite = fechaLimite;
        return this;
    }

    /**
     * @return the tipoDocumento
     */
    public String getTipoDocumento() {
        return tipoDocumento;
    }

    /**
     * @param tipoDocumento the tipoDocumento to set
     */
    public SolicitudFindByIdOutput setTipoDocumento(String tipoDocumento) {
        this.tipoDocumento = tipoDocumento;
        return this;
    }

    /**
     * @return the numeroDocumento
     */
    public String getNumeroDocumento() {
        return numeroDocumento;
    }

    /**
     * @param numeroDocumento the numeroDocumento to set
     */
    public SolicitudFindByIdOutput setNumeroDocumento(String numeroDocumento) {
        this.numeroDocumento = numeroDocumento;
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
    public SolicitudFindByIdOutput setCorreo(String correo) {
        this.correo = correo;
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
    public SolicitudFindByIdOutput setTelefono(String telefono) {
        this.telefono = telefono;
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
    public SolicitudFindByIdOutput setDireccion(String direccion) {
        this.direccion = direccion;
        return this;
    }
    
    /**
     * @return the tipo
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * @param tipo the tipo to set
     */
    public SolicitudFindByIdOutput setDescripcion(String descripcion) {
        this.descripcion = descripcion;
        return this;
    }

    /**
     * @return the file
     */
    public String getFile() {
        return file;
    }

    /**
     * @param file the file to set
     */
    public SolicitudFindByIdOutput setFile(String file) {
        this.file = file;
        return this;
    }

    
}
