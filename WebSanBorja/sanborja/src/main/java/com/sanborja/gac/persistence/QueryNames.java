/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sanborja.gac.persistence;

/**
 *
 * @author Marlon Cordova
 */
public class QueryNames {
    public static String TipoSolicitudQuery="select idTipoSolicitud as id,codigo, nombre, ufnDevolverEstado(1000,estado) as estado from tiposolicitud";
    public static String TipoSolicitudFindById="select idTipoSolicitud as id,codigo, nombre,estado from tiposolicitud  where idTipoSolicitud=:id";
    
    public static String MotivoQRQuery="select idMotivoQR as id,codigo, nombre, ufnDevolverEstado(1001,estado) as estado from tiposolicitud";
}
