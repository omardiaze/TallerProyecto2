<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>        
        
        <title>JSP Page</title>
    </head>
    <body>

        <%@include file="header.jsp" %>
        <c:if test="${saveorupdate == 'save'}">
            <c:set var="action" value="saveEstudioPIP.html" />
        </c:if>
        <c:if test="${saveorupdate == 'update'}">
            <c:set var="action" value="updateEstudioPIP.html" />
        </c:if>        
        
        <div class="container" >
            <form:form action="${action}" method="POST" modelAttribute="estudiopip">
                
                <form:hidden class="input" path="id"/>               
                
                <div class="form-group">
                  <label for="identificadorPIP">IdentificadorPIP:</label>
                  <form:input type="text" class="form-control" path="identificadorPIP" />
                </div>
                
                <div class="form-group">
                  <label for="descripcion">Descripción:</label>
                  <form:input type="text" class="form-control" path="descripcion" />
                </div>

                <div class="form-group">
                  <label for="montoInversionViable">Monto Inversion Viable:</label>
                  <form:input type="text" class="form-control" path="montoInversionViable" />
                </div>
                
                <div class="form-group">
                  <label for="fechaDeclaracion">Fecha Declaración:</label>
                  <form:input type="text" class="form-control" path="fechaDeclaracion" />
                </div>                 
                
                <button type="submit" class="btn btn-default">Submit</button>
            </form:form>
        </div>        
        
    </body>
</html>
