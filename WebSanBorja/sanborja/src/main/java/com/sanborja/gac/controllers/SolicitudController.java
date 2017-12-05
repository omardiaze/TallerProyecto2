/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sanborja.gac.controllers;

import com.sanborja.gac.model.api.Data;
import com.sanborja.gac.model.api.MotivoQuery;
import com.sanborja.gac.model.api.SolicitudFindByIdOutput;
import com.sanborja.gac.model.api.SolicitudQuery;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
/**
 *
 * @author Marlon Cordova
 */
@Controller
public class SolicitudController {
     
    @Autowired
    SolicitudService solicitudService;
    
    @RequestMapping("/intranet/solicitud")  
    public String index(Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
         Data<SolicitudQuery> data = solicitudService.query();
         model.addAttribute("list",data.getData());
        return "intranet/solicitud/index";
    }
    
      @RequestMapping(value = "/intranet/solicitud/ver/{id}", method = RequestMethod.GET)
    public String edit(Model model, HttpServletRequest request, HttpServletResponse response,
            @PathVariable int id) {
        
        SolicitudFindByIdOutput tipoSolicitud = solicitudService.findById(id);
        
        model.addAttribute("solicitud", tipoSolicitud);
       
         
        
        return "intranet/solicitud/view";
    }    
    
   @RequestMapping(value = "/intranet/solicitud/eliminar/{id}", method = RequestMethod.GET)
    public String delete(Model model, HttpServletRequest request, HttpServletResponse response,
            @PathVariable int id) {
        
        solicitudService.delete(id);        
        
        return "redirect:/intranet/solicitud";
    }   
}
