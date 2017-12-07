<%-- 
    Document   : index
    Created on : 03/12/2017, 09:31:23 PM
    Author     : Marlon Cordova
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!doctype html>
<html>
  <head>
    
      <%@include file="template/header.jsp" %>

  </head>
  <body>
     
        <%@include file="template/sideNav.jsp" %>
        <%@include file="template/menu.jsp" %>
              
        <div id="content-wrapper">
          <!-- Content HTML goes here -->         
           
          <div class="mui-container-fluid">
           
              <div class="mui-row" style="padding-top: 10px;">
                <div class="mui-col-md-3 mui-col-xs-12 mui--hidden-xs">
                    <div style="text-align: left">
                        <h3 style="color: #39A0AA">Pedidos y Sugerencias</h3>

                        <ul>
                            <li><a href="">Crear Queja o Reclamo</a></li>
                            <li><a href="">Buscar Quejas y Reclamos</a></li>
                        </ul>
                    </div>
                </div>
                
                <div class="mui-col-md-9" mui-col-xs-12>
                    <div style="padding-bottom: 20px">
                    <h2 style="color: #39A0AA">Crear Queja o Reclamo</h2>
                    <hr/>
                    </div>
                    
                    <c:if test="${not empty ok}">
                        <div class="alert alert-success">                                   
                            ${ok}                                    
                        </div>
                    </c:if>

                    <c:if test="${not empty error}">
                        <div class="alert alert-danger">
                            <strong>Errores!</strong> 
                            <ul>
                                ${error}
                            </ul>
                          </div>
                    </c:if>
                    
                    <c:url var="action" value = "/extranet" />
                    <form:form action="${action}" method="POST" modelAttribute="solicitud" cssClass="mui-form">

                        <div class="mui-panel">
                            <div class="panel-header" style="padding-bottom: 10px ">
                             <h3 style="margin-top: 0px;margin-bottom: 0px;">Datos Solicitante</h3> 
                            <hr />
                            </div>
                            
                            <div class="row">
                                <div class="mui-col-md-6 mui-col-xs-12">
                                    <div class="mui-select">
                                        <form:select path="idTipoDocumento" id="cboEstado" >
                                            <form:options items="${tipodocumentos}" itemValue="id" itemLabel="nombre" />
                                        </form:select>
                                        <label style="color: red">*</label> <label>*Seleccione Tipo de documento</label>
                                    </div>       
                                </div>
                                <div class="mui-col-md-6 mui-col-xs-12">
                                    <div class="mui-textfield">
                                        <form:input type="text" id="txtNumeroDocumento" onkeypress='validate(event)' class="mui-textfield mui-textfield--float-label" path="numeroDocumento" />
                                        <label id="lblNumeroDocumento" for="txtNumeroDocumento">* Ingrese Nro de documento</label>
                                    </div>       
                                </div>
                            </div>
                                        
                            <div class="row">
                                <div class="mui-col-md-6 mui-col-xs-12">
                                    <div class="mui-textfield">
                                        <form:input type="text" id="txtNombre" class="mui-textfield mui-textfield--float-label" path="nombre" />
                                        <label id="lblName" for="txtName">* Ingrese su nombre:</label>
                                    </div>       
                                </div>
                                <div class="mui-col-md-6 mui-col-xs-12">
                                    <div class="mui-textfield">
                                        <form:input type="text" id="txtApellido" class="mui-textfield mui-textfield--float-label" path="apellido" />
                                        <label for="txtApellido">* Ingrese sus apellidos:</label>
                                    </div>       
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="mui-col-md-6 mui-col-xs-12">
                                    <div class="mui-textfield">
                                        <form:input type="number" id="txtTelefono" class="mui-textfield mui-textfield--float-label" path="telefono" />
                                        <label id="lblTelefono" for="txtTelefono">* Ingrese su teléfono:</label>
                                    </div>       
                                </div>
                                <div class="mui-col-md-6 mui-col-xs-12">
                                    <div class="mui-textfield">
                                        <form:input type="text" id="txtCorreo" class="mui-textfield mui-textfield--float-label" path="correo" />
                                        <label id="lblCorreo" for="txtCorreo">* Ingrese su correo</label>
                                    </div>       
                                </div>
                            </div>
                                        
                             <div class="row">
                                <div class="mui-col-md-12 mui-col-xs-12">
                                    <div class="mui-textfield">
                                        <form:textarea path="direccion" id="txtDireccion"  rows="1" cols="30" />                                        
                                        <label id="lblDireccion" for="txtDireccion">* Ingrese su dirección</label>
                                    </div>       
                             </div>
                                
                            </div>
                        </div>
                                
                        <div class="mui-panel">
                            <div class="panel-header" style="padding-bottom: 10px">
                             <h3 style="margin-top: 0px;margin-bottom: 0px;">Datos de la Solicitud</h3> 
                            <hr />
                            </div>
                            
                             <div class="row">
                                <div class="mui-col-md-12 mui-col-xs-12">
                                    <div class="mui-textfield">
                                       <label id="lblDocumento">¿Que desea registrar?</label>
                                        <div style="padding-bottom: 0px">
                                            <div style="float: left">
                                                <div class="mui-radio">
                                                    <label>
                                                     <form:radiobutton path="idTipoSolicitud" value="1" checked="${solicitud.idTipoSolicitud == '1' ? 'checked' : '' }" />
                                                    Reclamo
                                                  </label>
                                                </div> 
                                            </div>

                                            <div style="float: left; padding-left: 10px ">
                                                <div class="mui-radio">
                                                    <label>
                                                     <form:radiobutton path="idTipoSolicitud" value="2" checked="${solicitud.idTipoSolicitud == '2' ? 'checked' : '' }" />
                                                    Queja
                                                  </label>
                                                </div>    
                                            </div>
                                             <div style="clear: both"></div>        
                                        </div>
                                    </div>
                                </div>                                 
                            </div>
                            
                            <div class="row">
                                <div class="mui-col-md-12 mui-col-xs-12">
                                    <div class="mui-select">
                                        <form:select path="idMotivo" id="cboMotivo" >
                                            <form:options items="${motivos}" itemValue="id" itemLabel="nombre" />
                                        </form:select>
                                         <label>Seleccione Motivo</label>
                                    </div>       
                                </div>                                 
                            </div>
                                        
                            <div class="row">
                                <div class="mui-col-md-12 mui-col-xs-12">
                                    <div class="mui-textfield">
                                        <form:textarea path="descripcion" id="txtDescripcion"  rows="1" cols="30" />                                        
                                        <label id="lblDescripcion" for="txtDescripcion">* Ingrese su descripción</label>
                                    </div>       
                                </div> 
                            </div> 
                                        
                        </div>
                                                
                        <div style="padding-top:10px;padding-bottom: 10px">
                            <div class="mui--pull-center" style="text-align: center">
                                <button type="submit" id="btnGuardar" class="mui-btn mui-btn--primary mui-btn--raised">Guardar</button>&nbsp;</div>                            
                            <div class="mui--clearfix"></div>
                        </div>
                    </form:form>                    
                    
                </div>              
            </div>
          </div>
         </div>
        
        <%@include file="template/footer.jsp" %>
        <%@include file="template/footerjs.jsp" %>
                
        
        <script>    
             <c:if test="${not empty ok}">
                   var $modalEl = "";
            $modalEl = $('<div/>');

            // set style
            $modalEl.css({
                width: 400,
                height: 190,
                margin: '100px auto',
                backgroundColor: '#fff'
            });
            var $formEl = $('<form class="mui-form" style="padding:10px"><div><h3>Mensaje de Sistema </h3><hr/></div><div>  <h4>${ok}</h4></div><div class="mui--text-right"><button class="mui-btn mui-btn--raised" onClick="return closeModal();"> Cerrar</button></div></div></form>');
            $modalEl.append($formEl);

            // show modal
            mui.overlay('on', $modalEl.get(0));
            
            function closeModal() {
                mui.overlay('off', $modalEl.get(0));
            }
            
                         
                    </c:if>
          
        
         function validate(evt) {
            var theEvent = evt || window.event;
            var key = theEvent.keyCode || theEvent.which;
            key = String.fromCharCode( key );
            var regex = /[0-9]|\./;
            if( !regex.test(key) ) {
              theEvent.returnValue = false;
              if(theEvent.preventDefault) theEvent.preventDefault();
            }
          }

            function openNav() {
                document.getElementById("mySidenav").style.width = "250px";
            }

            function closeNav() {
                document.getElementById("mySidenav").style.width = "0";
            }

        </script>
  </body>
</html>