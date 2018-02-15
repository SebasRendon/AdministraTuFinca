<%-- 
    Document   : AgregarEmpleado
    Created on : 26-ene-2018, 12:27:52
    Author     : JhoanSebas
--%>
<%@include file="/WEB-INF/jsp/masterpage.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        <title>JSP Page</title>
      
        <script type="text/javascript">
            //funciones Precios
            function ocultarFomularioPrecios () {
    $('#formPrecios').hide();
}
            
              $(document).ready(function () {
                 
                 $("#formPrecios").submit(function (e) {
          
                     e.preventDefault();
                             var id=$('#idPrecios').val();
      var preciokilo=$('#precioKilo').val();
      var precioDia=$('#precioDia').val();

                
                $.ajax({
                   url: "CambiarPrecios.htm",
                   type: 'POST',
                   data: "idPrecio="+id+"&PrecioKilo="+preciokilo+"&PrecioDia="+precioDia,
                   success: function (data) {
                      if(data=="ok")
                      {
                          traerPrecios();
                          ocultarFomularioPrecios ();
                          
                      }
                    }
                   
                    
                });
                     
                 }); 
             });
             
                   
            
            
    
           
             
            function traerPrecios() {
                 $('#cuerpoTablaPrecios').html('');
                $.ajax({
                url: "TraerPrecios.htm",
                type: 'POST',               
                success: function (data) {
                    debugger
                        var _datosT = eval("[" + data.split("=").join(":") + "]"); 
                     for(var i=0;i<_datosT.length;i++)
                     {
                         
                         $('#cuerpoTablaPrecios').append("<tr><td class='hidden'>"+_datosT[i].idPrecio+"</td><td>"+_datosT[i].PrecioKilo+"</td><td>"+_datosT[i].PrecioDia+"</td></td><td><a href='#' onclick=\"actualizarPrecios("+_datosT[i].idPrecio+","+_datosT[i].PrecioKilo+","+_datosT[i].PrecioDia+")\" class='btn btn-success'><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span></a></td></tr>");
                       
                    } 
                    }
            
                });
    
}

function actualizarPrecios(id,preciokilo,precioFornal) {
    
    $('#precioDia').val(precioFornal);
    $('#precioKilo').val(preciokilo);
     $('#idPrecios').val(id);
     
     $('#formPrecios').show();
   
}
            
            
            //funciones Lotes 
            
            function traerLotes() {
                 $('#cuerpoTabla1').html('');
                $.ajax({
                url: "TraerLotes.htm",
                type: 'POST',               
                success: function (data) {
                    debugger
                        var _datosT = eval("[" + data.split("=").join(":") + "]"); 
                     for(var i=0;i<_datosT.length;i++)
                     {
                         
                         $('#cuerpoTabla1').append("<tr><td class='hidden'>"+_datosT[i].idLote+"</td><td>"+_datosT[i].nombre+"</td><td>"+_datosT[i].CantidadArboles+"</td><td>"+_datosT[i].NombreSemilla+"</td><td>"+_datosT[i].fecha+"</td><td><a href='#' onclick=\"editarLotes("+_datosT[i].idLote+",'"+_datosT[i].nombre+"',"+_datosT[i].CantidadArboles+",'"+_datosT[i].NombreSemilla+"','"+_datosT[i].fecha+"')\" class='btn btn-success'><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span></a></td></tr>");
                       
                    } 
                    }
            
                });
    
}

function editarLotes(idLote,nombre,CantidadArboles,NombreSemilla,fecha) {
    
    
  $('#NombreLote').val(nombre);
                    $('#CantidadArboles').val(CantidadArboles);
                    $('#NombreSemilla').val(NombreSemilla);
                   $('#FechaSiembra').val(fecha);
                    $('#idLotes').val(idLote);
                    $('#btnGuardarLote').val('Actualizar');
                   
}

            
             $(document).ready(function () {
                $("#formLotes").submit(function (e) {
                    debugger
                    var nombre=$('#NombreLote').val();
                    var CantidadArboles=$('#CantidadArboles').val();
                    var NombreSemilla=$('#NombreSemilla').val();
                    var Fecha_Siembra=$('#FechaSiembra').val();
                      var idLote=$('#idLotes').val();
                   e.preventDefault();
                   
                   if( $('#btnGuardarLote').val()=="Guardar")
                   {
                       
                   
                   $.ajax({
                      url: "CrearLote.htm",
                      type: 'POST',
                      data:"Nombre="+nombre+"&CantidadArboles="+CantidadArboles+"&NombreSemilla="+NombreSemilla+"&Fecha_Siembra="+Fecha_Siembra,
                      success: function (data) {
                        
                        if(data=="ok"){
                            traerLotes();
                        }
                        else
                        {
                            alert(data);
                        }
                    }
                   });
                }
                else
                {
                     $.ajax({
                      url: "ActualizarLotes.htm",
                      type: 'POST',
                      data:"idLote="+idLote+"&Nombre="+nombre+"&CantidadArboles="+CantidadArboles+"&NombreSemilla="+NombreSemilla+"&Fecha_Siembra="+Fecha_Siembra,
                      success: function (data) {
                        
                        if(data=="ok"){
                            traerLotes();
                              $('#NombreLote').val('');
                    $('#CantidadArboles').val('');
                    $('#NombreSemilla').val('');
                   $('#FechaSiembra').val('');
                    $('#idLotes').val('');
                    $('#btnGuardarLote').val('Guardar');
                        }
                         else
                        {
                            alert(data);
                        }
                    }
                   });
                }
                });                
             });
            
            
            //funciones Empleados
            function editar(id,cedula,nombre,apellido,telefono)
            {
                 $('#id').val(id);
                $('#Cedula').val(cedula);
                     $('#NomEmpleado').val(nombre);
                        $('#Apellido').val(apellido);
                  $('#Telefono').val(telefono);
                  $('#btnGuardar').val('Actualizar');
            }
            
            function traerEmplados()
            {
                 $('#cuerpoTabla').html('');
                $.ajax({
            type: 'POST',
            url: "TraerEmpleados.htm",
            success: function (data) {
                                   
                     var _datosT = eval("[" + data.split("=").join(":") + "]"); 
                     for(var i=0;i<_datosT.length;i++)
                         $('#cuerpoTabla').append("<tr><td class='hidden'>"+_datosT[i].idTrabajador+"</td><td>"+_datosT[i].Cedula+"</td><td>"+_datosT[i].Nombre+"</td><td>"+_datosT[i].Apellido+"</td><td>"+_datosT[i].Telefono+"</td><td><a href='#' onclick=\"editar("+_datosT[i].idTrabajador+","+_datosT[i].Cedula+",'"+_datosT[i].Nombre+"','"+_datosT[i].Apellido+"','"+_datosT[i].Telefono+"')\" class='btn btn-success'><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span></a></td><td><a href='#' onclick=\"eliminarEmpleado("+_datosT[i].idTrabajador+")\" class='btn btn-danger'><span class='lyphicon glyphicon glyphicon-trash' aria-hidden='true'></span></a></td></tr>");
                       
                    }
            
                });
            }
            
            function limipiarCampos(opcion)
            {
                if(opcion=="1")
                {
                    $('#Alerta').text("Empleado Guardado con exito");
                }
                else if(opcion=="2")
                {
                    $('#Alerta').text("Empleado Actualizado con exito");
                }
                else
                {
                    $('#Alerta').text("Empleado Eliminado con exito");
                }
                   
                    
        $('#Cedula').val('');
                     $('#NomEmpleado').val('');
                        $('#Apellido').val('');
                  $('#Telefono').val('');
                  
               
                  
                  
             
                    
            }
            
             $(document).ready(function () {
                 
                 $("#formEmpleado").submit(function (e) {
                     debugger
                     e.preventDefault();
                       var cedula=$('#Cedula').val();
                        var Nombre=$('#NomEmpleado').val();
                        var Apellido=$('#Apellido').val();
                        var Telefono=$('#Telefono').val();
                        if($('#btnGuardar').val()=='Guardar')
                        {
                        $.ajax({
                           type: 'POST',
                           url: "GuardarEmplado.htm",
                           data:"Cedula="+cedula+"&Nombre="+Nombre+"&Apellido="+Apellido+"&Telefono="+Telefono,
                           success: function (data) {
                 if(data=="ok")
                 {
                    traerEmplados(); 
                 limipiarCampos(1);
                 }
                 else
                 {
                     alert(data);
                 }
                     
                            }
                           
                        });

                        }
                        else 
                        {
                          actualizarEmpleado(cedula,Nombre,Apellido,Telefono);  
                          $('#btnGuardar').val("Guardar");
                        }
                 }); 
             });
             
          function eliminarEmpleado(id) {
           
              $.ajax({
                 type: 'POST',
                 url: "EliminarEmplado.htm",
                 data: "id="+id,
                 success: function (data) {
                     debugger
                       if(data=="ok")
                        {
                              traerEmplados();
                              limipiarCampos(3);
                        }
                        else
                        {
                          $('#Alerta').text("Este Empleado no puede ser Eliminado");  
                        }
                    }
              });
    
}
            function actualizarEmpleado(cedula,Nombre,Apellido,Telefono)
            {
                var id=$('#id').val();
                $.ajax({
                    type:'POST',
                    url: "ActualizarEmplado.htm",
                    data:"idTrabajador="+id+"&Cedula="+cedula+"&Nombre="+Nombre+"&Apellido="+Apellido+"&Telefono="+Telefono,
                    success: function (data) {
                      
                        if(data="ok")
                        {
                            traerEmplados();
                            limipiarCampos(2);
                            
                        }
                    }
                    
                    
                });
                
            }
    
        </script>
        
        
    </head>
    <body onload="traerEmplados(),traerLotes(),traerPrecios(),ocultarFomularioPrecios (),MenuActivo(2);">
        
       
        <input type="hidden" value="0" id="idLotes">
        <input type="hidden" id="id">
          <input type="hidden" id="idPrecios">
        <div class="container">
            <div class="row">
                
                <div class="panel with-nav-tabs panel-primary">
                        <div class="panel-heading">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#tab1primary" data-toggle="tab">Control de Empleados</a></li>
                                    <li><a href="#tab2primary" data-toggle="tab">Control de Lotes</a></li>
                                    <li><a href="#tab3primary" data-toggle="tab">Control de Precios</a></li>
                                    
                                </ul>
                        </div>
                       <div class="panel-body">
                           <div class="tab-content">
                        <div class="tab-pane fade in active" id="tab1primary">
                              <div class="col-md-5">
                    <br/>
                    <form id="formEmpleado">
                        <input type="number" id="Cedula" placeholder="Cedula" class="form-control" required="">     <br/>
                        <input type="text" id="NomEmpleado" placeholder="Nombre Empleado" class="form-control" required="">     <br/>
                        <input type="text" id="Apellido" placeholder="Apellido" class="form-control" required="">     <br/>
                        <input type="text" id="Telefono" placeholder="Telefono" class="form-control" required="">
                        
                        <br/>
                        <input type="submit"  value="Guardar" id="btnGuardar" class="btn btn-info form-control">
                    </form>
                    <br/>
                    <p id="Alerta" class="alert-success"></p>
                </div>
                <div class="col-md-7">
                    <table class="table" id="listEmpleados">
                         <tr><th>Cedula</th><th>Nombre</th><th>Apellido</th><th>Telefono</th></tr>
                         <tbody id="cuerpoTabla">
                            
                            
                        </tbody>
                       
                        
                    </table>
                   
                </div>
                            </div>
                                <div class="tab-pane fade " id="tab2primary">
                                        <div class="col-md-5">
                    <br/>
                    <form id="formLotes">
                        <input type="text" id="NombreLote" placeholder="Nombre Lote" class="form-control" required="">     <br/>
                        <input type="number" id="CantidadArboles" min="0" placeholder="Cantidad de Arboles" class="form-control" required="">     <br/>
                        <input type="text" id="NombreSemilla" placeholder="Nombre Semilla" class="form-control" required="">     <br/>
                        <label>Fecha de Siembra </label>
                        <input type="date" id="FechaSiembra"  class="form-control" required="">
                        
                        <br/>
                        <input type="submit"  value="Guardar" id="btnGuardarLote" class="btn btn-info form-control">
                    </form>
                    <br/>
                    <p id="Alerta" class="alert-success"></p>
                </div>
                <div class="col-md-7">
                    <table class="table" id="listEmpleados">
                         <tr><th>Nombre Lote</th><th>Cantidad de Arboles</th><th>Nombre Semilla</th><th>Fecha de Siembra</th></tr>
                         <tbody id="cuerpoTabla1">
                            
                            
                        </tbody>
                       
                        
                    </table>
                   
                </div>
                            </div>
                               
                               
                                <div class="tab-pane fade " id="tab3primary">
                              <div class="col-md-5">
                    <br/>
                    <form id="formPrecios">
                        <input type="number" id="precioKilo"  placeholder="Precio por kilogramo" class="form-control" required="">     <br/>
                        <input type="number" id="precioDia"  placeholder="Precio por Fornal" class="form-control" required="">     <br/>
                        
                        
                        <br/>
                        <input type="submit"  value="Actualizar" id="btnActualizarPrecios" class="btn btn-info form-control">
                    </form>
                    <br/>
                    <p id="Alerta" class="alert-success"></p>
                </div>
                <div class="col-md-7">
                    <table class="table">
                         <tr><th>Precio Kilogramo</th><th>Precio Fornal</th></tr>
                         <tbody id="cuerpoTablaPrecios">
                            
                            
                        </tbody>
                       
                        
                    </table>
                   
                </div>
                            </div>
                               </div>
                           </div>
                  </div>  
                
                
                
              
            </div>
        </div>
    </body>
</html>
