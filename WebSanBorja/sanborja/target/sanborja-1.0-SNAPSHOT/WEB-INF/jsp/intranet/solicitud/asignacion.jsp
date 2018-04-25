<%-- 
    Document   : new
    Created on : 03/12/2017, 09:32:59 PM
    Author     : Marlon Cordova
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../template/header.jsp" %>
    </head>
    <body>
        <%@include file="../template/menu.jsp" %>
        <div class="container-fluid" style="padding-top: 10px"> 
        <nav aria-label="breadcrumb" role="navigation">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item"><a href="<c:url value = "/intranet"/>">Atención al Ciudadano</a></li>
              <li class="breadcrumb-item active" aria-current="page">Asignación</li>
            </ol>
        </nav>       
              
         <div class="card">
            <div class="card-header">                 
                <h3>Asignación de solicitudes</h3>
            </div>
                <div class="card-body">
                      <c:url var="action" value = "/intranet" />
                    <div class="row form">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="cboArea">(*) Seleccione Area:</label>                            
                                <select id="cboArea" class="form-control">
                                    <option value="0">Seleccione</option>
                                <c:forEach var="entity" items="${listArea}">
                                    <option value="${entity.id}">${entity.nombre}</option>
                                </c:forEach>
                                </select>
                          </div>                        
                        </div>
                        <div class="col-sm-6"> <div class="form-group">
                             <label for="cboEmpleado">(*) Seleccione Empleado:</label>                            
                             <select id="cboEmpleado" class="form-control">
                                 <option value="0">Seleccione</option>
                             </select></div>
                        </div>
                         
                    </div>   
                    <div class="row form">
                        <div class="col-sm-12">
                            <div class="form-group">
                             <label for="cboArea">(*) Ingrese Observación:</label>   
                             <textarea id="txtDescripcion" class="form-control"></textarea>
                             </div>
                        </div>
                    </div>
           
                    <div class="row" style="padding-top: 10px;padding-bottom: 10px; ">
                        <h4>(*) Seleccione Solicitudes</h4>
                        <hr/>
                    </div>
                     <div class="row" style="padding-top: 10px;padding-bottom: 10px; ">
                        
                        <table class="table table-striped">
                           <thead class="mdb-color darken-1">
                               <tr class="text-white">
                                   <th width="12%">Sel</th>
                                   <th width="10%">Número</th>
                                   <th width="8%">Tipo</th>
                                   <th width="15%">Fecha Creación</th>
                                   <th width="30%">Solicitante</th>
                                   <th width="15%">Estado</th>
                               </tr>
                           </thead>
                           <c:forEach var="entity" items="${list}">
                               <tr>
                                   <td>
                                       <input type="checkbox" id="chkSolicitud" name="chkSolicitud" class="chkSolicitud" value="${entity.id}"/>
                                           &nbsp;
                                       <a href="<c:url value = "/intranet/solicitud/ver/${entity.id}"/>"  class="btn btn-sm btn-success">
                                           <i class="fa fa-search" aria-hidden="true"></i> 
                                       </a>   
                                       
                                       
                                   </td>
                                   <td>${entity.numero}</td>
                                   <td>${entity.tipo}</td>   
                                   <td>${entity.fechaCreacion}</td> 
                                   <td>${entity.solicitante}</td> 
                                   <td>${entity.estado}</td>  
                               </tr>
                           </c:forEach>
                       </table>
                
                        </div>   
                    <div class="row" style="padding-top: 10px;padding-bottom: 50px; ">
                        <button type="button" id="btnGuardar" class="btn btn-primary">Asignar</button>
                        <button type="reset" class="btn">lIMPIAR</button>
                    </div>
                 
        </div>
             
        </div>        
     </div>        
 
        <%@include file="../template/footer.jsp" %>
        <%@include file="../template/footerjs.jsp" %>     
        <script type="text/javascript">
            $(document).ready(function() { 
                $('#cboArea').change(function() {
                    idArea=this.value;

                    $.getJSON(
                        "${action}/empleado/"+idArea,                     
                        function(data) {
                            var html = '';
                            var len = data.length;
                             html += '<option value="0">Seleccione</option>';
                            for ( var i = 0; i < len; i++) {
                                    html += '<option value="' + data[i].id + '">'
                                                    + data[i].nombre + '</option>';
                            }
                            html += '</option>';
                            //now that we have our options, give them to our select
                            $('#cboEmpleado').html(html);
                            $('#cboEmpleado').val(0);
                        }
                     );
                });
                
                 $('#btnGuardar').click(function () {
                       var oTemplate = {
                            "idEmpleado": "0",
                            "observacion": "",                         
                            "solicitudes": []
                        }               
                 
                     oTemplate.idEmpleado= $('#cboEmpleado').val();
                     oTemplate.observacion= $('#txtDescripcion').val();
                     
                     $('input.chkSolicitud:checkbox').each(function () {
                        var valor = $(this).val();
                         
                        if ($(this).is(":checked")) {
                          oTemplate.solicitudes.push(valor);
                        }
                    });
                    var mensaje="";
                    if(oTemplate.idEmpleado=="0"){
                        mensaje+="- Debe seleccionar un empleado. \n";
                        
                    }
                    
                    if(oTemplate.observacion.trim().length==0){
                        mensaje+="- Debe ingresar observacion. \n";
                        
                    }
                    
                    if(oTemplate.solicitudes.length==0){
                        
                        mensaje+="- Debes seleccionar al menos una solicitud. \n";
                    }
                    
                    if(mensaje.length==0){
                   // alert(JSON.stringify(oTemplate));
                    
                     $.ajax({
                            type: "POST",
                            //the url where you want to sent the userName and password to
                            url: '${action}/asignar/',
                            contentType: "application/json; charset=utf-8",                            
                            dataType: 'json',
                            async: false,
                            //json object to sent to the authentication url
                            data: JSON.stringify(oTemplate),
                            success: function (response) {
                                console.log(JSON.stringify(response));
                                 if(response.apistatus=="OK"){
                                         alert(response.apimessage);    
                                         //load
                                         location.reload();


                                 }
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                console.log(textStatus);
                            }
                            
                        })
                    }else{
                        alert(mensaje);
                    
                    }
                });
            });
        </script>
    </body>
</html>
