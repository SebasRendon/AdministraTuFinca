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
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.1/themes/base/jquery-ui.css" />
            <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
           <script src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>
        <script type="text/javascript">
           
           function getGET()
    {
       debugger
        // capturamos la url
        var loc = document.location.href;
        // si existe el interrogante
        if(loc.indexOf('?')>0)
        {
            // cogemos la parte de la url que hay despues del interrogante
            var getString = loc.split('?')[1];
            // obtenemos un array con cada clave=valor
            var GET = getString.split('&');
            var get = {};
 
            // recorremos todo el array de valores
            for(var i = 0, l = GET.length; i < l; i++){
                var tmp = GET[i].split('=');
                get[tmp[0]] = unescape(decodeURI(tmp[1]));
            }
            $("#cedula1").html(get.cedula);
             $("#nombre1").html(get.nombre);
            return get;
            
            
        }
    }
 
 
           
           
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
                     
                    var _datosT = eval("[" + data.split("=").join(":") + "]");
                    for(var i=0;i<_datosT.length;i++)
                    {
                        $('#contenido').append("<tr><td class='hidden'>"+_datosT[i].idRegistro+" </td><td>"+_datosT[i].fecha+" </td><td>"+_datosT[i].Kilos+" </td><td>"+_datosT[i].Fornales+" </td><td>"+_datosT[i].lote+" </td><td>"+new Intl.NumberFormat('es-MX').format(_datosT[i].total)+" </td><td><a href='#' onclick='pagarUnRegistro("+_datosT[i].idRegistro+",1)' class='btn btn-success btn-xs'><span class='glyphicon glyphicon-pencil' aria-hidden='true'> Pagar</span></a> </td> </tr>");
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
                     
                    var _datosT = eval("[" + data.split("=").join(":") + "]");
                    for(var i=0;i<_datosT.length;i++)
                    {
                        
                        $('#contenido').append("<tr><td class='hidden'>"+_datosT[i].idRegistro+" </td><td>"+_datosT[i].fecha+" </td><td>"+_datosT[i].Kilos+" </td><td>"+_datosT[i].Fornales+" </td><td>"+_datosT[i].lote+" </td><td>"+new Intl.NumberFormat('es-MX').format(_datosT[i].total)+" </td><td>Pagada</td> </tr>");
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
                                     
                   
  $('#contenido1').append("<tr><td>"+new Intl.NumberFormat('es-MX').format(data)+" </td></tr>");
                    
                    }
        
    });
}

function ocultarBoton() {
    $('#pagartodo').hide(true);
}
function mostrarBoton() {
    $('#pagartodo').show()(true);
}
             
                
                function diasEnUnMes(mes, año) {
	return new Date(año, mes, 0).getDate();
}
                
                
                
            $(document).ready(function () {                
          
           
              $("#filtroFechaLote").submit(function (e) {
                  debugger
              var cedula=$('#cedula').val();
              var fechainicio=$('#fechainicio').val();
              var fechafin=$('#fechafin').val();
              var  idLote=$('#lotes').val();
                  if(idLote==null)
                  {
                      idLote="";
                  }
              
               e.preventDefault();
              $('#contenidoBusqueda').html('');
               $('#contenido2').html('');
                    $.ajax({
                 url: "filtrarlotefecha.htm",
                 type: 'POST',
                 data: "FechaInicio="+fechainicio+"&FechaFin="+fechafin+"&Cedula="+cedula+"&IdLote="+idLote,
                 success: function (data) {
                       
                            var _datosT = eval("[" + data.split("=").join(":") + "]"); 
                            
                            var numero = _datosT[0].suma;
                           
                            
                            
                            $('#contenido2').append("<tr><td>"+new Intl.NumberFormat('es-MX').format(numero)+"</td></tr>")
                     for(var i=0;i<_datosT.length;i++)
                     {
                     
            $('#contenidoBusqueda').append("<tr><td>"+_datosT[i].fecha+"</td><td>"+_datosT[i].Kilos+"</td><td>"+_datosT[i].fornales+"</td><td>"+_datosT[i].Nombre+"</td><td>"+new Intl.NumberFormat('es-MX').format(_datosT[i].total)+"</td></tr>"); 
                        
                     }
                      
                        
                       
                    }
            
           
             });
          });
           });
          
  
            
            
        </script>    
    </head>
    <body onload="FacturasxPagar(),SumarTotal(1),getGET(),calcularmes(1);">
             <%
String cedula=request.getParameter("cedula");
String nombre=request.getParameter("nombre");
%>
 
<input type="hidden" id="cedula" value="<%=cedula%>">
<input type="hidden" id="nombre" value="<%=nombre%>">
      
        
        <div class="container" >
            <div  class="row">
                <h3 class="text-center"><label id="nombre1"></label><strong> <label id="cedula1"></label></strong> </h3> 
                <div class="col-md-12" >
                 <div class="panel with-nav-tabs panel-primary">
                        <div class="panel-heading">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#tab1primary" onclick="FacturasxPagar(),SumarTotal(1),mostrarBoton();" data-toggle="tab">Cuentas sin Cancelar</a></li>
                                    <li><a href="#tab1primary" data-toggle="tab" onclick="FacturasPagadas(),SumarTotal(2),ocultarBoton();">ver Cuentas Canceladas</a></li>
                                    <li><a href="#tab2primary" data-toggle="tab" onclick="traerLotes();">Filtrar por fecha y lote</a></li>
                                    
                                </ul>
                        </div>
                      <div class="panel-body">
                           <div class="tab-content">
                        <div class="tab-pane fade in active" id="tab1primary">
                              
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
                                <div class="tab-pane fade " id="tab2primary">
                                    <div class="col-md-12">
                                        
                                        
                                        <form id="filtroFechaLote" class="form-group">
                                        <div class="col-md-2">
                                            <p> Fecha inicio: <input type="text" autocomplete="off" class="form-control" id="fechainicio" required=""></p>
                                        </div>
                                         <div class="col-md-2">
                                             <p> Fecha fin:  </br>   <input type="text" autocomplete="off" class="form-control" id="fechafin" required=""></p>
                                        </div>
                                         <div class="col-md-4">
                                              <label>Seleccione Un Lote</label>
                                                 <select id="lotes" size="2"  class="form-control" >                                            
                                                 </select> 
                                        </div>
                                           
                                        </br>
                                          <input class="btn btn-success" type="submit" value="buscar">
                                    </form>    
                                </div>
                                         <div class="col-md-11" >
                                             </br>
                    

                    <table class="table table-condensed">
                        <tr><th>Fecha</th><th>Kilos</th><th>Fornales</th><th>Lote</th><th>Subtotal</th></tr>    
                        <tbody id="contenidoBusqueda">
                        
                        </tbody>
                    </table>
                </div>    
                    <div class="col-md-1" >
                       
                        <table class="table table-condensed">
                            <tr><th>Total</th></tr>
                            <tbody id="contenido2">
                            
                        </tbody>
                        
                        </table>
                    </div>
              
                            </div>
                                                              
                             
                               </div>
                           </div>
                     </div>
                    </div>
               
                
                
            </div>        
        </div>        
    </body>
</html>
