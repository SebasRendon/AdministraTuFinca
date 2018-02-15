<%-- 
    Document   : AddRegistros
    Created on : 18/01/2018, 01:14:44 PM
    Author     : Acer
--%>
<%@include file="/WEB-INF/jsp/masterpage.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <script type="text/javascript">
            
            $('body').keyup(function(e) {
    if(e.keyCode == 13) {
       var cri=$('#nombre').val();
               if(cri!='')
               {
                   buscarTrabajadorAjax(cri);
               }
    }
});
            
            
            var contar=0;
            function ocultar()
            {
               $('#seleccion').hide(true);
            }
            function cambiarEmpleado()
            {
            $('#Busqueda').show(true);
            }
            function CargarSeleccion(apellido,nombre,cedula,cedulaReal)
            {
             
              
              $('#nombres').val(nombre+" "+apellido);
                $('#nombreEmpleado').html(nombre+" "+apellido);
                $('#cedulaReal').val(cedulaReal);
                $('#cedulaTrabajador').val(cedula);
                $('#Busqueda').hide(true);
                $('#seleccion').show(true);
            }
            function buscarTrabajador()
            {
                contar++;
                if(contar>2)
                    {
                 
                    
               var cri=$('#nombre').val();
               if(cri!='')
               {
                   buscarTrabajadorAjax(cri);
               }
                
              
                contar=0;
                
                }
            }
            
            function motrarSeleccines()
            {
                var id= $('#tipoTrabajo').val();
                var lotes=$('#lotes').val();
                
                alert(id+"lotes id"+lotes);
            }
            
            function traerLotes()
            {
                $.ajax({
                    type: 'POST',
                    url: "traerLotes.htm",
                    success: function (data) {
                       var _datosT = eval("[" + data.split("=").join(":") + "]"); 
                       for(var i=0; i<data.length; i++)
                       {
                           $('#lotes').append("<option value="+_datosT[i].idLote+">"+_datosT[i].nombre+"</option>");
                       }
                       
                    }
                    
                    
                } );
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
                            for(var i=0; i<response.length;i++)
                            {
                                $('#resultado').append("<li><a href='#' onclick=\"CargarSeleccion('"+_datosT[i].Apellido+"','"+_datosT[i].Nombre+"',"+_datosT[i].idTrabajador+","+_datosT[i].cedula+")\" > "+_datosT[i].cedula+" "+_datosT[i].Nombre+" "+_datosT[i].Apellido+"</a>  </li></ol>");
                            }
                          
                          $('#resultado').append("</ul>");
                    }
                    
                });
                
                    
             
            }
            function mostrarF(){
           var tipoT= $('#tipoTrabajo').val();
               if(tipoT==1)
               {
                   traerPrecio(1);
                   $('#kilosoFornales').val('1');
                   
               }
               else if(tipoT==2)
               {
                   traerPrecio(2);
                    $('#kilosoFornales').val('2');
               }
            }
            
            function traerPrecio(opcion)
            {
                $.ajax({
                    type: 'POST',
                    url: "traerPrecio.htm",
                    data:"opcion="+opcion ,
                    success: function (data) {
                      
                        var texto="";
                        if(opcion==1)
                        {
                            texto="Precio por kilogramo en cereza";
                        }
                        else if(opcion==2)
                        {
                            texto="Precio por un día de Trabajo";
                        }
                        $('#PrecioActual').html(texto+" = "+data);
                        $('#precioAmultiplicar').val(data);
                        $('#numero').focus();
                    }
                    
                });
            }
            
            function CalcularTotal()
            {
                var kilosOf= $('#numero').val();
                if(kilosOf!=0)
                {
                var pago=$('#precioAmultiplicar').val();
                var total=kilosOf*pago;
                $('#TotalaPagar').html("Total a Pagar = "+total);
                $('#TotoalPago').val(total);
            }
            }
            
            $(document).ready(function () {
                  $("#guardarRegistro").submit(function (e) 
                  {
                     
                      var kilos=0;
                       var fornales=0;
                       var total=$('#TotoalPago').val();
                     var idTrabajador=$('#cedulaTrabajador').val();
                     var descripcion=$('#descripcionRegistro').val();
                     
                     if($('#kilosoFornales').val()==1)
                     {
                           kilos=$('#numero').val(); 
                           fornales=0;
                     }
                     else
                     {
                        fornales=$('#numero').val();
                        kilos=0;
                     }
                     
                     var lote=$('#lotes').val();
                     
                     
                    
                     
                    $.ajax({
                         type: 'POST',
                        url: "GuardarRegistro.htm",
                        data:"idRegistros="+0+"&idTrabajador="+idTrabajador+"&kilos="+kilos+"&Fornales="+fornales+"&idLote="+lote+"&Total="+total+"&cancelado="+0+"&Descripcion="+descripcion,
                        success: function (data) {
                        debugger
                        alert(data);
                        recargar();
                  
                    }
                        
                    });
        
        
        
                  });              
                
            });
            
        
 
         function recargar()
         {
             location.reload();
         }
         
         function verHistorial() {
             var cedula=$('#cedulaReal').val();
             var nombre=$('#nombres').val();
            
             window.location.href = "Historial.htm?cedula="+cedula+"&nombre="+nombre;
    
}
            
        </script>
    </head>
    <body onload="ocultar();traerLotes(),MenuActivo(1);">
        <input type="hidden" id="kilosoFornales">
        <input type="hidden" id="cedulaReal">
        <input type="hidden" id="cedulaTrabajador">
        <input type="hidden" id="precioAmultiplicar">
        <input type="hidden" id="TotoalPago">
           <input type="hidden" id="nombres">
        
        <div align="center">     <h3>Agregar nuevo registro</h3>
            <form id="guardarRegistro"  >
                <div class="container">
                    <div class="row">
                        <div class="col-md-2"></div>
                        <div class="col-md-7"> 
                        
                            <div  class="panel panel-success" id="Busqueda">
			     <div class="panel-heading"><input type="text" id="nombre" onkeyup="buscarTrabajador();" placeholder="Buscar Trabajador" class="form-control">  </div>
				<div class="panel-body" id="resultado">Busca un Empleado Para crear Un Registro.</div>
		</div>
                            
                <div class="panel panel-success" id="seleccion">
                    <div class="panel-heading"><h2 id="nombreEmpleado"></h2><a class="btn btn-xs  btn-danger" href="AddRegistros.htm">Cancelar</a> <a class="btn btn-xs  btn-success" onclick="verHistorial();" href="#">Ver Historial</a></div>
                    <div class="panel-body" id="resultado">
                        
                        <select onChange="mostrarF();" required="" class="form-control" size="2"  id="tipoTrabajo">
                            <option value="1">Kilos</option>
                            <option value="2">Fornales</option>
                        </select>
                        
                        <p id="PrecioActual"></p>
                        <br/>
                        <input type="number" required="" min="0" placeholder="Ingrese Un numero" class="form-control" onblur="CalcularTotal();" id="numero">
                        <p id="TotalaPagar"></p>
                        <input type="text"  placeholder="Ingrese una Descrición es Opcional" class="form-control"  id="descripcionRegistro">
                        <h3 class="text-info">Seleccione un lote</h3>
                        <select id="lotes" size="5" required="" class="form-control">
                            
                            
                        </select>
                        <br/>
                        <input type="submit" class="btn btn-success" value="Guardar">
                    </div>
		</div>            
                            </div>
                        
                        
                        <div class="col-md-3"></div> 
                    </div>
                    
                </div>
               
                
            </form>
            
            </div>
   
    </body>
</html>
