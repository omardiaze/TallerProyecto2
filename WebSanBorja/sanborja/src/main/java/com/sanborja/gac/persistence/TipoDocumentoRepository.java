/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sanborja.gac.persistence;

import com.sanborja.gac.model.api.TipoDocumentoApiIdOutput;
import com.sanborja.gac.model.api.TipoDocumentoQuery; 
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
public class TipoDocumentoRepository {
     @Autowired
    SessionFactory session;
	
   
        
    @SuppressWarnings("unchecked")
    public List<TipoDocumentoQuery> query() {

        SQLQuery query = session.getCurrentSession().createSQLQuery(QueryNames.TipoDocumentoQuery);
        List<Object[]> rows = query.list();
        List<TipoDocumentoQuery> list = new ArrayList<TipoDocumentoQuery>();
                

        for(Object[] row : rows){	

            TipoDocumentoQuery tipoSolicitud = new TipoDocumentoQuery();
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
    public TipoDocumentoApiIdOutput findById(int tipo,String numero) {
 		
        SQLQuery query = (SQLQuery) session.getCurrentSession().createSQLQuery(QueryNames.TipoDocumentoApiFindById).
                                                setParameter("tipo", tipo).setParameter("numero", numero);
        List<Object[]> rows = query.list();
        TipoDocumentoApiIdOutput tipoDocumento = null ;

        for(Object[] row : rows){	
        
            tipoDocumento = new TipoDocumentoApiIdOutput();

            try {
                    tipoDocumento.
                            setNumero(row[0].toString()).
                            setNombre(row[1].toString()).
                            setApellidos(row[2].toString()).                            
                            setTelefono(row[3].toString()).
                            setCorreo(row[4].toString()).
                            setDireccion(row[5].toString()).
                            setId(Integer.parseInt(row[6].toString()));

            } catch (NumberFormatException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
            }
        }		

        return tipoDocumento;
    }
    
    
     

}
