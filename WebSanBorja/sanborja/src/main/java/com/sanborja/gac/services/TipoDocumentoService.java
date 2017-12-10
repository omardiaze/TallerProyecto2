/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sanborja.gac.services;

import com.sanborja.gac.model.api.Data;
import com.sanborja.gac.model.api.Status;
import com.sanborja.gac.model.api.TipoDocumentoApiIdOutput;
import com.sanborja.gac.model.api.TipoDocumentoQuery;
import com.sanborja.gac.persistence.TipoDocumentoRepository;
import java.io.IOException;
import java.util.List;
import okhttp3.FormBody;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import org.apache.commons.lang3.StringUtils;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
//import org.springframework.util.StringUtils;


/**
 *
 * @author Marlon Cordova
 */
@Service
public class TipoDocumentoService {
    
    @Autowired
    TipoDocumentoRepository tipoDocumentoRepository;

    public Data<TipoDocumentoQuery> query() {
        Data <TipoDocumentoQuery> data = new Data<TipoDocumentoQuery>();
        List<TipoDocumentoQuery> list;
        list = tipoDocumentoRepository.query();

        if(list!=null) {
            if(!list.isEmpty()) {
                data.setApistatus(Status.Ok);
            }else{
                    data.setApistatus(Status.Error);
                    data.setApimessage("No hay datos");
            }
        }else{
                data.setApistatus(Status.Error);
                data.setApimessage("No hay datos");
        }

        data.setData(list);
        return data;
    }

    public TipoDocumentoApiIdOutput findById(int tipo,String numero) throws IOException, JSONException {
        TipoDocumentoApiIdOutput documento = new TipoDocumentoApiIdOutput();
        
        documento = tipoDocumentoRepository.findById(tipo, numero);
        
        if(documento!=null) {
            if(documento.getNumero().trim().length()!=0) {
                    documento.setApistatus(Status.Ok);

            }else{
                    documento.setApistatus(Status.Error);
                    documento.setApimessage("No hay datos");
            }
        }else{
            //buscar dni
            boolean bExiste=false;
            OkHttpClient client = new OkHttpClient();
            RequestBody formBody = new FormBody.Builder()
                   .add("ndni", numero)
                   .build();
            Request request = new Request.Builder()
               .url("https://demos.geekdev.ml/reniec/consulta.php")
               .post(formBody)
               .build();

            try{
                Response response = client.newCall(request).execute();
                if (response.isSuccessful()){
                    bExiste=true;
                    System.out.println(response.body());
                    String jsonData = response.body().string();
                    JSONObject  Jobject = new JSONObject(jsonData);
                    if(Jobject.get("success").toString().equals("true")){
                        JSONObject Jpersona = Jobject.getJSONObject("result");
                        
                        String TempNombre =(Jpersona.getString("Nombre").toLowerCase());
                        String Paterno=StringUtils.capitalize(Jpersona.getString("Paterno").toLowerCase());
                        String Materno=StringUtils.capitalize(Jpersona.getString("Materno").toLowerCase());
                        String Nombre=""; 
                        
                        String[] parts = TempNombre.split(" ");
                        
                        for(String nombres:parts){
                            Nombre+=StringUtils.capitalize(nombres)+" ";
                        }
                        
                        documento = new TipoDocumentoApiIdOutput();
                        documento.setNumero(Jpersona.getString("DNI"));
                        documento.setNombre(Nombre.trim());
                        documento.setApellidos(Paterno+ " "+Materno);
                        
                        documento.setApistatus(Status.Ok);
                        
                    }
                }
            }catch (IOException ex){
                System.out.print(ex.getMessage());
            }

            if(bExiste==false){
                documento = new TipoDocumentoApiIdOutput();
                documento.setApistatus(Status.Error);
                documento.setApimessage("No hay datos");
            }
        }
        
        return documento;
    }
}
