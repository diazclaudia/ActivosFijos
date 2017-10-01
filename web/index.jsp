<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>API Activos Fijos</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
    </head>
    <body>

        <div class="container">
            <h2>Prueba Técnica: API Activos Fijos</h2>
            <p>Los activos de fijos de una empresa son los bienes materiales, son necesarios para el funcionamiento
                de la empresa y no se destinan para la venta, ejemplos de estos son: bienes inmuebles, maquinaria,
                material de oficina, etc.</p>
            <p> Estos activos fijos tienen características comunes entre todas como son: nombre, descripción, tipo,
                serial, numero interno de inventario, peso, alto, ancho, largo, valor compra, fecha de compra, fecha
                de baja, estado actual (activo, dado de baja, en reparación, disponible, asignado), color.
                Los activos se pueden asignar a un área o persona, si es a un área esta se encuentra en una ciudad
                (diferentes áreas se encuentran en diferentes ciudades).</p>
            <p> Diseñar una API REST que permite administrar los activos, esta debería permitir:</p><br>
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#home">Crear nuevos activos </a></li>                
                <li><a data-toggle="tab" href="#menu2">Buscar activos</a></li>
                <li><a data-toggle="tab" href="#menu3">Actualizar activos</a></li>
                <li><a data-toggle="tab" href="#menu4">Cambiar el serial interno y fecha de baja</a></li>
                <li><a data-toggle="tab" href="#menu5">Listar las áreas o personas</a></li>
            </ul>

            <div class="tab-content">
                
                    
                    <div id="home" class="tab-pane fade in active">
                    <h3>Crear nuevos activos</h3>
                    <%String urlRedirect2 = "CrearActivos.jsp";%>
                    <jsp:include page="<%=urlRedirect2%>"></jsp:include>                
                    </div>
                    <div id="menu2" class="tab-pane fade">
                    <h3>Buscar cualquier variable</h3>
                    <%String urlRedirect1 = "BuscarTodosActivos.jsp";%>
                    <jsp:include page="<%=urlRedirect1%>"></jsp:include>
                    </div>
                <div id="menu3" class="tab-pane fade">
                    <h3>Actualizar activos</h3>
                    <%String urlRedirect3 = "ActualizarActivos.jsp";%>
                    <jsp:include page="<%=urlRedirect3%>"></jsp:include>    
                </div>
                <div id="menu4" class="tab-pane fade">
                    <h3>Cambiar el serial interno y fecha de baja</h3>
                    <%String urlRedirect4 = "CambiarSF.jsp";%>
                    <jsp:include page="<%=urlRedirect4%>"></jsp:include>    
                </div>
                <div id="menu5" class="tab-pane fade">
                    <h3>Listar las áreas o personas</h3>
                    <%String urlRedirect5 = "ListarAreasPersonas.jsp";%>
                    <jsp:include page="<%=urlRedirect5%>"></jsp:include>    
                </div>
            </div>
        </div>
    </body>
</html>
