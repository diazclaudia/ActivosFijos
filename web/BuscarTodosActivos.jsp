<%-- 
    Document   : ActualizarActivos
    Created on : 30/09/2017, 05:53:20 PM
    Author     : Lenovo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Consultas.ActivosFijos"%>
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
            $('#example2').DataTable();
            });
        </script>
    </head>
    <body>
        <br><br>
        <table id="example2" class="display" cellspacing="0" width="100%">
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
                <%
                    
                    ActivosFijos af1 = new ActivosFijos();
                    ResultSet m1 = af1.BuscarActivos();
                    while (m1.next()) {                       
                %>
                <tr>                 
                    <td><%=m1.getString("Serial")%></td>
                    <td><%=m1.getString("Nombre")%></td>
                    <td><%=m1.getString("Descripcion")%></td>
                    <td><%=m1.getString("Tipo")%></td>
                    <td><%=m1.getString("N_interno")%></td>
                    <td><%=m1.getString("Peso")%></td>
                    <td><%=m1.getString("Alto")%></td>
                    <td><%=m1.getString("Ancho")%></td>
                    <td><%=m1.getString("Largo")%></td>
                    <td><%=m1.getString("Valor_compra")%></td>
                    <td><%=m1.getString("Fecha_compra")%></td>
                    <td><%=m1.getString("Fecha_baja")%></td>
                    <td><%=m1.getString("Estado_actual")%></td>
                    <td><%=m1.getString("Color")%></td>                                  
                </tr> 

            <%
                }
            %>
        </tbody>
    </table>


    </body>
</html>
