/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sanborja.gac.controllers;

import com.sanborja.gac.model.api.AreaQuery;
import com.sanborja.gac.model.api.AsignacionInput;
import com.sanborja.gac.model.api.CheckStatus;
import com.sanborja.gac.model.api.Data;
import com.sanborja.gac.model.api.EmpleadoQuery;
import com.sanborja.gac.model.api.MotivoQuery;
import com.sanborja.gac.model.api.SolicitudFindByIdOutput;
import com.sanborja.gac.model.api.SolicitudQuery;
import com.sanborja.gac.services.AreaService;
import com.sanborja.gac.services.EmpleadoService;
 
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.sanborja.gac.services.SolicitudService;
import java.util.ArrayList;
import java.util.List;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.http.HttpStatus;
/**
 *
 * @author Marlon Cordova
 */
@RestController
public class SolicitudRestController {
    
    @Autowired
    SolicitudService solicitudService;
      
    @RequestMapping(value="/intranet/asignar",method = RequestMethod.POST, produces = "application/json", consumes = "application/json")
    public ResponseEntity<CheckStatus> create(@RequestBody   AsignacionInput solicitud ){	 
        
        CheckStatus checkStatus= new CheckStatus();
        //Data<EmpleadoQuery> dataMotivo = empleadoService.query(id);
          
        try
        {         
            System.out.println(solicitud.getIdEmpleado());
            System.out.println(solicitud.getObservacion());
            checkStatus= solicitudService.asignacion(solicitud);
        //    list= dataMotivo.getData();        
        }
        catch(Exception ex)
        {

        }
       return new ResponseEntity<CheckStatus>(checkStatus, HttpStatus.CREATED);
    }
}
