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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
           <c:out value="${demo}"></c:out>
        <h1>Hello World!</h1>
        
        <img src="<c:url value="/resources/images/logosb1.png"/>"/>
 
      
    </body>
</html>
