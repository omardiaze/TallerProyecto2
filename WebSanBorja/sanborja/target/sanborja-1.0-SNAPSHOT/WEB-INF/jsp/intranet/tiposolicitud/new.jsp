<%-- 
    Document   : new
    Created on : 03/12/2017, 09:32:59 PM
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
                  <li class="breadcrumb-item"><a href="<c:url value = "/intranet/tiposolicitud" />">Tipo de Solicitud</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Crear</li>
                </ol>
            </nav>              
    
            <div >
            <div class="card">
                <div class="card-header" style="padding-top: 10px; padding-bottom: 10px">                   
                    <h4>Crear Tipo de Solicitud </h4>                   
                </div>
                <div class="card-body">       
                    <div class="row">
                    <div class="col-sm-8">
                        <c:url var="action" value = "/intranet/tiposolicitud/crear" />
                        <form:form action="${action}" method="POST" modelAttribute="tipoSolicitud">
                           
                            <c:if test="${not empty error}">
                                <div class="alert alert-danger">
                                    <strong>Errores!</strong> 
                                    <ul>
                                        ${error}
                                    </ul>
                                  </div>
                            </c:if>
                            
                            <!--Body-->
                            <div class="form-group">
                                <label for="txtNombre">Ingrese Nombre</label>
                                <form:input type="text" id="txtNombre" class="form-control" path="nombre" />
                            </div>                   

                            <div class="form-group">
                                <label for="cboEstado">Seleccione estado</label>                            
                                <form:select path="estado" id="cboEstado" class="form-control">
                                    <form:options items="${estados}" itemValue="valor" itemLabel="nombre" />
                                </form:select>                            

                            </div>      

                            <div class="text-center mb-3">
                                <button type="submit" class="btn btn-md btn-primary">Guardar </button>
                                <a href="<c:url value = "/intranet/tiposolicitud"/>" class="btn btn-md btn-default">Volver</a>
                            </div>         

                        </form:form>
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

