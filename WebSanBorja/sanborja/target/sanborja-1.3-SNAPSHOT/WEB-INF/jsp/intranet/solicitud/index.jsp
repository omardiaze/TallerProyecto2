<%-- 
    Document   : index
    Created on : 03/12/2017, 09:44:40 PM
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
                  <li class="breadcrumb-item"><a href="<c:url value = "/intranet"/>">Atención al Ciudadano</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Solicitudes</li>
                </ol>
            </nav>               
            
            <div class="card">
                <div class="card-header">                 
                    <h3>Solicitudes </h3>
                </div>
                <div class="card-body">
                 <table class="table table-striped">
                    <thead class="mdb-color darken-1">
                        <tr class="text-white">
                            <th width="12%"></th>
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
                                <a href="<c:url value = "/intranet/solicitud/ver/${entity.id}"/>"  class="btn btn-sm btn-success">
                                    <i class="fa fa-search" aria-hidden="true"></i> 
                                </a>   
                                    &nbsp;
                                <a href="<c:url value = "/intranet/solicitud/eliminar/${entity.id}"/>"   class="btn btn-sm btn-danger">
                                    <i class="fa fa-remove" aria-hidden="true"></i> 
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
            </div>
             
        </div>        
    
 
        <%@include file="../template/footer.jsp" %>
        <%@include file="../template/footerjs.jsp" %>
    </body>
</html>
