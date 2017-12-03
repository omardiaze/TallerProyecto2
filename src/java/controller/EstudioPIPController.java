/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.bean.BeanEstudioPIP;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import persistence.EstudioPIPDAO;

/**
 *
 * @author Juanka
 */
@Controller
public class EstudioPIPController extends HttpServlet {
    
    @Autowired
    EstudioPIPDAO estudiopipdao;    
    
    @RequestMapping("/mant_estudioPIP")  
    public String mant_estudioPIP(Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<BeanEstudioPIP> list = estudiopipdao.getEstudiosPIP();
        BeanEstudioPIP estudiopip = new BeanEstudioPIP();
        model.addAttribute("estudiopip", estudiopip);
        model.addAttribute("list", list);        

        return "mant_estudioPIP";
    }    
    
    @RequestMapping(value = "/editEstudioPIP/{id_estudio}", method = RequestMethod.GET)
    public String editEstudioPIP(Model model, HttpServletRequest request, HttpServletResponse response,
            @PathVariable String id_estudio) {
        
        BeanEstudioPIP estudiopip = estudiopipdao.getEstudioPIPByCode(id_estudio);
        
        model.addAttribute("saveorupdate", "update");
        model.addAttribute("estudiopip", estudiopip);
        
        model.addAttribute("estudiopip_err", null);        
        
        return "estudioPIP_form";
    }    
    
    @RequestMapping(value = "/newEstudioPIP", method = RequestMethod.GET)
    public String newComplejo(Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        BeanEstudioPIP estudiopip = new BeanEstudioPIP();
        
        model.addAttribute("saveorupdate", "save");
        model.addAttribute("estudiopip", estudiopip);
        model.addAttribute("estudiopip_err", null);
        
        return "estudioPIP_form";
    }
    
    @RequestMapping(value = "/editEstudioPIP/updateEstudioPIP", method = RequestMethod.POST)
    public String updateEtudioPIP(@ModelAttribute("estudiopip") BeanEstudioPIP estudiopip,
            Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        try {
            estudiopipdao.update(estudiopip);
        } catch (DuplicateKeyException d) {
            model.addAttribute("estudiopip_err", d.getMessage());
            return "estudioPIP_form";
        }
        return "redirect:/mant_estudioPIP.html";
    }    
    
    @RequestMapping(value = "/saveEstudioPIP", method = RequestMethod.POST)
    public String saveComplejo(@ModelAttribute("estudiopip") BeanEstudioPIP estudiopip,
            Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
            try {
                estudiopipdao.save(estudiopip);
            } catch (DuplicateKeyException d) {
                model.addAttribute("estudiopip_err", d.getMessage());
                return "estudioPIP_form";
            }
            return "redirect:/mant_estudioPIP.html";
    }    

}
