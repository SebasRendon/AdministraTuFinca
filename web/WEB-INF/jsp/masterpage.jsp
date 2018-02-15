<%-- 
    Document   : masterpage
    Created on : 18/01/2018, 12:26:23 PM
    Author     : Acer
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="<c:url value="/public/css/bootstrap.css"></c:url>" rel="stylesheet" type="text/css"/>
        <script src="<c:url value="/public/jquery-3.3.1.min.js"></c:url>" type="text/javascript"></script>
           <link href="<c:url value="/public/css/PanelInsumos.css"></c:url>  " rel="stylesheet" type="text/css"/>
        <script src="<c:url value="/public/js/bootstrap.js"></c:url> " type="text/javascript"></script>
        <title>Master</title>
        <script type="text/javascript">
            
            function MenuActivo(opcion) {
                debugger
    switch (opcion) {
    case 1:
        $('#menu1').addClass("active");
        $('#menu2').removeClass()("active");
        $('#menu3').removeClass()("active");
        break;
        case 2:
        $('#menu1').removeClass("active");
        $('#menu2').addClass("active");
        $('#menu3').removeClass("active");
        break;
        case 3:
        $('#menu1').removeClass("active");
        $('#menu2').removeClass("active");
        $('#menu3').addClass("active");
        break;

    default:
        
        break;
}
}
            
        </script>
    </head>
    <body>
        <div class="container-fluid">
          
            <nav class="navbar navbar-inverse" role="navigation">
  <!-- El logotipo y el icono que despliega el menú se agrupan
       para mostrarlos mejor en los dispositivos móviles -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse"
            data-target=".navbar-ex1-collapse">
      <span class="sr-only">Desplegar navegación</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="AddRegistros.htm">Logotipo</a>
  </div>
 
  <!-- Agrupar los enlaces de navegación, los formularios y cualquier
       otro elemento que se pueda ocultar al minimizar la barra -->
  <div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav">
        <li  onclick="MenuActivo(1);" id="menu1"><a href="AddRegistros.htm">Crear Registro</a></li>
      <li id="menu2" onclick="MenuActivo(2);"><a href="AgregarEmpleado.htm">Control de Empleados y Lotes</a></li>
     <li id="menu3" onclick="MenuActivo(3);"><a href="Inversiones.htm">Control de Insumos</a></li>
    </ul>
 
  <ul class="nav navbar-nav navbar-right">
      <li><a href="login.htm" class="btn btn-lg">Salir <span class="glyphicon glyphicon-log-in" aria-hidden="true"></span></a></li>
      
 
 
  </div>
</nav>
           
        </div>
        <br><br><br>
       
    </body>
</html>
