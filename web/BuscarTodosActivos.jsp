<%-- 
    Document   : BuscarTodosActivos
    Created on : 30/09/2017, 10:33:42 AM
    Author     : Lenovo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Consultas.ActivosFijos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
    </head>
    <body>
        <table id="example" class="display" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>Serial</th>
                <th>Nombre</th>
                <th>Descripción</th>
                <th>Tipo</th>
                <th>N. interno</th>
                <th>Peso</th>
                <th>Alto</th>
                <th>Ancho</th>
                <th>Largo</th>
                <th>Valor compra</th>
                <th>Fecha compra</th>
                <th>Fecha baja</th>
                <th>Estado actual</th>
                <th>Color</th>                
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>Serial</th>
                <th>Nombre</th>
                <th>Descripción</th>
                <th>Tipo</th>
                <th>N. interno</th>
                <th>Peso</th>
                <th>Alto</th>
                <th>Ancho</th>
                <th>Largo</th>
                <th>Valor compra</th>
                <th>Fecha compra</th>
                <th>Fecha baja</th>
                <th>Estado actual</th>
                <th>Color</th>   
            </tr>
        </tfoot>
        <tbody>
            <tr>
                 <%
                    ActivosFijos af = new ActivosFijos();
                    ResultSet m = af.BuscarActivos();
                    while (m.next()) {
                %>
                <td><%=m.getString("Serial")%></td>
                <td><%=m.getString("Nombre")%></td>
                <td><%=m.getString("Descripcion")%></td>
                <td><%=m.getString("Tipo")%></td>
                <td><%=m.getString("N_interno")%></td>
                <td><%=m.getString("Peso")%></td>
                <td><%=m.getString("Alto")%></td>
                <td><%=m.getString("Ancho")%></td>
                <td><%=m.getString("Largo")%></td>
                <td><%=m.getString("Valor_compra")%></td>
                <td><%=m.getString("Fecha_compra")%></td>
                <td><%=m.getString("Fecha_baja")%></td>
                <td><%=m.getString("Estado_actual")%></td>
                <td><%=m.getString("Color")%></td>
                 <%
                    }
                %>
            </tr>           
        </tbody>
    </table>
        
        <script>
          $(document).ready(function() {
            $('#example').DataTable();
          } );              
        </script>
    </body>
</html>
