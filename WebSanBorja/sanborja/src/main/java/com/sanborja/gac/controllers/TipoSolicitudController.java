/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sanborja.gac.controllers;

import com.sanborja.gac.entities.api.Data;
import com.sanborja.gac.entities.api.TipoSolicitudQuery;
import com.sanborja.gac.services.TipoSolicitudService;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Marlon Cordova
 */
@Controller
public class TipoSolicitudController {
    @Autowired
    TipoSolicitudService tipoSolicitudService;
    
    @RequestMapping("/intranet/tiposolicitud")  
    public String principal(Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        Data<TipoSolicitudQuery> data = tipoSolicitudService.query();
        model.addAttribute("list",data.getData());
        model.addAttribute("demo", data.getData().size());   
        
        return "intranet/tiposolicitud/index";
    }     
}
