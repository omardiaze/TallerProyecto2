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
        <nav aria-label="breadcrumb" role="navigation">
            <ol class="breadcrumb">
                <li class="breadcrumb-item active" aria-current="page">Home</li>
            </ol>
        </nav>
        <c:out value="${demo}"></c:out>
            
        <div class="card">
          <div class="card-header primary-color white-text">
            Featured
          </div>
          <div class="card-body">
             <table class="table table-striped">
                <thead class="mdb-color darken-3">
                    <tr class="text-white">
                        <th></th>
                        <th>Codigo</th>
                        <th>Nombre</th>
                        <th>Estado</th>
                    </tr>
                </thead>
                <c:forEach var="entity" items="${list}">
                    <tr>
                        <td>${entity.id}</td>
                        <td>${entity.codigo}</td>
                        <td>${entity.nombre}</td>                                     
                    </tr>
                </c:forEach>
            </table>
          </div>
        </div>
        
         <div class="container">
             
            </br>
            <button type="button" onclick="location.href = 'newEstudioPIP.html'" class="btn btn-primary">Nuevo</button>
            </br></br>
           
        </div>        
       
    </body>
</html>
