<%-- 
    Document   : view
    Created on : 04/12/2017, 11:09:32 PM
    Author     : Marlon Cordova
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../template/header.jsp" %>
    </head>
    <body>
        <%@include file="../template/menu.jsp" %>
          
        <div class="container-fluid" style="padding-top: 10px; padding-bottom: 50px;">     
            
             <nav aria-label="breadcrumb" role="navigation">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">Home</a></li>
                  <li class="breadcrumb-item"><a href="<c:url value = "/intranet"/>">Atención al Ciudadano</a></li>
                  <li class="breadcrumb-item" aria-current="page"><a href="<c:url value = "/intranet/solicitud"/>">Solicitudes</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Ver</li>
                </ol>
            </nav>               
             
            <div class="card">
                <div class="card-header">                 
                    <h3>${solicitud.tipo} </h3>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label  >Número</label>
                                <input type="text" class="form-control" value="${solicitud.numero}" disabled="disabled"/>
                                
                            </div>  
                        </div>                                
                                               
                    </div> 
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label>Fecha Creación</label>
                                <input type="text" class="form-control" value="${solicitud.fechaCreacion}" disabled="disabled"/>
                                
                            </div>  
                        </div>                                
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label >Fecha Limite </label>
                                <input type="text" class="form-control" value="${solicitud.fechaLimite}" disabled="disabled"/>                                
                            </div>  
                        </div>
                            
                    </div>          
                            
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label>Solicitante</label>
                                <input type="text" class="form-control" value="${solicitud.solicitante}" disabled="disabled"/>
                                
                            </div>  
                        </div>                                
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label >${solicitud.tipoDocumento}</label>
                                <input type="text" class="form-control" value="${solicitud.numeroDocumento}" disabled="disabled"/>                                
                            </div>  
                        </div>
                            
                    </div>                              
                    
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label>Motivo</label>
                                <input type="text" class="form-control" value="${solicitud.motivo}" disabled="disabled"/>
                                
                            </div>  
                        </div>         
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label>Documento</label>
                                <span  class="form-control">
                                    <c:if test="${not empty solicitud.file}">
                                        <a href="<c:url value = "/resources/file/" />${solicitud.file}">Descargar</a>
                                    </c:if>
                                </span>
                            </div>  
                        </div>        
                    </div>           
                    
                     <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label>Descripción</label>
                                <textarea rows="4" class="form-control" disabled="disabled" >${solicitud.descripcion}</textarea>                                
                            </div>  
                        </div>               
                            
                    </div>     
                            
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label>Telefono</label>
                                <input type="text" class="form-control" value="${solicitud.telefono}" disabled="disabled"/>
                                
                            </div>  
                        </div>                                
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label >Correo</label>
                                <input type="text" class="form-control" value="${solicitud.correo}" disabled="disabled"/>                                
                            </div>  
                        </div>                            
                    </div>    
                            
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label>Dirección</label>
                                <textarea class="form-control" disabled="disabled" >${solicitud.direccion}</textarea>                                                                
                            </div>  
                        </div>               
                            
                    </div>           
                            
                </div>
            </div>             
         
                  
        </div>        
    
 
        <%@include file="../template/footer.jsp" %>
        <%@include file="../template/footerjs.jsp" %>
    </body>
</html>