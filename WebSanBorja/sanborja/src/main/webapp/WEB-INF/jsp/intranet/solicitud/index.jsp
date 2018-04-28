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
                  <li class="breadcrumb-item active" aria-current="page">Aprobación</li>
                </ol>
            </nav>               
            
            <div class="card">
                <div class="card-header">                 
                    <h3>Aprobación de solicitudes</h3>
                </div>
                <div class="card-body">
                 <table class="table table-striped">
                    <thead class="mdb-color darken-1">
                        <tr class="text-white">
                            <th width="20%"></th>
                            <th width="10%">Número</th>
                            <th width="8%">Tipo</th>
                            <th width="15%">Fecha Creación</th>
                            <th width="25%">Solicitante</th>
                            <th width="15%">Estado</th>
                        </tr>
                    </thead>
                    <c:forEach var="entity" items="${list}">
                        <tr>
                            <td>
                                <a data-href="<c:url value = "/intranet/solicitud/ver/${entity.id}"/>"  class="btn btn-sm btn-success" data-toggle="modal" data-target="#modal-detalle">
                                    <i class="fa fa-search" aria-hidden="true"></i> 
                                </a>   
                                &nbsp;                                
                                <c:choose>
                                    <c:when test="${entity.estado =='Pendiente'}">
                                        <a href="<c:url value = "/intranet/solicitud/aceptar/${entity.id}"/>"   class="btn btn-sm btn-success">
                                            <i class="fa fa-check" aria-hidden="true"></i> 
                                        </a> 
                                    </c:when>
                                    <c:when test="${entity.estado =='Aprobado'}">
                                        <a href="!#"   class="btn btn-sm btn-default disabled">
                                            <i class="fa fa-check" aria-hidden="true"></i> 
                                        </a> 
                                    </c:when>
                                    <c:otherwise>
                                    </c:otherwise>
                                </c:choose>
                                
                                &nbsp;
                                <a data-href="<c:url value = "/intranet/solicitud/eliminar/${entity.id}"/>" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#confirm-delete">
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
                  
        <!-- modal delete -->       
        <div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        Eliminar Solicitud
                    </div>
                    <div class="modal-body">
                        ¿Desea eliminar la solicitud seleccionada?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        <a class="btn btn-danger btn-ok">Eliminar</a>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- modal detalle -->
        <div class="modal fade" id="modal-detalle" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
              <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Detalle</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>                
              </div>
              <div class="modal-body">
                  <iframe id="modal-detalle-solicitud" width="100%" height="500" frameborder="0" allowtransparency="true"></iframe>  
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
              </div>
            </div>
          </div>
        </div>
    
 
        <%@include file="../template/footer.jsp" %>
        <%@include file="../template/footerjs.jsp" %>
    </body>
</html>
