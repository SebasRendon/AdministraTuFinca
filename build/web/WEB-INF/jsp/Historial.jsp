<%-- 
    Document   : Historial
    Created on : 31-ene-2018, 19:02:50
    Author     : JhoanSebas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/masterpage.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <script src="<c:url value="/public/jquery-3.3.1.min.js"></c:url>" type="text/javascript"></script>
 <script type="text/javascript">
           
           function pagarUnRegistro(idRegistro,opcion) {
               var cedula=$('#cedula').val();
              $.ajax({
                 url: "pagarFactura.htm",
                 type: 'POST',
                 data:"id="+idRegistro+"&opcion="+opcion+"&cedula="+cedula,
                 success: function (data) {
                        if(data=="ok")
                        {
                          FacturasxPagar();  
                          SumarTotal(1);
                        }
                      
                    }
              });
    
}
           
           
            function FacturasxPagar() {
               $('#contenido').html("");
                var cedula=$('#cedula').val();
    $.ajax({       
        url: "Facturasporpagar.htm",
        type: 'POST',
        data:"cedula="+cedula,
        success: function (data) {
                     debugger
                    var _datosT = eval("[" + data.split("=").join(":") + "]");
                    for(var i=0;i<_datosT.length;i++)
                    {
                        $('#contenido').append("<tr><td class='hidden'>"+_datosT[i].idRegistro+" </td><td>"+_datosT[i].fecha+" </td><td>"+_datosT[i].Kilos+" </td><td>"+_datosT[i].Fornales+" </td><td>"+_datosT[i].lote+" </td><td>"+_datosT[i].total+" </td><td><a href='#' onclick='pagarUnRegistro("+_datosT[i].idRegistro+",1)' class='btn btn-success btn-xs'><span class='glyphicon glyphicon-pencil' aria-hidden='true'> Pagar</span></a> </td> </tr>");
                    }
                    }
        
    });
}

  
            function FacturasPagadas() {
               $('#contenido').html("");
                var cedula=$('#cedula').val();
    $.ajax({       
        url: "Facturapagadas.htm",
        type: 'POST',
        data:"cedula="+cedula,
        success: function (data) {
                     debugger
                    var _datosT = eval("[" + data.split("=").join(":") + "]");
                    for(var i=0;i<_datosT.length;i++)
                    {
                        $('#contenido').append("<tr><td class='hidden'>"+_datosT[i].idRegistro+" </td><td>"+_datosT[i].fecha+" </td><td>"+_datosT[i].Kilos+" </td><td>"+_datosT[i].Fornales+" </td><td>"+_datosT[i].lote+" </td><td>"+_datosT[i].total+" </td><td>Pagada</td> </tr>");
                    }
                    }
        
    });
}
  function SumarTotal(opcion) {
               $('#contenido1').html("");
                var cedula=$('#cedula').val();
    $.ajax({       
        url: "SumaFactura.htm",
        type: 'POST',
        data:"cedula="+cedula+"&opcion="+opcion,
        success: function (data) {
                                     
                   
  $('#contenido1').append("<tr><td>"+data+" </td></tr>");
                    
                    }
        
    });
}

function ocultarBoton() {
    $('#pagartodo').hide(true);
}
function mostrarBoton() {
    $('#pagartodo').show()(true);
}
            
        </script>    
    </head>
    <body onload="FacturasxPagar(),SumarTotal(1);">
             <%
String cedula=request.getParameter("cedula");
String nombre=request.getParameter("nombre");
%>
 
<input type="hidden" id="cedula" value="<%=cedula%>">
<input type="hidden" id="nombre" value="<%=nombre%>">
      
        
        <div class="container" >
            <div  class="row">
                <h3 class="text-center"><%=nombre%><strong> <%=cedula%></strong> </h3> 
                <div class="col-md-12" >
                 <div class="panel with-nav-tabs panel-primary">
                        <div class="panel-heading">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#tab1primary" onclick="FacturasxPagar(),SumarTotal(1),mostrarBoton();" data-toggle="tab">Cuentas sin Cancelar</a></li>
                                    <li><a href="#tab2primary" data-toggle="tab" onclick="FacturasPagadas(),SumarTotal(2),ocultarBoton();">ver Cuentas Canceladas</a></li>
                                    
                                    
                                </ul>
                        </div>
                     </div>
                    </div>
                <div class="col-md-11" >
                    
                    

                    <table class="table table-condensed">
                        <tr><th>Fecha</th><th>Kilos</th><th>Fornales</th><th>Lote</th><th>Subtotal</th><th>Acciones</th> </tr>    
                        <tbody id="contenido">
                            
                        </tbody>
                    </table>
                </div>    
                    <div class="col-md-1" >
                       
                        <table class="table table-condensed">
                            <tr><th>Total</th></tr>
                            <tbody id="contenido1">
                            
                        </tbody>
                        <tr><td> <button onclick="pagarUnRegistro(0,2)" id="pagartodo" class="btn btn-info btn-xs" >Pagar todo</button></td></tr>
                        </table>
                    </div>
                
                
            </div>        
        </div>        
    </body>
</html>
