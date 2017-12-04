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
import java.util.Date;
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

@Repository
@Transactional
public class TipoSolicitudRepository {
    @Autowired
    SessionFactory session;
	
    	@SuppressWarnings("unchecked")
	public List<TipoSolicitudQuery> query() {
		 
            SQLQuery query = session.getCurrentSession().createSQLQuery(QueryNames.TipoSolicitudQuery);
            List<Object[]> rows = query.list();
            List<TipoSolicitudQuery> list = new ArrayList<TipoSolicitudQuery>();
            //list= query.list();
            System.out.print(rows.size());
            
            for(Object[] row : rows){	
 
                TipoSolicitudQuery estadoActivo = new TipoSolicitudQuery();
                try {
                        estadoActivo.
                                setId(Integer.parseInt(row[0].toString())).
                                setCodigo(row[1].toString()).					
                                setNombre(row[2].toString()).
                                setEstado(row[3].toString());

                } catch (NumberFormatException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                }

                list.add(estadoActivo);

            }		

            return list;
    }
}
