/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sanborja.gac.controllers;

import com.sanborja.gac.model.api.Data;
import com.sanborja.gac.model.api.TipoDocumentoQuery;
import com.sanborja.gac.services.TipoDocumentoService;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

/**
 *
 * @author Marlon Cordova
 */
@Controller
public class TipoDocumentoController {
    
    @Autowired
    TipoDocumentoService motivoService;
    
    @RequestMapping("/intranet/tipodocumento")  
    public String index(Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        Data<TipoDocumentoQuery> data = motivoService.query();
        model.addAttribute("list",data.getData());  
        
        return "intranet/tipodocumento/index";
    }    
}
