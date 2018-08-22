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
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.1/themes/base/jquery-ui.css" />
            <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
           <script src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>
        <title>Informe</title>
        <style type="text/css">
     @media print {
.impre {display:none}
}
        </style> 
        <script>
 
            $(document).ready(function () {
                $("#filtroFechaLote").submit(function (e) {
                    e.preventDefault();
                    infogeneral();
                });
                });
                
             function CargarSeleccion(apellido,nombre,cedula,cedulaReal)
            {
             
             $('#documento').val(cedulaReal);
              $('#cedulacliente').val(cedulaReal);
              $('#nombre').val(nombre+" "+apellido);
                $('#resultado').hide(true);
                
            }
            function infogeneral() {
                $('#resultado').hide(true);
                $('#sumatotal').html('');
                $('#contenido').html('');
                
                var fechainicio = $('#fechainicio').val();
                var fechafin=$('#fechafin').val();
                var idlote=$('#lotes').val();  
                var cedula=$('#documento').val();
                if(fechainicio=="" || fechafin=="")
                {
                    fechafin="9999/09/09"
                    fechainicio="1800/08/08"
                }
                if(cedula==0)
                {
                    cedula="";
                }
                if(idlote==null)
                {
                    idlote="";
                }
      $.ajax({
                    url: "informeGeneral.htm",
                    type: "POST",
                    data: "FechaInicio="+fechainicio+"&FechaFin="+fechafin+"&Idlote="+idlote+"&Cedula="+cedula+"",
                   success: function (data) {
               
                      
                        var _datosT = eval("[" + data.split("=").join(":") + "]");
                        var valor= parseFloat(_datosT[0].total);
                        $('#sumatotal').append("Suma Total de Inversiones:<h4 class='text-danger'>"+new Intl.NumberFormat('es-MX').format(valor)+"</h4>");
                        for(var i=0;i<_datosT.length;i++)
                    {
                        $('#contenido').append("<tr><td>"+_datosT[i].Cedula+" </td><td>"+_datosT[i].nombre+" </td><td>"+_datosT[i].fecha+" </td><td>"+_datosT[i].Kilos+" </td><td>"+_datosT[i].Fornales+" </td><td>"+_datosT[i].lote+" </td><td>"+new Intl.NumberFormat('es-MX').format(_datosT[i].subtotal)+" </td></tr>");
                    }
                    }
        
        
            });
}
 var contar=0;
           function buscarTrabajador()
            {
               
                contar++;
                if(contar>2)
                    {
                 $('#resultado').show(true);
                    
               var cri=$('#nombre').val();
               if(cri!='')
               {
                   buscarTrabajadorAjax(cri);
               }
                
              
                contar=0;
                
                }
            }
              function buscarTrabajadorAjax(parametro)
            {
                   $('#resultado').html('');
        $.ajax({
                    type: 'POST',
                    url: "BuscarTrabajador.htm",
                    data:"Criterio="+parametro,
                    
                    success: function (response) {
                      
                      var _datosT = eval("[" + response.split("=").join(":") + "]"); 
                             
                            $('#resultado').append("<ul>");
                            if(response=="")
                            {
                              $('#resultado').append("<p>Este Empleado no esta Registrado</p>");
                            }
                            else
                            {
                               for(var i=0; i<response.length;i++)
                                    {
                                        $('#resultado').append("<li><a href='#' onclick=\"CargarSeleccion('"+_datosT[i].Apellido+"','"+_datosT[i].Nombre+"',"+_datosT[i].idTrabajador+","+_datosT[i].cedula+")\" > "+_datosT[i].cedula+" "+_datosT[i].Nombre+" "+_datosT[i].Apellido+"</a>  </li></ol>");
                                    } 
                            }
                            
                          
                          $('#resultado').append("</ul>");
                    }
                    
                });
                
                    
             
            }
            
        </script>
    </head>
    <body onload="infogeneral(),traerLotes(),calcularmes();">
        <input type="hidden" value="0" id="documento">
        <h2 class="text-center text-primary text-uppercase">Informes de Inversiones</h2>
        
         <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                     <div class="panel with-nav-tabs panel-primary">
                <div class="panel-heading">
                    <h3 class="text-center">Informe General</h3>
                                    </div>
                         <div class="panel-body ">
                                <form id="filtroFechaLote" class="form-group impre">
                                    <div class="col-md-12 " >
                                         
                                        <div class="col-md-2" style="padding-top:18px; ">
                                            <p> Fecha inicio: <input type="text" autocomplete="off" class="form-control" id="fechainicio" ></p>
                                        </div>
                                         <div class="col-md-2"style="padding-top:18px; ">
                                             <p> Fecha fin:  </br>   <input type="text" autocomplete="off" class="form-control" id="fechafin" ></p>
                                        </div>
                                         <div class="col-md-4">
                                              <label>Seleccione Un Lote</label>
                                                 <select id="lotes" size="2"  class="form-control" >                                            
                                                 </select> 
                                              <div align="center" style="padding-top:10px; ">
                                                 
                                                  <a class="btn btn-danger" href="infoInversiones.htm">Cancelar</a>
                                                  <input class="btn btn-success" type="submit" value="buscar">
                                                  <input type="button" value="Imprimir" onclick="javascript:window.print()" />
                                              </div>
                                              
                                        </div>
                                        <div class="col-md-4" style="padding-top:29px; ">
                                         
                                              <div  class="panel panel-success" id="Busqueda">
                                                <div class="panel-heading"><input type="text" autocomplete="off" id="nombre" onkeyup="buscarTrabajador();" placeholder="Buscar Trabajador" class="form-control">  </div>
                                                <div class="panel-body" id="resultado">Busca un Empleado.</div>
                                               </div>
                                        </div>
                                        </br>
                                          </div>
                                    </form> 
                             
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
