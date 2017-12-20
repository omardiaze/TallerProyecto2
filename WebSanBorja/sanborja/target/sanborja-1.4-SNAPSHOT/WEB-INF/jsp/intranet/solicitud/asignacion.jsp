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
        <nav aria-label="breadcrumb" role="navigation">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item"><a href="<c:url value = "/intranet"/>">Atención al Ciudadano</a></li>
              <li class="breadcrumb-item active" aria-current="page">Asignación</li>
            </ol>
        </nav>       
              
         <div class="card">
            <div class="card-header">                 
                <h3>Asignación </h3>
            </div>
                <div class="card-body">
                      <c:url var="action" value = "/intranet" />
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="cboArea">Seleccione Area:</label>                            
                                <select id="cboArea">
                                    <option value="0">Seleccione</option>
                                <c:forEach var="entity" items="${listArea}">
                                    <option value="${entity.id}">${entity.nombre}</option>
                                </c:forEach>
                                </select>
                          </div>                        
                        </div>
                        <div class="col-sm-6">
                             <label for="cboEmpleado">Seleccione Empleado:</label>                            
                             <select id="cboEmpleado">
                                 <option value="0">Seleccione</option>
                             </select>
                        </div>
                         
                    </div>   
                    <div class="row">
                        <div class="col-sm-12">
                             <label for="cboArea">Ingrese Descripcion:</label>   
                            <textarea id="txtDescripcion"></textarea>
                        </div>
                    </div>
           
                    
                     <div class="row">
                        
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
             
        </div>        
    
 
        <%@include file="../template/footer.jsp" %>
        <%@include file="../template/footerjs.jsp" %>     
        <script type="text/javascript">
            $(document).ready(function() { 
                $('#cboArea').change(function() {
                    idArea=this.value;

                    $.getJSON(
                        "${action}/tipo/empleado"+idArea,                     
                        function(data) {
                            var html = '';
                            var len = data.length;
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
            });
        </script>
    </body>
</html>
