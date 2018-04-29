/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sanborja.gac.controllers;

import com.sanborja.gac.model.api.Data;
import com.sanborja.gac.model.api.MotivoQuery;
import com.sanborja.gac.services.MotivoService;
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
 * @update by Omar Diaz 
 */
@Controller
public class MotivoController {
    @Autowired
    MotivoService motivoService;
    
    @RequestMapping("/intranet/motivo")  
    public String index(Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        Data<MotivoQuery> data = motivoService.query();
        model.addAttribute("list",data.getData());  
        
        return "intranet/motivo/index";
    }    
}
