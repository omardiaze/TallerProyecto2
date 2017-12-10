/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sanborja.gac.controllers;

import com.sanborja.gac.model.api.Status;
import com.sanborja.gac.model.api.TipoDocumentoApiIdOutput;
import com.sanborja.gac.services.TipoDocumentoService;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Marlon Cordova
 */

@RestController
public class TipoDocumentoRestController {
    @Autowired
    TipoDocumentoService tipoDocumentoService;
    
    
    @RequestMapping(value="/api/tipodocumento/{tipo}/{numero}",method = RequestMethod.GET)
    public ResponseEntity<TipoDocumentoApiIdOutput> findById(@PathVariable("tipo") Integer tipo,
                @PathVariable("numero") String numero) {
        
        //System.out.print(tipo);
        //System.out.print(numero);
        TipoDocumentoApiIdOutput data = new TipoDocumentoApiIdOutput();
        try{
            data= tipoDocumentoService.findById(tipo, numero);
        }catch (IOException ex){
        
        } catch (JSONException ex) {
            Logger.getLogger(TipoDocumentoRestController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        System.out.print(data.getApistatus());
        if(data.getApistatus().equals(Status.Ok)) {
            return new ResponseEntity<TipoDocumentoApiIdOutput>(data, HttpStatus.OK);
        }else	 {
            return new ResponseEntity<TipoDocumentoApiIdOutput>(data, HttpStatus.NOT_FOUND);
        }
    }
    
}
