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
    public static String AreaQuery="select idArea, nombre from area";
    public static String EmpleadoQuery="SELECT per.idPersona, per.nombre, per.apellido FROM persona per inner join empleado emp on per.idPersona = emp.idPersona where emp.idArea=:id ";
    
    public static String TipoSolicitudQuery="select idTipoSolicitud as id,codigo, nombre, ufnDevolverEstado(1000,estado) as estado from tiposolicitud";
    public static String TipoSolicitudFindById="select idTipoSolicitud as id,codigo, nombre,estado from tiposolicitud  where idTipoSolicitud=:id";   
   
    public static String TipoDocumentoQuery="select idTipoDocumento as id,codigo, nombre, ufnDevolverEstado(1001,estado) as estado from tipodocumento";
    public static String TipoDocumentoApiFindById="select " +
                "td.nombre as numero," +
                "per.nombre," +
                "per.apellido," +
                "sol.telefono," +
                "sol.correo," +
                "sol.direccion,"+
                "per.idPersona " +
                "from persona per " +
                "inner join tipodocumento td " +
                "on per.idTipoDocumento=td.idTipoDocumento " +
                "inner join solicitante sol " +
                "on per.idPersona = sol.idPersona where per.idTipoDocumento=:tipo and per.numeroDocumento=:numero LIMIT 1";       
    
    
    public static String MotivoQuery="select idMotivoQR as id,codigo, nombre, ufnDevolverEstado(1002,estado) as estado from motivoqr";
    public static String MotivoQueryFindById="select idMotivoQR as id,codigo, nombre, ufnDevolverEstado(1002,estado) as estado from motivoqr where idTipoSolicitud=:id";
    
    public static String SolicitudQuery="SELECT " +
                    "sol.idSolicitudQR as id," +
                    "(case sol.idTipoSolicitud " +
                    "when 1 then rec.numero " +
                    "when 2 then que.numero end ) as numero," +
                    "tip.nombre as tipo," +
                    "sol.idTipoSolicitud as idTipo," +
                    "sol.fechaCreacion," +
                    "sol.fechaLimite," +
                    "sol.idMotivoQR as idMotivo," +
                    "mot.nombre as motivo," +
                    "concat(per.nombre,' ', per.apellido) as solicitante," +
                    "ufnDevolverEstado(2000,sol.estado) as estado," +
                    "sol.file " +
                    "FROM solicitudqr sol " +
                    "inner join tiposolicitud tip " +
                    "on sol.idTipoSolicitud = tip.idTipoSolicitud " +
                    "left outer join queja que " +
                    "on sol.idSolicitudQR = que.idSolicitudQR " +
                    "left outer join reclamo rec " +
                    "on sol.idSolicitudQR = rec.idSolicitudQR " +
                    "left outer join motivoqr mot " +
                    "on sol.idMotivoQR = mot.idMotivoQR " +
                    "inner join persona per " +
                    "on sol.idPersona =  per.idPersona ";
    
        public static String AceptadoSolicitudQuery="SELECT " +
                    "sol.idSolicitudQR as id," +
                    "(case sol.idTipoSolicitud " +
                    "when 1 then rec.numero " +
                    "when 2 then que.numero end ) as numero," +
                    "tip.nombre as tipo," +
                    "sol.idTipoSolicitud as idTipo," +
                    "sol.fechaCreacion," +
                    "sol.fechaLimite," +
                    "sol.idMotivoQR as idMotivo," +
                    "mot.nombre as motivo," +
                    "concat(per.nombre,' ', per.apellido) as solicitante," +
                    "ufnDevolverEstado(2000,sol.estado) as estado," +
                    "sol.file " +
                    "FROM solicitudqr sol " +
                    "inner join tiposolicitud tip " +
                    "on sol.idTipoSolicitud = tip.idTipoSolicitud " +
                    "left outer join queja que " +
                    "on sol.idSolicitudQR = que.idSolicitudQR " +
                    "left outer join reclamo rec " +
                    "on sol.idSolicitudQR = rec.idSolicitudQR " +
                    "left outer join motivoqr mot " +
                    "on sol.idMotivoQR = mot.idMotivoQR " +
                    "inner join persona per " +
                    "on sol.idPersona =  per.idPersona where sol.estado = 2";
        
     public static String SolicitudFindById="SELECT " +
                    "sol.idSolicitudQR as id," +
                    "(case sol.idTipoSolicitud " +
                    "when 1 then rec.numero " +
                    "when 2 then que.numero end ) as numero," +
                    "tip.nombre as tipo," +
                    "sol.idTipoSolicitud as idTipo," +
                    "sol.fechaCreacion," +
                    "sol.fechaLimite," +
                    "sol.idMotivoQR as idMotivo," +
                    "mot.nombre as motivo," +
                    "concat(per.nombre,' ', per.apellido) as solicitante," +
                    "ufnDevolverEstado(2000,sol.estado) as estado," +
                    "sol.file, " +             
                    "td.nombre as tipoDocumento,"+
                    "per.numeroDocumento,"+
                    "soli.correo,"+
                    "soli.telefono,"+
                    "soli.direccion," +
                    "sol.descripcion "+             
                    "FROM solicitudqr sol " +
                    "inner join tiposolicitud tip " +
                    "on sol.idTipoSolicitud = tip.idTipoSolicitud " +
                    "left outer join queja que " +
                    "on sol.idSolicitudQR = que.idSolicitudQR " +
                    "left outer join reclamo rec " +
                    "on sol.idSolicitudQR = rec.idSolicitudQR " +
                    "left outer join motivoqr mot " +
                    "on sol.idMotivoQR = mot.idMotivoQR " +
                    "inner join persona per " +
                    "on sol.idPersona =  per.idPersona "+
             
                    "inner join tipodocumento td "+
                    "on td.idTipoDocumento = per.idTipoDocumento "+
                    "inner join solicitante soli "+
                    "on sol.idPersona = soli.idPersona and per.idPersona = soli.idPersona "+
                    " where sol.idSolicitudQR=:id";
}