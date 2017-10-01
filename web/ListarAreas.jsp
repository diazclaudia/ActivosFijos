<%-- 
    Document   : ListarAreasPersonas
    Created on : 30/09/2017, 05:53:57 PM
    Author     : Lenovo
--%>

<%@page import="Consultas.ActivosFijos"%>
<%@page import="Consultas.Areas"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>DataTables example - Zero configuration</title>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8"><link rel="shortcut icon" type="image/png" href="/media/images/favicon.png">
        <script src="https://cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.4/css/jquery.dataTables.min.css">
        <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
 
        <script>
            
            $(document).ready(function () { 
                $.noConflict();
                $('#example3').DataTable();
            });
        </script>
    </head>
    <body>
        <br><br>
        <table id="example3" class="display" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>Id area</th>
                    <th>Nombre</th>
                    <th>Ciudad</th>
                    <th>Nombre Activo asignado</th>                      
                </tr>
            </thead>
            <tfoot>
                <tr>
                    <th>Id area</th>
                    <th>Nombre</th>
                    <th>Ciudad</th>
                    <th>Nombre Activo asignado</th>   
                </tr>
            </tfoot>
            <tbody>
                <%
                    ActivosFijos af = new ActivosFijos();
                    Areas ar = new Areas();
                    ResultSet arr = ar.BuscarAreas();
                    while (arr.next()) {
                        String serialA = arr.getString("Serial");
                %>
                <tr>                 
                    <td><%=arr.getString("IdArea")%></td>
                    <td><%=arr.getString("Nombre")%></td>
                    <td><%=arr.getString("Ciudad")%></td>
                     <%                         
                    ResultSet t = af.BuscarActivosSerial(serialA);
                    while (t.next()) { %>
                    <td><%=t.getString("Nombre")%></td>
                    <% } %>                     
                </tr> 
                <%
                    }
                %>
            </tbody>
        </table>


    </body>
</html>

