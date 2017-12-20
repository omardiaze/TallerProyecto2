/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sanborja.gac.services;

import com.sanborja.gac.model.api.EmpleadoQuery;
import com.sanborja.gac.model.api.Data;
import com.sanborja.gac.model.api.Status;
import com.sanborja.gac.persistence.EmpleadoRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
/**
 *
 * @author Marlon Cordova
 */
@Service
public class EmpleadoService {
    
     @Autowired
    EmpleadoRepository empleadoRepository;
    
    public Data<EmpleadoQuery> query(int idArea) {
        Data <EmpleadoQuery> data = new Data<EmpleadoQuery>();
        List<EmpleadoQuery> list;
        list = empleadoRepository.query(idArea);

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
