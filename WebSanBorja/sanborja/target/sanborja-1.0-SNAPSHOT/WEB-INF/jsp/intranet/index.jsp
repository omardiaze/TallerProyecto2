<%-- 
    Document   : index
    Created on : 04/12/2017, 10:45:39 PM
    Author     : Marlon Cordova
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="template/header.jsp" %>
    </head>
    <body>
        <%@include file="template/menu.jsp" %>
          
        <div class="container-fluid" style="padding-top: 10px">     
            
            <nav aria-label="breadcrumb" role="navigation">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">Home</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Atención al Ciudadano</li>                 
                </ol>
            </nav>              
            
            <div class="card">
                <div class="card-header">                 
                    <h3>Gestión de Atención al Ciudadano </h3>                 
                </div>
                <div class="card-body">                 
                    <div class="row text-center placeholders">
                        <div class="col-sm-4 placeholder">
                            <img src="data:image/gif;base64,R0lGODlhAQABAIABAAJ12AAAACwAAAAAAQABAAACAkQBADs=" width="200" height="200" class="img-fluid rounded-circle" alt="Generic placeholder thumbnail">
                            <h4>Indicador 1</h4>
                            <div class="text-muted">Solo</div>
                        </div>
                        <div class="col-sm-4">
                              <img src="data:image/gif;base64,R0lGODlhAQABAIABAADcgwAAACwAAAAAAQABAAACAkQBADs=" width="200" height="200" class="img-fluid rounded-circle" alt="Generic placeholder thumbnail">
                            <h4>Indicador 2</h4>
                            <div class="text-muted">es una </div>
                        </div>
                        <div class="col-sm-4">
                              <img src="data:image/gif;base64,R0lGODlhAQABAIABAAJ12AAAACwAAAAAAQABAAACAkQBADs=" width="200" height="200" class="img-fluid rounded-circle" alt="Generic placeholder thumbnail">
                            <h4>Indicador 3</h4>
                            <div class="text-muted">demo</div>
                        </div>
                    </div>
                </div>
            </div>             
        </div>
    
 
        <%@include file="template/footer.jsp" %>
        <%@include file="template/footerjs.jsp" %>
    </body>
</html>
