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
                        <h3 style="color: #39A0AA">Quejas y Reclamos</h3>

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
                    <c:url var="api" value = "/api" />
                    <form:form action="${action}" enctype="multipart/form-data" method="POST" modelAttribute="solicitud" cssClass="mui-form">

                        <div class="mui-panel">
                            <div class="panel-header" style="padding-bottom: 10px ">
                             <h3 style="margin-top: 0px;margin-bottom: 0px;">Datos Solicitante</h3> 
                            <hr />
                            </div>
                            
                            <div class="row">
                                <div class="mui-col-md-6 mui-col-xs-12">
                                    <div class="mui-select">
                                        <form:select path="idTipoDocumento" id="cboEstado" onchange="getDocumentoNumber()">
                                            <form:options items="${tipodocumentos}" itemValue="id" itemLabel="nombre" />
                                        </form:select>
                                        <label>* Seleccione tipo de documento</label>
                                    </div>       
                                </div>
                                <div class="mui-col-md-6 mui-col-xs-12">
                                    <div class="mui-textfield">
                                        <form:input type="text" id="txtNumeroDocumento" maxlength="12" onblur="getDocumentoNumber()" placeholder="${solicitud.numeroDocumentoError}" onkeypress='validate(event)' class="mui-textfield mui-textfield--float-label ${not empty solicitud.numeroDocumentoError ? 'border-color-text-error' : 'border-color-text-ok'}" path="numeroDocumento"  />
                                        <label id="lblNumeroDocumento" for="txtNumeroDocumento" class="${not empty solicitud.numeroDocumentoError ? 'color-label-error' : 'color-label-ok'}">* Ingrese número de documento</label>
                                    </div>       
                                </div>
                            </div>
                                        
                            <div class="row">
                                <div class="mui-col-md-6 mui-col-xs-12">
                                    <div class="mui-textfield">
                                        <form:input type="text" id="txtNombre" placeholder="${solicitud.nombreError}" class="mui-textfield mui-textfield--float-label border-color-text-ok ${not empty solicitud.nombreError ? 'border-color-text-error' : 'border-color-text-ok'}" path="nombre" />
                                        <label id="lblName" for="txtName" class="${not empty solicitud.nombreError ? 'color-label-error' : 'color-label-ok'}">* Ingrese su nombre</label>
                                    </div>       
                                </div>
                                <div class="mui-col-md-6 mui-col-xs-12">
                                    <div class="mui-textfield">
                                        <form:input type="text" id="txtApellido" placeholder="${solicitud.apellidoError}" class="mui-textfield mui-textfield--float-label ${not empty solicitud.apellidoError ? 'border-color-text-error' : 'border-color-text-ok'}" path="apellido" />
                                        <label for="txtApellido" class="${not empty solicitud.apellidoError ? 'color-label-error' : 'color-label-ok'}">* Ingrese sus apellidos</label>
                                    </div>       
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="mui-col-md-6 mui-col-xs-12">
                                    <div class="mui-textfield">
                                        <form:input type="text" maxlength="9" id="txtTelefono" placeholder="${solicitud.telefonoError}" onkeypress='validate(event)' class="mui-textfield mui-textfield--float-label ${not empty solicitud.telefonoError ? 'border-color-text-error' : 'border-color-text-ok'}" path="telefono" />
                                        <label id="lblTelefono" for="txtTelefono" class="${not empty solicitud.telefonoError ? 'color-label-error' : 'color-label-ok'}">* Ingrese su teléfono</label>
                                    </div>       
                                </div>
                                <div class="mui-col-md-6 mui-col-xs-12">
                                    <div class="mui-textfield">
                                        <form:input type="text" id="txtCorreo"  placeholder="${solicitud.telefonoError}"  class="mui-textfield mui-textfield--float-label ${not empty solicitud.correoError ? 'border-color-text-error' : 'border-color-text-ok'}" path="correo" />
                                        <label id="lblCorreo" for="txtCorreo" class="${not empty solicitud.correoError ? 'color-label-error' : 'color-label-ok'}">* Ingrese su correo </label>
                                    </div>                                      
                                </div>
                            </div>
                                        
                             <div class="row">
                                <div class="mui-col-md-12 mui-col-xs-12">
                                    <div class="mui-textfield">
                                        <form:textarea path="direccion" id="txtDireccion" placeholder="${solicitud.direccionError}" class="${not empty solicitud.direccionError ? 'border-color-text-error' : 'border-color-text-ok'}" rows="1" cols="30" />                                        
                                        <label id="lblDireccion" for="txtDireccion" class="${not empty solicitud.direccionError ? 'color-label-error' : 'color-label-ok'}">* Ingrese su dirección</label>
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
                                        <label id="lblDocumento" class="color-label-ok">¿Qué desea registrar?</label>
                                        <div style="padding-bottom: 0px">
                                            <div style="float: left">
                                                <div class="mui-radio">
                                                    <label>
                                                     <form:radiobutton path="idTipoSolicitud" id="idTipoSolicitud" value="1" checked="${solicitud.idTipoSolicitud == '1' ? 'checked' : '' }" />
                                                    Reclamo
                                                  </label>
                                                </div> 
                                            </div>

                                            <div style="float: left; padding-left: 10px ">
                                                <div class="mui-radio">
                                                    <label>
                                                     <form:radiobutton path="idTipoSolicitud" id="idTipoSolicitud" value="2" checked="${solicitud.idTipoSolicitud == '2' ? 'checked' : '' }" />
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
                                        <label class="color-label-ok">Seleccione motivo</label>
                                    </div>       
                                </div>                                 
                            </div>
                                        
                            <div class="row">
                                <div class="mui-col-md-12 mui-col-xs-12">
                                    <div class="mui-textfield">
                                        <form:textarea path="descripcion" placeholder="${solicitud.descripcionError}" class="${not empty solicitud.descripcionError ? 'border-color-text-error' : 'border-color-text-ok'}" id="txtDescripcion"  rows="1" cols="30" />                                        
                                        <label id="lblDescripcion" for="txtDescripcion" class="${not empty solicitud.descripcionError ? 'color-label-error' : 'color-label-ok'}">* Ingrese su descripción</label>
                                    </div>       
                                </div> 
                            </div> 
                                               
                            <div class="row">
                                <div class="mui-col-md-12 mui-col-xs-12">
                                      <div style="padding-top:5px">
                                        <div class="mui--pull-left">
                                            <div class="input-file-container">
                                                 <form:input type="file" path="file" id="file" class="input-file"/>                                                
                                                <label tabindex="0" for="fupArchivo" class="input-file-trigger"><i class="fa fa-upload" aria-hidden="true"></i>&nbsp;Subir documento</label>
                                            </div>
                                        </div>
                                        <div class="mui--pull-left"><p class="file-return"></p></div>
                                        <div class="mui--clearfix"></div>
                                    </div>
                                   
                                </div> 
                            </div> 
                              
                            <div class="row">
                                <div class="mui-col-md-12 mui-col-xs-12" >
                                    <div style="text-align: center; padding-top: 30px">
                                    <h4>DECLARO BAJO JURAMENTO QUE LOS DATOS SEÑALADOS EXPRESAN LA VERDAD</h4>
                                    Asi mismo autorizo que todo acto administrativo derivado del presente procedimiento, se me notifique en el correo electrónico(E-mail) consignado en el presente formulario.(Ley N° 27444, numeral 20.4 del artículo 20°)
                                    </div>
                                    <div style="padding-top: 10px;"> 
                                        <center>
                                            <div>                                                
                                                <form:radiobutton path="notificacion" id="notificacion1" value="1" checked="${solicitud.notificacion == '1' ? 'checked' : '' }" />&nbsp;
                                                <label for="notificacion1">Correo</label>
                                                &nbsp;&nbsp;                                                
                                                <form:radiobutton path="notificacion" id="notificacion2" value="2" checked="${solicitud.notificacion == '2' ? 'checked' : '' }" />&nbsp;
                                                <label for="notificacion2">Domicilio</label>
                                            </div>                               
                                         </center>
                                   </div>
                               </div>
                            </div>
                        </div>
                                                
                        <div style="padding-top:0px;padding-bottom: 20px">
                            <div class="mui--pull-center" style="text-align: center">
                                <button type="submit" id="btnGuardar" class="mui-btn mui-btn--primary mui-btn--raised">Guardar</button>&nbsp;&nbsp;
                                <button type="reset" id="bntLimpiar" class="mui-btn mui-btn--raised">Limpiar</button>
                            </div>                            
                            <div class="mui--clearfix"></div>
                        </div>
                    </form:form>                    
                    
                </div>              
            </div>
          </div>
         </div>
        
    <%@include file="template/footer.jsp" %>
    <%@include file="template/footerjs.jsp" %>
        
    <script type="text/javascript">
        
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
            var $formEl = $('<form class="mui-form" style="padding:10px"><div><h3>Mensaje del Sistema </h3><hr/></div><div>  <h4>${ok}</h4></div><div class="mui--text-right"><button class="mui-btn mui-btn--raised" onClick="return closeModal();"> Cerrar</button></div></div></form>');
            $modalEl.append($formEl);

            // show modal
            mui.overlay('on', $modalEl.get(0));

            function closeModal() {
                mui.overlay('off', $modalEl.get(0));
            }            

        </c:if>

    $(document).ready(function() {
        <c:if test="${not empty ok}">
                
        </c:if>
        var idTipoSolicitud=0;

        $('input[type=radio][id=idTipoSolicitud]').change(function() {
            idTipoSolicitud=this.value;

            $.getJSON(
                "${action}/tipo/"+idTipoSolicitud,                     
                function(data) {
                    var html = '';
                    var len = data.length;
                    for ( var i = 0; i < len; i++) {
                            html += '<option value="' + data[i].id + '">'
                                            + data[i].nombre + '</option>';
                    }
                    html += '</option>';
                    //now that we have our options, give them to our select
                    $('#cboMotivo').html(html);
                    $('#cboMotivo').val(0);
                }
             );
        });
    });

    function getDocumentoNumber(){
        var tipo= $('#cboEstado').val();
        var numero= $('#txtNumeroDocumento').val();
        if(tipo!=0 && numero.trim().length!=0){
             $.ajax({
                url: '${api}/tipodocumento/'+tipo+'/'+numero,
                type: 'get',
                dataType: 'json',
                success: function (data) {          
                    if(data.apistatus=="OK"){
                        $('#txtNombre').val(data.nombre);
                        $('#txtApellido').val(data.apellidos);
                        $('#txtTelefono').val(data.telefono);
                        $('#txtCorreo').val(data.correo);
                        $('#txtDireccion').val(data.direccion);                        
                    }
                    //alert(JSON.stringify(data));
                },
                error : function(jqXHR, textStatus, errorThrown) { 
                    if(jqXHR.status == 404 || errorThrown == 'Not Found') 
                    { 
                        console.log('No encontrado.'); 
                    }
                }
            });  
        }
    }
    
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