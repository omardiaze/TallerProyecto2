/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sanborja.gac.services;

import com.sanborja.gac.model.api.Data;
import com.sanborja.gac.model.api.Status;
import com.sanborja.gac.model.api.MotivoQuery;
import com.sanborja.gac.persistence.MotivoRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Marlon Cordova
 */
@Service
public class MotivoService {
    @Autowired
    MotivoRepository motivoRepository;

    public Data<MotivoQuery> query() {
        Data <MotivoQuery> data = new Data<MotivoQuery>();
        List<MotivoQuery> list;
        list = motivoRepository.query();

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
    
    public Data<MotivoQuery> query(int id) {
        Data <MotivoQuery> data = new Data<MotivoQuery>();
        List<MotivoQuery> list;
        list = motivoRepository.query(id);

        if(list!=null) {
            if(!list.isEmpty()) {
                data.getData();
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
