<%-- 
    Document   : index
    Created on : 03/12/2017, 09:14:04 PM
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
          
        <div class="container-fluid" style="padding-top: 10px">     
            
            <nav aria-label="breadcrumb" role="navigation">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">Home</a></li>
                  <li class="breadcrumb-item"><a href="#">Atención al Ciudadano</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Tipo de Solicitud</li>
                </ol>
            </nav>              
            
            <div class="card">
              <div class="card-header">
                  <div style="float: left;margin-top: 7px">
                      <h3>Tipo de Solicitud </h3>
                  </div>
                  <div style="float: right">
                        <a href="/sanborja/intranet/tiposolicitud/nuevo"  class="btn btn-md btn-primary">
                            <i class="fa fa-plus" aria-hidden="true"></i> &nbsp; Nuevo
                        </a>           
                  </div>
                  <div style="clear: both"></div>
              </div>
              <div class="card-body">
                 <table class="table table-striped">
                    <thead class="mdb-color darken-1">
                        <tr class="text-white">
                            <th width="12%"></th>
                            <th width="15%">Código</th>
                            <th width="40%">Nombre</th>
                            <th width="15%">Estado</th>
                        </tr>
                    </thead>
                    <c:forEach var="entity" items="${list}">
                        <tr>
                            <td>
                                <a href="/sanborja/intranet/tiposolicitud/editar/${entity.id}"  class="btn btn-sm btn-success">
                                    <i class="fa fa-edit" aria-hidden="true"></i> 
                                </a>   
                                    &nbsp;
                                <a href="/sanborja/intranet/tiposolicitud/editar/${entity.id}"  class="btn btn-sm btn-danger">
                                    <i class="fa fa-remove" aria-hidden="true"></i> 
                                </a>   
                            </td>
                            <td>${entity.codigo}</td>
                            <td>${entity.nombre}</td>                                     
                            <td>${entity.estado}</td>  
                        </tr>
                    </c:forEach>
                </table>
              </div>
            </div>
             
        </div>        
    
 
        <%@include file="../template/footer.jsp" %>
        <%@include file="../template/footerjs.jsp" %>
    </body>
</html>
