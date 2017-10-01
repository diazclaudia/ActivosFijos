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

        <style type="text/css">
            .bs-example{
                margin: 20px;
            }
        </style>
        <script>

            $(document).ready(function () {
                $.noConflict();
                $('#example1').DataTable();
            });
        </script>
    </head>
    <body>
        <br><br>
        <table id="example1" class="display" cellspacing="0" width="100%">
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
                    <th>Editar</th>   

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
                    <th>Editar</th>
                </tr>
            </tfoot>
            <tbody>
                <%
                    ActivosFijos af = new ActivosFijos();
                    ResultSet m = af.BuscarActivos();
                    while (m.next()) {
                        String serial = m.getString("Serial");
                %>
                <tr>                 
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
                    <td><a href="#myModal" class="btn btn-primary btn-details" data-toggle="modal">Editar</a></td>                     
                </tr> 

            <div class="bs-example">         

                <!-- Modal HTML -->
                <div id="myModal" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title"><%=serial%></h4>
                            </div>
                            <div class="modal-body">
                                <p>Do you want to save changes you made to document before closing?</p>
                                <p class="text-warning"><small>If you don't save, your changes will be lost.</small></p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>   

            <%
                }
            %>
        </tbody>
    </table>



</body>
</html>
