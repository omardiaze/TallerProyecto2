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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
/**
 *
 * @author Marlon Cordova
 */
@Controller
public class SolicitudController {
     
    @Autowired
    SolicitudService solicitudService;
    
    @Autowired
    EmpleadoService empleadoService;
            
    @Autowired
    AreaService areaService;
    
    @RequestMapping("/intranet/solicitud")  
    public String index(Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        HttpSession session = request.getSession();        
        Data<SolicitudQuery> data = solicitudService.query();
        model.addAttribute("list",data.getData());
        return "intranet/solicitud/index";
    }
    
    @RequestMapping(value = "/intranet/solicitud/aceptar/{id}", method = RequestMethod.GET)
    public String accept(Model model, HttpServletRequest request, HttpServletResponse response,
            @PathVariable int id)
    {
        solicitudService.aceptar(id);                
        return "redirect:/intranet/solicitud";
    }
    
    @RequestMapping("/intranet/asignacion")  
    public String asignacion(Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        HttpSession session = request.getSession();        
        Data<SolicitudQuery> data = solicitudService.queryAceptado();
        Data<AreaQuery> dataArea = areaService.query();
        
        AsignacionInput asignacion = new AsignacionInput();
        
        model.addAttribute("list",data.getData());
        model.addAttribute("listArea",dataArea.getData());
        model.addAttribute("asignacion", asignacion);   
           
        return "intranet/solicitud/asignacion";
    }
    
    @RequestMapping(value = "/intranet/asignar", method = RequestMethod.POST)
    public @ResponseBody CheckStatus asignar(@ModelAttribute("asignar") AsignacionInput solicitud, 
            HttpServletResponse response, HttpSession p_session) {
        
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
        return checkStatus;
    }
    
     @RequestMapping(value = "/intranet/empleado/{id}", method = RequestMethod.GET)
    public @ResponseBody List<EmpleadoQuery> findEmpleado(@PathVariable("id") int id, 
            HttpServletResponse response, HttpSession p_session) {
        
        Data<EmpleadoQuery> dataMotivo = empleadoService.query(id);
        List<EmpleadoQuery> list= new ArrayList<EmpleadoQuery>();        
        try
        {            
            list= dataMotivo.getData();        
        }
        catch(Exception ex)
        {

        }
        return list;
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
            @PathVariable int id)
    {
        solicitudService.delete(id);                
        return "redirect:/intranet/solicitud";
    }
}
