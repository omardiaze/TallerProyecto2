<%-- 
    Document   : index
    Created on : 03/12/2017, 08:13:17 PM
    Author     : Marlon Cordova
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="intranet/template/header.jsp" %>
        <title>San Borja</title>
    </head>
    <body>
        <div class="container" style="padding-top: 100px"> 
            <div class="card">
                <div class="card-header">
                    <div style="float: left;margin-top: 7px">
                        <h3>Bienvenido </h3>
                    </div>                  
                    <div style="clear: both"></div>
                </div>                
                <div class="card-body" style="padding-left: 50px;padding-right: 50px;">
                          <br/>
                    <a class="btn btn-primary btn-lg btn-block" href="/extranet" role="button">Extranet</a>
                    <br/><br/>
                    <a class="btn btn-secondary btn-lg btn-block" href="/intranet" role="button">Intranet</a>
                       <br/><br/>
                </div>
            </div>
        </div>
 
        <%@include file="intranet/template/footerjs.jsp" %>
    </body>
</html>
