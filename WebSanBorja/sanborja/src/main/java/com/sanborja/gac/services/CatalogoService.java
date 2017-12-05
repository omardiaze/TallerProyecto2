/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sanborja.gac.services;

import com.sanborja.gac.model.api.CatalogoQuery;
import com.sanborja.gac.model.api.Data;
import com.sanborja.gac.model.api.Status;
import com.sanborja.gac.model.api.TipoSolicitudQuery;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Service;

/**
 *
 * @author Marlon Cordova
 */

@Service
public class CatalogoService {
    
     public Data<CatalogoQuery> query() {
        Data <CatalogoQuery> data = new Data<CatalogoQuery>();
        List<CatalogoQuery> list = new ArrayList<CatalogoQuery>();
        list.add(new CatalogoQuery(1,"Activo"));  
        list.add(new CatalogoQuery(2,"Inactivo"));

        
        if(!list.isEmpty()) {
            data.setApistatus(Status.Ok);
        }else{
                data.setApistatus(Status.Error);
                data.setApimessage("No hay datos");
        }
        

        data.setData(list);
        return data;
    }
}
