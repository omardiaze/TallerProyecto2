/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sanborja.gac.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sanborja.gac.entities.api.Data;
import com.sanborja.gac.entities.TipoSolicitud;
import com.sanborja.gac.entities.api.TipoSolicitudQuery;
import com.sanborja.gac.entities.api.CheckStatus;
import com.sanborja.gac.entities.api.Status;
import com.sanborja.gac.persistence.TipoSolicitudRepository;
/**
 *
 * @author Marlon Cordova
 */
@Service
public class TipoSolicitudService {
    
    @Autowired
    TipoSolicitudRepository categoriaRepository;

    public Data<TipoSolicitudQuery> query() {
        Data <TipoSolicitudQuery> data = new Data<TipoSolicitudQuery>();
        List<TipoSolicitudQuery> list;
        list = categoriaRepository.query();

        if(list!=null) {
            if(!list.isEmpty()) {
                data.setApistatus(Status.Ok);
            }else{
                    data.setApistatus(Status.Error);
                    data.setApimessage("No hay datos");
            }
        }else{
                data.setApistatus(Status.Error);
                data.setApimessage("No hay datos");
        }

        data.setData(list);
        return data;
    }
        
}
