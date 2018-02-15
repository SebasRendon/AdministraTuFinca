<%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Spring Web MVC project</title>
        <link href="<c:url value="/public/css/bootstrap.css"></c:url>" rel="stylesheet" type="text/css"/>
        
    </head>

    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    
                  
                </div>
                <div class="col-md-4">
                    <h2>Pagina para el control contable de las fincas cafeteras</h2>
                    <form action="AddRegistros.htm">
                        <label>Usuario</label>
                        <input type="text" class="form-control"  placeholder="Ingrese Usuario">
                        <label>Contraseña</label>
                        <input type="password" class="form-control" placeholder="Ingrese Contraseña">
                        <br/>
                        <br/>
                        <input type="submit" class="btn btn-primary form-control" value="Iniciar Sesión">
                    </form>
                    
                </div>
                 <div class="col-md-4">
                    
                  
                </div>
            </div>
        </div>  
    </body>
</html>
