
<%-- 
    Document   : Inversiones
    Created on : 04-feb-2018, 18:06:27
    Author     : JhoanSebas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/masterpage.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
      
        <script type="text/javascript">
            
            
        
            
             function editar(id,Nombre,Descricion)
            {
                 $('#id').val(id);
                $('#NameInsumo').val(Nombre);
                $('#DescripcionInsumo').val(Descricion);
                     
                  $('#btnGuardar').val('Actualizar');
            }
            
            
             function eliminar(id) {
           
              $.ajax({
                 type: 'POST',
                 url: "EliminarInsumo.htm",
                 data: "id="+id,
                 success: function (data) {
                     
                       if(data=="ok")
                        {
                            traerInsumos();
                        }
                        else
                            {
                                alert(data);
                            }
                        
                    }
              });             
                  
              }
              
              
             function CantidadDisponibleinsumo() {
                 debugger
           var id=$('#nameSalidaInsumo').val();
              $.ajax({
                 type: 'POST',
                 url: "CantidadInsumoDisponible.htm",
                 data: "id="+id,
                 success: function (data) {
                     
                      
                      $('#numdisp').text(data);
                      $('#numdisphidden').val(data);
                      
                        
                    }
              });             
                  
              }
             
            
            
    $(document).ready(function () { 
         $("#formInventario").submit(function (e) {
             e.preventDefault();
             debugger
              var name=$('#NameInsumo').val();
             var descripcion=$('#DescripcionInsumo').val();
             if($('#btnGuardar').val()=="Guardar")
             {
                 
             
             
             $.ajax({
                 url: "crearInsumo.htm",
                 type: 'POST',
                 data: "nombre="+name+"&descripcion="+descripcion,
                 success: function (data) {
                        if(data=="ok")
                        {
                            
                              traerInsumos();
                              limpiar();
                        }
                        else
                        {
                            alert(data);
                        }
                    }
            
            
             });
             }else
             {
                
                  var id=$('#id').val();
                $.ajax({                    
                    type:'POST',
                    url: "ActualizarInsumo.htm",
                    data:"id="+id+"&Nombre="+name+"&Descricion="+descripcion,
                    success: function (data) {
                      
                        if(data="ok")
                        {
                           traerInsumos();
                       limpiar();
                            $('#btnGuardar').val('Guardar');
                        }
                    }
                    
                    
                });
             }
             
             
          });
          
          $("#formSalidaIdInsumos").submit(function (e) {
              var idInsumo=$('#nameSalidaInsumo').val();
              var idLote=$('#lotes').val();
              var Cantidad=$('#cantidadSalida').val();
              var  fecha=$('#fechaSalida').val();
              
              
                                
               $.ajax({
                  url: "SalirInsumo.htm" ,
                  type: 'POST',
                  data:"idInsumo="+idInsumo+"&Cantidad="+Cantidad+"&idLote="+idLote+"&fecha="+fecha,
                  success: function (data) {
                      alert(data);
                        CantidadDisponibleinsumo();
                        traerInsumos();
                        traerInsumosCantidadSalida()
                    }
               });
               
               
               
               e.preventDefault();
                                
          });
          
          $("#formcantidadInsumos").submit(function (e) {
              var idInsumo=$('#nameInsumo').val();
              var fecha=$('#fecha').val();
              var cantidad=$('#cantidad').val();
              var precio=$('#precio').val();
              
               e.preventDefault();
             
                    $.ajax({
                 url: "CantidadInsumo.htm",
                 type: 'POST',
                 data: "idInsumo="+idInsumo+"&fecha_compra="+fecha+"&Cantidad="+cantidad+"&Precio_unitario="+precio,
                 success: function (data) {
                        if(data=="ok")
                        {
                             traerInsumos();
                             traerInsumosCantidad(); 
                             
                        }
                       
                    }
            
           
             });
             
             
             
          });
          
            });
                 
                
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
                
                
                
               function traerInsumos()
            {
                 $('#cuerpoTabla').html('');
                 $('#nameInsumo').html('');
                   $('#nameSalidaInsumo').html('');
                $.ajax({
            type: 'POST',
            url: "TraerInsumos.htm",
            success: function (data) {
                                   
                     var _datosT = eval("[" + data.split("=").join(":") + "]"); 
                     for(var i=0;i<_datosT.length;i++)
                     {
                        $('#cuerpoTabla').append("<tr><td class='hidden'>"+_datosT[i].idInsumo+"</td><td>"+_datosT[i].Nombre+"</td><td>"+_datosT[i].Descripcion+"</td><td>"+_datosT[i].CantidadDisponible+"</td></td><td><a href='#' onclick=\"editar("+_datosT[i].idInsumo+",'"+_datosT[i].Nombre+"','"+_datosT[i].Descripcion+"')\" class='btn btn-success'><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span></a></td><td><a href='#' onclick=\"eliminar("+_datosT[i].idInsumo+")\" class='btn btn-danger'><span class='lyphicon glyphicon glyphicon-trash' aria-hidden='true'></span></a></td></tr>"); 
                         $('#nameInsumo').append("<option value="+_datosT[i].idInsumo+">"+_datosT[i].Nombre+" "+_datosT[i].Descripcion+"</option>");
                         $('#nameSalidaInsumo').append("<option value="+_datosT[i].idInsumo+">"+_datosT[i].Nombre+" "+_datosT[i].Descripcion+"</option>");
                     }
                         
        
        
                    }
            
                });
            }
            
                      function traerInsumosCantidad()
            {
                 $('#cuerpoTabla1').html('');
              
                $.ajax({
            type: 'POST',
            url: "TraerCantidadInsumos.htm",
            success: function (data) {
                                   
                     var _datosT = eval("[" + data.split("=").join(":") + "]"); 
                     for(var i=0;i<_datosT.length;i++)
                     {
                        $('#cuerpoTabla1').append("<tr><td class='hidden'>"+_datosT[i].id+"</td><td>"+_datosT[i].Nombre+"</td><td>"+_datosT[i].fecha+"</td><td>"+_datosT[i].Cantidad+"</td><td>"+_datosT[i].Precio_unitario+"</td><td>"+_datosT[i].Total+"</td><td><a href='#' onclick=\"editar("+_datosT[i].idInsumo+",'"+_datosT[i].Nombre+"','"+_datosT[i].Descripcion+"')\" class='btn btn-success'><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span></a></td></tr>"); 
                        
                     }
                         
        
        
                    }
            
                });
            }
            
            
            
            function limpiar() {
        $('#NameInsumo').val('');
                            $('#DescripcionInsumo').val('');
                            $('#id').val('');
              }
              
                function verificar() {
                    debugger
        var disponibles=$('#numdisphidden').val();
        var cantidad=$('#cantidadSalida').val();
        
        var a = parseInt(disponibles);
        var b = parseInt(cantidad);
        
      
        if(b>a){
            
           $('#mensaje').text('no hay suficientes');
            $('#mensaje').show(true);
           $('#cantidadSalida').val('');
        }
        else
        {
            ocultar();
        }
       
              }
              
              function ocultar() {
    $('#mensaje').hide();
}

         function traerInsumosCantidadSalida()
            {
                 $('#cuerpoTabla2').html('');
              
                $.ajax({
            type: 'POST',
            url: "SalidaInsumosLista.htm",
            success: function (data) {
                                   
                     var _datosT = eval("[" + data.split("=").join(":") + "]"); 
                     for(var i=0;i<_datosT.length;i++)
                     {
                        $('#cuerpoTabla2').append("<tr></td><td>"+_datosT[i].NombreLote+"</td><td>"+_datosT[i].NombreInsumo+"</td><td>"+_datosT[i].Cantidad+"</td><td>"+_datosT[i].fecha+"</td></tr>"); 
                        
                     }
                         
        
        
                    }
            
                });
            }
              
            
        </script>
    </head>
    <body onload="traerInsumos(),traerInsumosCantidad(),traerLotes(),ocultar(),traerInsumosCantidadSalida(),MenuActivo(3);">
        <input type="hidden" value="0" id="id">
        <input type="hidden" value="0" id="numdisphidden">        
        <h3 class="text-uppercase text-center">insumos</h3>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                     <div class="panel with-nav-tabs panel-primary">
                <div class="panel-heading">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#tab1primary" data-toggle="tab">Crear de insumos Nuevos</a></li>
                            <li><a href="#tab2primary" data-toggle="tab">Registro Ingreso Insumos</a></li>
                            <li><a href="#tab3primary" data-toggle="tab">Registro Salida Insumos</a></li>
                            <li class="dropdown">
                                <a href="#" data-toggle="dropdown">Dropdown <span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="#tab4primary" data-toggle="tab">Primary 4</a></li>
                                    <li><a href="#tab5primary" data-toggle="tab">Primary 5</a></li>
                                </ul>
                            </li>
                        </ul>
                </div>
                <div class="panel-body">
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="tab1primary">
                            
                               <div class="col-md-6">
                    <form id="formInventario">
                        <input type="text" class="form-control" id="NameInsumo" required="" placeholder="Nombre Insumo" >  
                        <br>
                        <input type="text" class="form-control" required="" id="DescripcionInsumo" placeholder="Descripción" >  
                         <br>
                         
                         <input type="submit" id="btnGuardar" class="btn btn-success form-control" value="Guardar"> 
                        
                        
                    </form>    
                    
                </div>
                <div class="col-md-6">
                    
                     <table class="table" id="listInsumos">
                         <tr><th>Nombre Insumo</th><th>Descripción</th><th>Dispoble</th></tr>
                         <tbody id="cuerpoTabla">
                            
                            
                        </tbody>
                       
                        
                    </table>
                    
       
                </div>
                            
                            
                            
                        </div>
                        <div class="tab-pane fade" id="tab2primary">
                        
                            <div class="col-md-6">
                                <form id="formcantidadInsumos" >
                                    <label>Seleccione Un insumo</label>
                                    <select id="nameInsumo" size="2" required="" class="form-control" >                                            
                                    </select>    
                                    <br>
                                    <label>Fecha de Compra</label>
                                    <input type="date" id="fecha" required="" class="form-control">
                                    <label>Cantidad</label>
                                    <input type="number" id="cantidad" min="0" required="" class="form-control">
                                    <label>Precio Unitario</label>
                                    <input type="number" id="precio" min="0" required="" class="form-control">
                                    <br>
                                    <input type="submit" value="Guardar" class="btn btn-primary form-control">
                                </form>
                            </div>
                            <div class="col-md-6">
                                <table class="table" id="listInsumos">
                                <tr><th>Nombre Insumo</th><th>Fecha de Compra</th><th>cantidad</th><th>Precio Unitario</th><th>Total</th></tr>
                                 <tbody id="cuerpoTabla1">
                            
                            
                                </tbody>
                       
                        
                    </table>
                            </div>
                        
                        
                        
                        
                        </div>
                        <div class="tab-pane fade" id="tab3primary">
                            <div class="col-md-4">
                                <form id="formSalidaIdInsumos" >
                                    <label>Seleccione Un Lote</label>
                                    <select id="lotes" size="2" required="" class="form-control" >                                            
                                    </select>    
                                    <label>Seleccione Un insumo</label>
                                    <select onchange="CantidadDisponibleinsumo();" id="nameSalidaInsumo" size="10" required="" class="form-control" >                                            
                                    </select>    
                                    <br>
                                    <label>Cantidad</label>
                                    <input type="number" onblur="verificar();" id="cantidadSalida" min="0" required="" class="form-control">
                                    <p id="mensaje" class="alert alert-danger"></p>
                                    <br>
                                    <label>Fecha de Salida</label>
                                    <input type="date" id="fechaSalida" required="" class="form-control">
                                    <br>
                                    <input type="submit" class="btn btn-primary btn-sm" value="Agregar">
                                </form>
                               
                            </div>   
                            <div class="col-md-2">
                                <p>Disponilbes </p>   
                                <h3 id="numdisp"></h3>
                            </div>
                            <div class="col-md-5">
                                
                                 <table class="table" id="listInsumosSalida">
                                <tr><th>Lote</th><th>Insumo</th><th>cantidad</th><th>Fecha de Salida</th></tr>
                                 <tbody id="cuerpoTabla2">
                            
                            
                                </tbody>
                                 </table>
                            </div>   
                            
                            
                        </div>
                        <div class="tab-pane fade" id="tab4primary">Primary 4</div>
                        <div class="tab-pane fade" id="tab5primary">Primary 5</div>
                    </div>
                </div>
            </div>
                </div>
             
                
            </div>
        </div>
        
        
    </body>
</html>
