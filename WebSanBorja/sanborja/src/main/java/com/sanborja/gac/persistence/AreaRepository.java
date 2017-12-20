/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sanborja.gac.persistence;

import com.sanborja.gac.model.api.AreaQuery;
import java.util.ArrayList;
import java.util.List;
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
public class AreaRepository {
    
    @Autowired
    SessionFactory session;	 
        
    @SuppressWarnings("unchecked")
    public List<AreaQuery> query() {

        SQLQuery query = session.getCurrentSession().createSQLQuery(QueryNames.AreaQuery);
        List<Object[]> rows = query.list();
        List<AreaQuery> list = new ArrayList<AreaQuery>();
                

        for(Object[] row : rows){	

            AreaQuery tipoSolicitud = new AreaQuery();
            try {
                    tipoSolicitud.
                            setId(Integer.parseInt(row[0].toString())).
                            setNombre(row[1].toString());

            } catch (NumberFormatException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
            }

            list.add(tipoSolicitud);
        }
        return list;
    }
    
}
