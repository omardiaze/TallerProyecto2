/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sanborja.gac.controllers;


import com.sanborja.gac.model.api.CheckStatus;
import com.sanborja.gac.model.api.Data;
import com.sanborja.gac.model.api.MotivoQuery;
import com.sanborja.gac.model.api.Status;
import com.sanborja.gac.model.api.TipoSolicitudFindByIdOutput;
import com.sanborja.gac.model.api.SolicitudInput;
import com.sanborja.gac.model.api.TipoDocumentoQuery;
import com.sanborja.gac.model.api.TipoSolicitudQuery;
import com.sanborja.gac.services.MotivoService;
import com.sanborja.gac.services.TipoDocumentoService;
import com.sanborja.gac.services.SolicitudService;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
/**
 *
 * @author Marlon Cordova
 */

@Controller
public class ExtranetController {
    @Autowired
    MotivoService motivoService;
    
    @Autowired
    TipoDocumentoService tipoDocumentoService;
    
    @Autowired
    SolicitudService solicitudService;
     
    @RequestMapping("/extranet")  
    public String index(Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        SolicitudInput solicitud = new SolicitudInput();
        solicitud.setIdTipoDocumento(1);
        solicitud.setIdTipoSolicitud(1);
        solicitud.setIdMotivo(1);
        
        Data<MotivoQuery> dataMotivo = motivoService.query();
        Data<TipoDocumentoQuery> dataTipoDocumento = tipoDocumentoService.query();
        
        model.addAttribute("motivos", dataMotivo.getData());        
        model.addAttribute("tipodocumentos", dataTipoDocumento.getData());        
        model.addAttribute("solicitud", solicitud);   
        return "extranet/index";
    }
    
    @RequestMapping(value = "/extranet", method = RequestMethod.POST)
    public String save(@ModelAttribute("solicitud") SolicitudInput solicitud,
        Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        CheckStatus checkStatus= new CheckStatus();
        checkStatus=  solicitudService.create(solicitud);
        Data<MotivoQuery> dataMotivo = motivoService.query();
        Data<TipoDocumentoQuery> dataTipoDocumento = tipoDocumentoService.query();
        
        model.addAttribute("motivos", dataMotivo.getData());        
        model.addAttribute("tipodocumentos", dataTipoDocumento.getData());        
        
        
        if(checkStatus.getApistatus().equals(Status.Ok)){   
            solicitud = new SolicitudInput();

            model.addAttribute("error",null);
            model.addAttribute("ok",checkStatus.getApimessage());
              
        }else{ 
            model.addAttribute("error", checkStatus.getApimessage());
            model.addAttribute("ok",null);
            
        }       
        model.addAttribute("solicitud", solicitud);   
        return "extranet/index";
    }
    
}
