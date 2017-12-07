/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sanborja.gac.model.api;

import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Marlon Cordova
 */
public class SolicitudInput {
    
    //solicitante
    
    private String nombre;
    private String apellido;
    private String direccion;
    private String telefono;
    private String correo;
    private int idTipoDocumento;
    private String numeroDocumento;
    
    //solicitud   
    
    private int id;
    private String numero;
    private String descripcion;
    private int idMotivo;
    private int idTipoSolicitud;
    private MultipartFile file;
    private String fileName;
    
    private int notificacion;
    
    private String numeroDocumentoError;
    private String nombreError;
    private String apellidoError;
    private String direccionError;
    private String telefonoError;
    private String correoError;
    private String descripcionError;
    
    
    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the apellido
     */
    public String getApellido() {
        return apellido;
    }

    /**
     * @param apellido the apellido to set
     */
    public void setApellido(String apellido) {
        this.apellido = apellido;
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
    public void setDireccion(String direccion) {
        this.direccion = direccion;
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
    public void setTelefono(String telefono) {
        this.telefono = telefono;
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
    public void setCorreo(String correo) {
        this.correo = correo;
    }

    /**
     * @return the idTipoDocumento
     */
    public int getIdTipoDocumento() {
        return idTipoDocumento;
    }

    /**
     * @param idTipoDocumento the idTipoDocumento to set
     */
    public void setIdTipoDocumento(int idTipoDocumento) {
        this.idTipoDocumento = idTipoDocumento;
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
    public void setNumeroDocumento(String numeroDocumento) {
        this.numeroDocumento = numeroDocumento;
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
    public void setId(int id) {
        this.id = id;
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
    public void setNumero(String numero) {
        this.numero = numero;
    }

    /**
     * @return the descripcion
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * @param descripcion the descripcion to set
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

     /**
     * @return the descripcion
     */
    public String getFileName() {
        return fileName;
    }

    /**
     * @param descripcion the descripcion to set
     */
    public void setFileName(String fileName) {
        this.fileName = fileName;
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
    public void setIdMotivo(int idMotivo) {
        this.idMotivo = idMotivo;
    }

    /**
     * @return the idTipoSolicitud
     */
    public int getIdTipoSolicitud() {
        return idTipoSolicitud;
    }

    /**
     * @param idTipoSolicitud the idTipoSolicitud to set
     */
    public void setIdTipoSolicitud(int idTipoSolicitud) {
        this.idTipoSolicitud = idTipoSolicitud;
    }

    /**
     * @return the file
     */
    public MultipartFile getFile() {
        return file;
    }

    /**
     * @param file the file to set
     */
    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public SolicitudInput(){
        nombre="";
        apellido="";
        direccion="";
        telefono="";
        correo="";
        idTipoDocumento=1;
        numeroDocumento="";
    
        //solicitud
        id=0;
        numero="";
        descripcion="";
        idMotivo=0;
        idTipoSolicitud=0;
        notificacion=0;
        
        numeroDocumentoError="";
        nombreError="";
        apellidoError="";
        direccionError="";
        telefonoError="";
        correoError="";
        descripcionError="";
    }

    /**
     * @return the notificacion
     */
    public int getNotificacion() {
        return notificacion;
    }

    /**
     * @param notificacion the notificacion to set
     */
    public void setNotificacion(int notificacion) {
        this.notificacion = notificacion;
    }

    /**
     * @return the numeroDocumentoError
     */
    public String getNumeroDocumentoError() {
        return numeroDocumentoError;
    }

    /**
     * @param numeroDocumentoError the numeroDocumentoError to set
     */
    public void setNumeroDocumentoError(String numeroDocumentoError) {
        this.numeroDocumentoError = numeroDocumentoError;
    }

    /**
     * @return the nombreError
     */
    public String getNombreError() {
        return nombreError;
    }

    /**
     * @param nombreError the nombreError to set
     */
    public void setNombreError(String nombreError) {
        this.nombreError = nombreError;
    }

    /**
     * @return the apellidoError
     */
    public String getApellidoError() {
        return apellidoError;
    }

    /**
     * @param apellidoError the apellidoError to set
     */
    public void setApellidoError(String apellidoError) {
        this.apellidoError = apellidoError;
    }

    /**
     * @return the direccionError
     */
    public String getDireccionError() {
        return direccionError;
    }

    /**
     * @param direccionError the direccionError to set
     */
    public void setDireccionError(String direccionError) {
        this.direccionError = direccionError;
    }

    /**
     * @return the telefonoError
     */
    public String getTelefonoError() {
        return telefonoError;
    }

    /**
     * @param telefonoError the telefonoError to set
     */
    public void setTelefonoError(String telefonoError) {
        this.telefonoError = telefonoError;
    }

    /**
     * @return the correoError
     */
    public String getCorreoError() {
        return correoError;
    }

    /**
     * @param correoError the correoError to set
     */
    public void setCorreoError(String correoError) {
        this.correoError = correoError;
    }

    /**
     * @return the descripcionError
     */
    public String getDescripcionError() {
        return descripcionError;
    }

    /**
     * @param descripcionError the descripcionError to set
     */
    public void setDescripcionError(String descripcionError) {
        this.descripcionError = descripcionError;
    }
    
    
}