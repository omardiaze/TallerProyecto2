/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sanborja.gac.controllers;

import com.sanborja.gac.entities.api.Status;
import com.sanborja.gac.entities.api.CatalogoQuery;
import com.sanborja.gac.entities.api.CheckStatus;
import com.sanborja.gac.entities.api.Data;
import com.sanborja.gac.entities.api.TipoSolicitudFindByIdOutput;
import com.sanborja.gac.entities.api.TipoSolicitudInput;
import com.sanborja.gac.entities.api.TipoSolicitudQuery;
import com.sanborja.gac.services.CatalogoService;
import com.sanborja.gac.services.TipoSolicitudService;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Marlon Cordova
 */
@Controller
public class TipoSolicitudController {
    @Autowired
    TipoSolicitudService tipoSolicitudService;
    
    @Autowired
    CatalogoService catalogoService;
    
    @RequestMapping("/intranet/tiposolicitud")  
    public String index(Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        Data<TipoSolicitudQuery> data = tipoSolicitudService.query();
        model.addAttribute("list",data.getData());
        model.addAttribute("demo", data.getData().size());   
        
        return "intranet/tiposolicitud/index";
    }    
    
    @RequestMapping(value = "/intranet/tiposolicitud/crear", method = RequestMethod.GET)
    public String create(Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        TipoSolicitudInput tipoSolicitud = new TipoSolicitudInput();         
        Data<CatalogoQuery> dataCatalogo = catalogoService.query();
        
        model.addAttribute("tipoSolicitud", tipoSolicitud);
        model.addAttribute("estados", dataCatalogo.getData());        
        model.addAttribute("error", null);                            
        
        return "intranet/tiposolicitud/new";
    }
    
    @RequestMapping(value = "/intranet/tiposolicitud/crear", method = RequestMethod.POST)
    public String save(@ModelAttribute("tipoSolicitud") TipoSolicitudInput tipoSolicitud,
        Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        CheckStatus checkStatus= new CheckStatus();
                
        checkStatus=  tipoSolicitudService.create(tipoSolicitud);
        String controller="intranet/tiposolicitud/"; 
        
        Data<CatalogoQuery> dataCatalogo = catalogoService.query();
       
        if(checkStatus.getApistatus().equals(Status.Ok)){
        
            TipoSolicitudFindByIdOutput tipoSolicitudInd = tipoSolicitudService.findById(Integer.parseInt(checkStatus.getId()));
                        
            model.addAttribute("tipoSolicitud", tipoSolicitudInd);
            model.addAttribute("error",null);
            model.addAttribute("ok",checkStatus.getApimessage());
            controller+="edit";
         
        }else{
            
            model.addAttribute("error", checkStatus.getApimessage());
            model.addAttribute("tipoSolicitud", tipoSolicitud);
            controller+="new";
        }       
        
        model.addAttribute("estados", dataCatalogo.getData()); 
        
        return controller;
    }
    
    @RequestMapping(value = "/intranet/tiposolicitud/editar/{id}", method = RequestMethod.GET)
    public String edit(Model model, HttpServletRequest request, HttpServletResponse response,
            @PathVariable int id) {
        
        TipoSolicitudFindByIdOutput tipoSolicitud = tipoSolicitudService.findById(id);
        
        Data<CatalogoQuery> dataCatalogo = catalogoService.query();
                
        model.addAttribute("tipoSolicitud", tipoSolicitud);
        model.addAttribute("estados", dataCatalogo.getData());        
        model.addAttribute("error", null);           
        model.addAttribute("exito", null);          
        
        return "intranet/tiposolicitud/edit";
    }    
    
    @RequestMapping(value = "/intranet/tiposolicitud/editar", method = RequestMethod.POST)
    public String update(@ModelAttribute("tipoSolicitud") TipoSolicitudInput tipoSolicitud,
        Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        CheckStatus checkStatus= new CheckStatus();
         
        System.out.print("codigo: "+tipoSolicitud.getCodigo());
        checkStatus=  tipoSolicitudService.edit(tipoSolicitud);
        String controller="intranet/tiposolicitud/edit"; 
        
        Data<CatalogoQuery> dataCatalogo = catalogoService.query();
        model.addAttribute("tipoSolicitud", tipoSolicitud);
        model.addAttribute("estados", dataCatalogo.getData()); 
        
        if(checkStatus.getApistatus().equals(Status.Ok)){
         
            model.addAttribute("error",null);
            model.addAttribute("ok",checkStatus.getApimessage());
         
        }else{
            model.addAttribute("ok",null);
            model.addAttribute("error", checkStatus.getApimessage());
            
        }       
        
        
        
        return controller;
    }   
   
    @RequestMapping(value = "/intranet/tiposolicitud/eliminar/{id}", method = RequestMethod.GET)
    public String delete(Model model, HttpServletRequest request, HttpServletResponse response,
            @PathVariable int id) {
        
        tipoSolicitudService.delete(id);
        
        
        return "redirect:/intranet/tiposolicitud";
    }    
    
}
