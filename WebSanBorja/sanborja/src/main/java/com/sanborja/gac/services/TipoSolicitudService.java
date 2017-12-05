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

import com.sanborja.gac.model.api.Data;
import com.sanborja.gac.model.TipoSolicitud;
import com.sanborja.gac.model.api.TipoSolicitudQuery;
import com.sanborja.gac.model.api.CheckStatus;
import com.sanborja.gac.model.api.Status;
import com.sanborja.gac.model.api.TipoSolicitudFindByIdOutput;
import com.sanborja.gac.model.api.TipoSolicitudInput;
import com.sanborja.gac.persistence.TipoSolicitudRepository;
/**
 *
 * @author Marlon Cordova
 */
@Service
public class TipoSolicitudService {
    
    @Autowired
    TipoSolicitudRepository tipoSolicitudRepository;

    public Data<TipoSolicitudQuery> query() {
        Data <TipoSolicitudQuery> data = new Data<TipoSolicitudQuery>();
        List<TipoSolicitudQuery> list;
        list = tipoSolicitudRepository.query();

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
    
    public TipoSolicitudFindByIdOutput findById(int id) {
        TipoSolicitudFindByIdOutput moneda = new TipoSolicitudFindByIdOutput();		 
        moneda = tipoSolicitudRepository.findById(id);

        if(moneda!=null) {
            if(moneda.getId()!=0) {
                    moneda.setApistatus(Status.Ok);

            }else{
                    moneda.setApistatus(Status.Error);
                    moneda.setApimessage("No hay datos");
            }
        }else{
                moneda = new TipoSolicitudFindByIdOutput();
                moneda.setApistatus(Status.Error);
                moneda.setApimessage("No hay datos");
        }

        return moneda;
    }

    public CheckStatus create(TipoSolicitudInput input) {
        CheckStatus checkStatus= new CheckStatus();
        TipoSolicitud tipoDocumento= new TipoSolicitud();			 

        String error="";
        if(input==null){
            error="ingresar el tipo de la solicitud";
        }else{
            if(input.getNombre().isEmpty()){
                error="<li>Debe ingresar nombre</li>";
            }
        }
        
        
        if(error.trim().length()==0){
            tipoDocumento	
            .setNombre(input.getNombre())		               
            .setEstado(input.getEstado()) ;

            checkStatus = tipoSolicitudRepository.create(tipoDocumento);
        }else{
            checkStatus.setApistatus(Status.Error);
            checkStatus.setApimessage(error);
        }
        
        return checkStatus;
    }

    public CheckStatus edit(TipoSolicitudInput input) {
        CheckStatus checkStatus= new CheckStatus();
        TipoSolicitud tipoDocumento= new TipoSolicitud();			
 		 
        String error="";
        if(input==null){
            error="ingresar el tipo de la solicitud";
        }else{
            if(input.getNombre().isEmpty()){
                error="<li>Debe ingresar nombre</li>";
            }
        }        
        
        if(error.trim().length()==0){            
         
            tipoDocumento
                .setIdTipoSolicitud(input.getId())		
                .setNombre(input.getNombre())
                .setEstado(input.getEstado());		

            checkStatus = tipoSolicitudRepository.edit(tipoDocumento);  
            
        }else{
            checkStatus.setApistatus(Status.Error);
            checkStatus.setApimessage(error);
        }
        
        return checkStatus;
    }
	
    public CheckStatus delete(Integer id) {
        CheckStatus checkStatus= new CheckStatus();
        checkStatus = tipoSolicitudRepository.delete(id);
        return checkStatus;
    }
        
}
