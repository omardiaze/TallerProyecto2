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
        
        <div class="container">
            </br>
            <button type="button" onclick="location.href = 'newEstudioPIP.html'" class="btn btn-primary">Nuevo</button>
            </br></br>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Identificador PIP</th>
                        <th>Descripción</th>
                        <th>Monto Inversión</th>
                        <th>Fecha Declaración</th>
                        <th>Editar</th>
                    </tr>
                </thead>
                <c:forEach var="epip" items="${list}">
                    <tr>
                        <td>${epip.identificadorPIP}</td>
                        <td>${epip.descripcion}</td>
                        <td>${epip.montoInversionViable}</td>
                        <td>${epip.fechaDeclaracion}</td>
                        <td><a href="editEstudioPIP/${epip.id}.html">Editar</a></td>
                    </tr>
                </c:forEach>
            </table>
        </div>        
        
    </body>
</html>
