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
import java.util.ArrayList;
import java.util.List;

import org.hibernate.ObjectNotFoundException;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sanborja.gac.entities.TipoSolicitud;
import com.sanborja.gac.entities.api.CheckStatus;
import com.sanborja.gac.entities.api.Status;
import com.sanborja.gac.entities.api.TipoSolicitudQuery;
import com.sanborja.gac.entities.api.Entity;
import com.sanborja.gac.entities.api.TipoSolicitudFindByIdOutput;

@Repository
@Transactional
public class TipoSolicitudRepository {
    @Autowired
    SessionFactory session;
	
    @Autowired
    HelperRepository helperRepository;	
        
    @SuppressWarnings("unchecked")
    public List<TipoSolicitudQuery> query() {

        SQLQuery query = session.getCurrentSession().createSQLQuery(QueryNames.TipoSolicitudQuery);
        List<Object[]> rows = query.list();
        List<TipoSolicitudQuery> list = new ArrayList<TipoSolicitudQuery>();
                

        for(Object[] row : rows){	

            TipoSolicitudQuery tipoSolicitud = new TipoSolicitudQuery();
            try {
                    tipoSolicitud.
                            setId(Integer.parseInt(row[0].toString())).
                            setCodigo(row[1].toString()).					
                            setNombre(row[2].toString()).
                            setEstado(row[3].toString());

            } catch (NumberFormatException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
            }

            list.add(tipoSolicitud);
        }
        return list;
    }
    
    @SuppressWarnings("unchecked")
    public TipoSolicitudFindByIdOutput findById(int id) {
 		
        SQLQuery query = (SQLQuery) session.getCurrentSession().createSQLQuery(QueryNames.TipoSolicitudFindById).
                                                setParameter("id", id);
        List<Object[]> rows = query.list();
        TipoSolicitudFindByIdOutput estadoActivo = null ;

        for(Object[] row : rows){	
        
            estadoActivo = new TipoSolicitudFindByIdOutput();

            try {
                    estadoActivo.
                            setId(Integer.parseInt(row[0].toString())).
                            setCodigo(row[1].toString()).					 
                            setNombre(row[2].toString()).
                            setEstado(Integer.parseInt(row[3].toString()));

            } catch (NumberFormatException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
            }
        }		

        return estadoActivo;
}

    public CheckStatus create(TipoSolicitud estadoActivo) {		
        CheckStatus checkStatus=new CheckStatus();
        String codigo = helperRepository.GenerateCode(Entity.TipoSolicitud);	

        estadoActivo.setCodigo(codigo);		
        session.getCurrentSession().save(estadoActivo);

        if(estadoActivo.getIdTipoSolicitud()!=0) {	 

            checkStatus.setId(estadoActivo.getIdTipoSolicitud().toString());
            checkStatus.setCodigo(codigo);
            checkStatus.setApistatus(Status.Ok);
            checkStatus.setApimessage("Se guardo tipo de solicitud de  satisfactoriamente.");	
            
        }else {	
            checkStatus.setApistatus(Status.Error);
            checkStatus.setApimessage("Error al insertar tipo de solicitud.");
        }

            return checkStatus;
    }
    
    
    public CheckStatus edit(TipoSolicitud tipoSolicitud) {		
        CheckStatus checkStatus=new CheckStatus();
        try {

            TipoSolicitud entityUpdate = (TipoSolicitud) session.getCurrentSession().load(TipoSolicitud.class, tipoSolicitud.getIdTipoSolicitud());
             
            entityUpdate.setNombre(tipoSolicitud.getNombre());
            entityUpdate.setEstado(tipoSolicitud.getEstado());
            
            session.getCurrentSession().update(entityUpdate);

            checkStatus.setApistatus(Status.Ok);
            checkStatus.setApimessage("Se guardo tipo de solicitud satisfactoriamente.");	
                 			

        }catch(ObjectNotFoundException ex) {
                checkStatus.setApistatus(Status.Error);
                checkStatus.setApimessage("No existe tipo de solicitud.");
        }
        return checkStatus;
    }

    public CheckStatus delete(Integer id) {		
        CheckStatus checkStatus=new CheckStatus();
        try {

            TipoSolicitud entityUpdate = (TipoSolicitud) session.getCurrentSession().load(TipoSolicitud.class, id);
            
            session.getCurrentSession().delete(entityUpdate);

            checkStatus.setApistatus(Status.Ok);
            checkStatus.setApimessage("Se elimino tipo de solicitud satisfactoriamente.");

        }catch(ObjectNotFoundException ex) {
                checkStatus.setApistatus(Status.Error);
                checkStatus.setApimessage("No existe tipo de solicitud.");
        }
        return checkStatus;
    }
}
