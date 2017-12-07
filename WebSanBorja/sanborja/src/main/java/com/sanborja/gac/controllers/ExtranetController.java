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
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
     
    @Autowired
    ServletContext context; 
    
    @RequestMapping("/extranet")  
    public String index(Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        SolicitudInput solicitud = new SolicitudInput();
        solicitud.setIdTipoDocumento(1);
        solicitud.setIdTipoSolicitud(1);
        solicitud.setIdMotivo(0);
        solicitud.setNotificacion(1);
        
        Data<MotivoQuery> dataMotivo = motivoService.query(1);
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
       
        Data<MotivoQuery> dataMotivo = motivoService.query(1);
        Data<TipoDocumentoQuery> dataTipoDocumento = tipoDocumentoService.query();
        
        model.addAttribute("motivos", dataMotivo.getData());        
        model.addAttribute("tipodocumentos", dataTipoDocumento.getData());        
        
        if(solicitud.getFile().isEmpty()){
            System.out.println("no file");
            solicitud.setFileName("");
        }else{
            DateFormat df = new SimpleDateFormat("MMddyyyyHHmmss");
            // Get the date today using Calendar object.
            Date today = Calendar.getInstance().getTime();        
            // Using DateFormat format method we can create a string 
            // representation of a date with the defined format.
            String reportDate = df.format(today);

            // Print what date is today!
            System.out.println("Report Date: " + reportDate);
            String uploadPath = context.getRealPath("");     
            
            String cFilename=reportDate+solicitud.getFile().getOriginalFilename();
            solicitud.setFileName(cFilename);
            FileCopyUtils.copy(solicitud.getFile().getBytes(), new File(uploadPath+File.separator+"resources"+File.separator+"file" +File.separator+ cFilename));            
        }
        
        
        checkStatus=  solicitudService.create(solicitud);
        
        if(checkStatus.getApistatus().equals(Status.Ok)){   
            solicitud = new SolicitudInput();
            solicitud.setIdTipoDocumento(1);
            solicitud.setIdTipoSolicitud(1);
            solicitud.setIdMotivo(0);
            solicitud.setNotificacion(1);
            
            model.addAttribute("error",null);
            model.addAttribute("ok",checkStatus.getApimessage());
              
        }else{ 
            model.addAttribute("error", checkStatus.getApimessage());
            model.addAttribute("ok",null);
            
        }       
        model.addAttribute("solicitud", solicitud);   
        return "extranet/index";
    }
    
    
    @RequestMapping(value = "/extranet/tipo/{id}", method = RequestMethod.GET)
    public @ResponseBody List<MotivoQuery> findProjectDurations(@PathVariable("id") int id, 
            HttpServletResponse response, HttpSession p_session) {
        
        Data<MotivoQuery> dataMotivo = motivoService.query(id);
        List<MotivoQuery> list= new ArrayList<MotivoQuery>();        
        try
        {            
            list= dataMotivo.getData();        
        }
        catch(Exception ex)
        {

        }
        return list;
    }
    
}
