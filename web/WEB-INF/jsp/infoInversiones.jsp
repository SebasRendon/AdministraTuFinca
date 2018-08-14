<%-- 
    Document   : infoInversiones
    Created on : 01-jul-2018, 4:28:14
    Author     : Rendon
--%>
<%@include file="/WEB-INF/jsp/masterpage.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Informe</title>
        <script>
            function infogeneral() {
                debugger
                $('#contenido').html('');
                var fechainicio ='1999/02/02';
                var fechafin='9999/02/02';
                var idlote='1';
                var cedula='1042065846';
      $.ajax({
                    url: "informeGeneral.htm",
                    type: "POST",
                    data: "FechaInicio="+fechainicio+"&FechaFin="+fechafin+"&Idlote="+idlote+"&Cedula="+cedula+"",
                   success: function (data) {
                       alert(data);
                      
                        var _datosT = eval("[" + data.split("=").join(":") + "]");
                        var valor= parseFloat(_datosT[0].total);
                        $('#sumatotal').append("Suma Total de Inversiones:<h4 class='text-danger'>"+valor+"</h4>");
                        for(var i=0;i<_datosT.length;i++)
                    {
                        $('#contenido').append("<tr><td>"+_datosT[i].Cedula+" </td><td>"+_datosT[i].nombre+" </td><td>"+_datosT[i].fecha+" </td><td>"+_datosT[i].Kilos+" </td><td>"+_datosT[i].Fornales+" </td><td>"+_datosT[i].lote+" </td><td>"+_datosT[i].subtotal+" </td></tr>");
                    }
                    }
        
        
            });
}
          
            
        </script>
    </head>
    <body onload="infogeneral();">
        <h2 class="text-center text-primary text-uppercase">Informes de Inversiones</h2>
        <ul class="nav nav-tabs">
            <li class="dropdown">
                            <a href="#" data-toggle="dropdown">Seleccione un tipo de Informe <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#tab4primary" data-toggle="tab">otro informe</a></li>
                                <li><a href="#tab5primary" data-toggle="tab">Primary 5</a></li>
                            </ul>
                        </li>
                            </ul>
         <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                     <div class="panel with-nav-tabs panel-primary">
                <div class="panel-heading">
                    <h3 class="text-center">Informe General</h3>
                                    </div>
                         <div class="panel-body">
                  <table class="table table-condensed">
                        <tr><th>Cedula</th><th>Nombre</th><th>Fecha</th><th>Kilos</th><th>Fornales</th><th>Lote</th><th>Subtotal</th><th id='sumatotal'></th> </tr>    
                          <tbody id="contenido">
                            
                        </tbody>
                    </table>
                </div>
                     </div>
                </div>
    </body>
</html>
