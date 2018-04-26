/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sanborja.gac.persistence;

import com.sanborja.gac.model.Asignacion;
import com.sanborja.gac.model.Persona;
import com.sanborja.gac.model.Queja;
import com.sanborja.gac.model.Reclamo;
import com.sanborja.gac.model.Solicitante;
import com.sanborja.gac.model.Solicitud;

import com.sanborja.gac.model.api.CheckStatus;
import com.sanborja.gac.model.api.Entity;
import com.sanborja.gac.model.api.SolicitudFindByIdOutput;
import com.sanborja.gac.model.api.SolicitudQuery;
import com.sanborja.gac.model.api.Status;
import com.sanborja.gac.model.api.TipoDocumentoApiIdOutput;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.ObjectNotFoundException;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Marlon Cordova
 */
@Repository
@Transactional
public class SolicitudRepository {
    @Autowired
    SessionFactory session;
	
    @Autowired
    HelperRepository helperRepository;	
    
    @Autowired
    TipoDocumentoRepository tipoDocumentoRepository;	
    
    @SuppressWarnings("unchecked")
    public List<SolicitudQuery> query() {

        SQLQuery query = session.getCurrentSession().createSQLQuery(QueryNames.SolicitudQuery);
        List<Object[]> rows = query.list();
        List<SolicitudQuery> list = new ArrayList<SolicitudQuery>();
                

        for(Object[] row : rows){	

            SolicitudQuery tipoSolicitud = new SolicitudQuery();
            try {
                //if (row[4] instanceof Date) {
                    //fechaCreacion = (java.util.Date)row[4];		      
                //}
                //Date fechaLimite = null;
                //if (row[5] instanceof Date) {
                    //fechaCreacion = (java.util.Date)row[5];		      
                //}                
                DateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                
                String fechaCreacion = "";
                Date dfechaCreacion = null;
                if (row[4] instanceof Date) {
                    dfechaCreacion = (java.util.Date)row[4];
                    fechaCreacion = df.format(dfechaCreacion);
                }
                
                String fechaLimite = "";
                Date dfechaLimite = null;
                if (row[5] instanceof Date) {
                    dfechaLimite = (java.util.Date)row[5];
                    fechaLimite = df.format(dfechaLimite);
                }
                
                        
                int idMotivo=0;
                String motivo="Ninguno";
                if(row[6]!=null){
                  idMotivo = Integer.parseInt(row[6].toString());  
                }
                
                if(row[7]!=null){
                    motivo = row[7].toString();
                }
                
                
                tipoSolicitud.
                        setId(Integer.parseInt(row[0].toString())).
                        setNumero(row[1].toString()).					                            
                        setTipo(row[2].toString()).
                        setIdTipo(Integer.parseInt(row[3].toString())).
                        setFechaCreacion(fechaCreacion).
                        setFechaLimite(fechaLimite).
                        setIdMotivo(idMotivo).
                        setMotivo(motivo).
                        setSolicitante(row[8].toString()).
                        setEstado(row[9].toString());

            } catch (NumberFormatException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
            }

            list.add(tipoSolicitud);
        }
        return list;
    } 
    
     @SuppressWarnings("unchecked")
    public List<SolicitudQuery> queryAceptado() {

        SQLQuery query = session.getCurrentSession().createSQLQuery(QueryNames.AceptadoSolicitudQuery);
        List<Object[]> rows = query.list();
        List<SolicitudQuery> list = new ArrayList<SolicitudQuery>();
                

        for(Object[] row : rows){	

            SolicitudQuery tipoSolicitud = new SolicitudQuery();
            try {
                DateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                
                String fechaCreacion = "";
                Date dfechaCreacion = null;
                if (row[4] instanceof Date) {
                    dfechaCreacion = (java.util.Date)row[4];
                    fechaCreacion = df.format(dfechaCreacion);
                }
                
                String fechaLimite = "";
                Date dfechaLimite = null;
                if (row[5] instanceof Date) {
                    dfechaLimite = (java.util.Date)row[5];
                    fechaLimite = df.format(dfechaLimite);
                }
                
                /*Date fechaCreacion = null;
                if (row[4] instanceof Date) {
                    fechaCreacion = (java.util.Date)row[4];		      
                }			
		
                Date fechaLimite = null;
                if (row[5] instanceof Date) {
                    fechaCreacion = (java.util.Date)row[5];		      
                }*/	
                        
                int idMotivo=0;
                String motivo="Ninguno";
                if(row[6]!=null){
                  idMotivo = Integer.parseInt(row[6].toString());  
                }
                
                if(row[7]!=null){
                    motivo = row[7].toString();
                }
                
                
                tipoSolicitud.
                        setId(Integer.parseInt(row[0].toString())).
                        setNumero(row[1].toString()).					                            
                        setTipo(row[2].toString()).
                        setIdTipo(Integer.parseInt(row[3].toString())).
                        setFechaCreacion(fechaCreacion).
                        setFechaLimite(fechaLimite).
                        setIdMotivo(idMotivo).
                        setMotivo(motivo).
                        setSolicitante(row[8].toString()).
                        setEstado(row[9].toString());

            } catch (NumberFormatException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
            }

            list.add(tipoSolicitud);
        }
        return list;
    } 
    
    @SuppressWarnings("unchecked")
    public SolicitudFindByIdOutput findById(int id) {

        SQLQuery query = (SQLQuery) session.getCurrentSession().createSQLQuery(QueryNames.SolicitudFindById).
                                                setParameter("id", id);        
        List<Object[]> rows = query.list();
        SolicitudFindByIdOutput solicitud = null;
                

        for(Object[] row : rows){	

            solicitud = new SolicitudFindByIdOutput();
            
            try {
                int idMotivo=0;
                String motivo="Ninguno";
                if(row[6]!=null){
                  idMotivo = Integer.parseInt(row[6].toString());  
                }
                
                if(row[7]!=null){
                    motivo = row[7].toString();
                }
                
                Date fechaCreacion = null;
                if (row[4] instanceof Date) {
                    fechaCreacion = (java.util.Date)row[4];		      
                }			
		
                Date fechaLimite = null;
                if (row[5] instanceof Date) {
                    fechaLimite = (java.util.Date)row[5];		      
                }	
                        
                String file ="";
                if(row[10]!=null){
                    file = row[10].toString();
                }
                
                solicitud.
                        setId(Integer.parseInt(row[0].toString())).
                        setNumero(row[1].toString()).					                            
                        setTipo(row[2].toString()).
                        setIdTipo(Integer.parseInt(row[3].toString())).
                        setFechaCreacion(fechaCreacion).
                        setFechaLimite(fechaLimite).
                        setIdMotivo(idMotivo).
                        setMotivo(motivo).
                        setSolicitante(row[8].toString()).
                        setEstado(row[9].toString()).
                        setFile(file).
                        setTipoDocumento(row[11].toString()).
                        setNumeroDocumento(row[12].toString()).
                        setCorreo(row[13].toString()).
                        setTelefono(row[14].toString()).
                        setDireccion(row[15].toString()).
                        setDescripcion(row[16].toString());

            } catch (NumberFormatException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
            }

            
        }
        return solicitud;
    } 
    
    public CheckStatus create(Solicitud solicitud) {		
        CheckStatus checkStatus=new CheckStatus();
//        String entidad="";
//        String codigo="";
//        
//        //System.out.println(solicitud.getSolicitante().getPersona().getIdTipoDocumento());
//        //System.out.println(solicitud.getSolicitante().getPersona().getNumeroDocumento());
//        //buscar idPersona
//        int idPersona = 0;
//        TipoDocumentoApiIdOutput tipoDocumentoApi = tipoDocumentoRepository.findById(
//                    solicitud.getSolicitante().getPersona().getIdTipoDocumento(),
//                    solicitud.getSolicitante().getPersona().getNumeroDocumento());
//        
//        Persona persona=new Persona();
//        Solicitante solicitante=new Solicitante();
//        
//        if(tipoDocumentoApi!=null){
//            idPersona= tipoDocumentoApi.getId();
//            //Persona
//             persona = (Persona) session.getCurrentSession().load(Persona.class,idPersona);
//            persona.setNombre(solicitud.getSolicitante().getPersona().getNombre());
//            persona.setApellido(solicitud.getSolicitante().getPersona().getApellido());
//            session.getCurrentSession().update(persona);
//            
//            
//            solicitante = (Solicitante) session.getCurrentSession().load(Solicitante.class,idPersona);
//            solicitante.setTelefono(solicitud.getSolicitante().getTelefono());
//            solicitante.setCorreo(solicitud.getSolicitante().getCorreo());
//            solicitante.setDireccion(solicitud.getSolicitante().getDireccion());
//            session.getCurrentSession().update(solicitante);
//            
//        }else{
//            
//            codigo =helperRepository.GenerateCode(Entity.Persona);	
//            
//            persona= solicitud.getSolicitante().getPersona();
//            persona.setCodigo(codigo);
//            session.getCurrentSession().save(persona);
//            System.out.print(persona.getIdPersona());
//
//            //Solicitante            
//            solicitante= solicitud.getSolicitante();
//            solicitante.setIdPersona(persona.getIdPersona());        
//            session.getCurrentSession().save(solicitante);            
//            
//        }
//       
//        //Solicitud
//        solicitud.setIdPersona(persona.getIdPersona());
//        solicitud.setFechaCreacion(new Timestamp(System.currentTimeMillis()));
//        try {
//            Date date = new Date();
//            Calendar cal = Calendar.getInstance();
//            cal.setTime(date);
//            cal.add(Calendar.DATE, 30); //minus number would decrement the days
//            solicitud.setFechaLimite(new java.sql.Timestamp(cal.getTimeInMillis()));
//            //solicitud.setFechaLimite( addDays(30,solicitud.getFechaCreacion()));
//        } catch (Exception ex) {
//            Logger.getLogger(SolicitudRepository.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        
//        
//        session.getCurrentSession().save(solicitud);
//                
//        String numero = "";
//        entidad="";        
//        if(solicitud.getIdTipoSolicitud()==1){
//            entidad = Entity.Reclamo;
//        }else if(solicitud.getIdTipoSolicitud()==2){
//            entidad = Entity.Queja;
//        }        
//        numero =helperRepository.GenerateCode(entidad);	
//        numero="2017-00"+numero;
//       
//        if(solicitud.getIdTipoSolicitud()==1){
//            //Reclamos
//            Reclamo reclamo = new Reclamo();
//            reclamo.setIdSolicitudQR(solicitud.getIdSolicitudQR());
//            reclamo.setNumero(numero);
//            reclamo.setCodigoSirec("");
//            session.getCurrentSession().save(reclamo);
//            
//         }else if(solicitud.getIdTipoSolicitud()==2){
//
//            //Queja 
//            Queja queja = new Queja();
//            queja.setIdSolicitudQR(solicitud.getIdSolicitudQR());
//            queja.setNumero(numero);
//           session.getCurrentSession().save(queja);
//            
//        }
//         
//
//        if(solicitud.getIdSolicitudQR()!=0) {	 
//
//            checkStatus.setId(solicitud.getIdSolicitudQR().toString());
//            checkStatus.setCodigo(numero);
//            checkStatus.setApistatus(Status.Ok);
//            String nombreentidad="";
//            
//            if(solicitud.getIdTipoSolicitud()==1){
//                nombreentidad="Reclamo";
//            }else if(solicitud.getIdTipoSolicitud()==2){
//                nombreentidad="Queja";
//            }
//            
//            checkStatus.setApimessage("Se registró su "+nombreentidad+" Nro "+numero+"  satisfactoriamente.");	
//            
//        }else {	
//            checkStatus.setApistatus(Status.Error);
//            checkStatus.setApimessage("Error al insertar tipo de solicitud.");
//        }
//
            return checkStatus;
    }
      
    public CheckStatus delete(Integer id) {		
        CheckStatus checkStatus=new CheckStatus();
        try {

            Queja entityQuejaUpdate = (Queja) session.getCurrentSession().load(Queja.class, id);
            Reclamo entityReclamoUpdate = (Reclamo) session.getCurrentSession().load(Reclamo.class, id);
            
            Solicitud entityUpdate = (Solicitud) session.getCurrentSession().load(Solicitud.class, id);
            
            session.getCurrentSession().delete(entityUpdate);

            if(entityQuejaUpdate!=null){
                if(entityQuejaUpdate.getIdSolicitudQR()!=0){
                 session.getCurrentSession().delete(entityQuejaUpdate);
                }
            }
            
              if(entityReclamoUpdate!=null){
                if(entityReclamoUpdate.getIdSolicitudQR()!=0){
                 session.getCurrentSession().delete(entityReclamoUpdate);
                }
            }
            
            checkStatus.setApistatus(Status.Ok);
            checkStatus.setApimessage("Se elimino tipo de solicitud satisfactoriamente.");

        }catch(ObjectNotFoundException ex) {
                checkStatus.setApistatus(Status.Error);
                checkStatus.setApimessage("No existe tipo de solicitud.");
        }
        return checkStatus;
    }
    
     public CheckStatus aceptar(Integer id) {		
        CheckStatus checkStatus=new CheckStatus();
        try {

            Solicitud entityUpdate = (Solicitud) session.getCurrentSession().load(Solicitud.class, id);
            //entityUpdate.setFechaCreacion(fechaCreacion)
            entityUpdate.setEstado("A");
            session.getCurrentSession().update(entityUpdate);           
            
            checkStatus.setApistatus(Status.Ok);
            checkStatus.setApimessage("Se acepto esta solicitud satisfactoriamente.");

        }catch(ObjectNotFoundException ex) {
                checkStatus.setApistatus(Status.Error);
                checkStatus.setApimessage("No existe tipo de solicitud.");
        }
        return checkStatus;
    }
    
       public CheckStatus asignacion(Asignacion asignacion) {		
        CheckStatus checkStatus=new CheckStatus();
        
        //Solicitud        
        asignacion.setFecha(new Timestamp(System.currentTimeMillis()));
        
        session.getCurrentSession().save(asignacion);
         
        
        //actualizar solicitud
        Solicitud entityUpdate = (Solicitud) session.getCurrentSession().load(Solicitud.class, 
                asignacion.getIdSolicitudQR());
            entityUpdate.setEstado("R");
            session.getCurrentSession().update(entityUpdate);    
            
        if(asignacion.getIdAsignacion()!=0) {	 

            checkStatus.setId(asignacion.getIdAsignacion().toString());
            checkStatus.setCodigo("");
            checkStatus.setApistatus(Status.Ok);          
            
            checkStatus.setApimessage("Se registró su asignación satisfactoriamente.");	
            
        }else {	
            checkStatus.setApistatus(Status.Error);
            checkStatus.setApimessage("Error al insertar tipo de solicitud.");
        }

        return checkStatus;
    }
      
       
        public Timestamp addDays(int days, Timestamp t1) throws Exception{
    if(days < 0){
        throw new Exception("Day in wrong format.");
    }
    Long miliseconds = dayToMiliseconds(days);
    return new Timestamp(t1.getTime() + miliseconds);
}
        private Long dayToMiliseconds(int days){
    Long result = Long.valueOf(days * 24 * 60 * 60 * 1000);
    return result;
}
}
