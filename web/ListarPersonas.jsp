<%-- 
    Document   : ListarPersonas
    Created on : 1/10/2017, 11:42:06 AM
    Author     : Lenovo
--%>


<%@page import="Consultas.Personas"%>
<%@page import="Consultas.ActivosFijos"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>DataTables example - Zero configuration</title>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8"><link rel="shortcut icon" type="image/png" href="/media/images/favicon.png">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.4/css/jquery.dataTables.min.css">
        <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
 
        <script>
            
            $(document).ready(function () {
                $.noConflict();
                $('#example4').DataTable();
            });
        </script>
    </head>
    <body>
        <br><br>
        <table id="example4" class="display" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>Id persona</th>
                    <th>Nombre</th>
                    <th>Cedula</th>
                    <th>Nombre Activo asignado</th>                      
                </tr>
            </thead>
            <tfoot>
                <tr>
                    <th>Id persona</th>
                    <th>Nombre</th>
                    <th>Cedula</th>
                    <th>Nombre Activo asignado</th>    
                </tr>
            </tfoot>
            <tbody>
                <%
                    ActivosFijos af2 = new ActivosFijos();
                    Personas ar2 = new Personas();
                    ResultSet arr2 = ar2.BuscarPersonas();
                    while (arr2.next()) {
                        String serialA2 = arr2.getString("Serial");
                %>
                <tr>                 
                    <td><%=arr2.getString("IdPersona")%></td>
                    <td><%=arr2.getString("Nombre")%></td>
                    <td><%=arr2.getString("Cedula")%></td>
                     <%                         
                    ResultSet t2 = af2.BuscarActivosSerial(serialA2);
                    while (t2.next()) { %>
                    <td><%=t2.getString("Nombre")%></td>
                    <% } %>                     
                </tr> 
                <%
                    }
                %>
            </tbody>
        </table>


    </body>
</html>

