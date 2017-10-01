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
            .bs-example1{
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
                    String serial = "";
                    ActivosFijos af = new ActivosFijos();
                    ResultSet m = af.BuscarActivos();
                    while (m.next()) {
                        serial = m.getString("Serial");
                        String estado = m.getString("Estado_actual");
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
                    <td><a href="#myModal<%=serial%>" class="btn btn-primary btn-details" data-toggle="modal">Editar</a></td>                     
                </tr> 

            <div class="bs-example">         

                <!-- Modal HTML -->
                <div id="myModal<%=serial%>" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title">Editar activo</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container">

                                    <div class="form-horizontal" >
                                        <div class="form-group">
                                            <label class="control-label col-sm-2" for="serial">Serial</label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" id="serial"  value="<%=serial%>" name="serial" disabled>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2" for="nombre">Nombre</label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" id="nombre<%=serial%>"  value="<%=m.getString("Nombre")%>" name="nombre" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2" for="descripcion">Descripcion</label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" id="descripcion<%=serial%>" value="<%=m.getString("Descripcion")%>" name="descripcion" required>
                                            </div>
                                        </div> 
                                        <div class="form-group">
                                            <label class="control-label col-sm-2" for="tipo">Tipo</label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" id="tipo<%=serial%>" value="<%=m.getString("Tipo")%>" name="tipo" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2" for="n_interno">Número interno</label>
                                            <div class="col-sm-4">
                                                <input type="number" class="form-control" id="n_interno<%=serial%>" value="<%=m.getString("N_interno")%>" name="n_interno" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2" for="peso">Peso</label>
                                            <div class="col-sm-4">
                                                <input type="number" class="form-control" id="peso<%=serial%>" value="<%=m.getString("Peso")%>" name="peso" required>
                                            </div>
                                        </div>                
                                        <div class="form-group">
                                            <label class="control-label col-sm-2" for="alto">Alto</label>
                                            <div class="col-sm-4">
                                                <input type="number" class="form-control" id="alto<%=serial%>" value="<%=m.getString("Alto")%>" name="alto" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2" for="ancho">Ancho</label>
                                            <div class="col-sm-4">
                                                <input type="number" class="form-control" id="ancho<%=serial%>" value="<%=m.getString("Ancho")%>" name="ancho" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2" for="largo">Largo</label>
                                            <div class="col-sm-4">
                                                <input type="number" class="form-control" id="largo<%=serial%>" value="<%=m.getString("Largo")%>" name="largo" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2" for="valor_compra">Valor de compra</label>
                                            <div class="col-sm-4">
                                                <input type="number" class="form-control" id="valor_compra<%=serial%>" value="<%=m.getString("Valor_compra")%>" name="valor_compra" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2" for="fecha_compra">Fecha de compra</label>
                                            <div class="col-sm-4">
                                                <input type="date" class="form-control" id="fecha_compra<%=serial%>" value="<%=m.getString("Fecha_compra")%>" name="fecha_compra" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2" for="fecha_baja">Fecha de baja</label>
                                            <div class="col-sm-4">
                                                <input type="date" class="form-control" id="fecha_baja<%=serial%>" value="<%=m.getString("Fecha_baja")%>" name="fecha_baja" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2" for="estado">Estado actual</label>
                                            <div class="col-sm-4">
                                                <select  id="estado<%=serial%>" >                           
                                                    <option value="activo"  <%
                                                        if (estado.equals("activo")) {
                                                            %>selected<%
                                                                }
                                                            %>>Activo</option>
                                                    <option value="dado_baja" <%
                                                        if (estado.equals("dado_baja")) {
                                                            %>selected<%
                                                                }
                                                            %>>Dado de baja</option>
                                                    <option value="reparacion" <%
                                                        if (estado.equals("reparacion")) {
                                                            %>selected<%
                                                                }
                                                            %>>En reparación</option>
                                                    <option value="disponible" <%
                                                        if (estado.equals("disponible")) {
                                                            %>selected<%
                                                                }
                                                            %>>Disponible</option>
                                                    <option value="asignado" <%
                                                        if (estado.equals("asignado")) {
                                                            %>selected<%
                                                                }
                                                            %>>Asignado</option>
                                                </select>                     
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2" for="color">Color</label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" id="color<%=serial%>" value="<%=m.getString("Color")%>" name="color" required>
                                            </div>
                                        </div>                
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                <button type="button" class="btn btn-primary" id="guardar<%=serial%>">Guardar</button>
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

    <script>
        (function () {

        var appm = {
        _url: "Peticiones.jsp",
                init: function () {
        <%
                         ResultSet m1 = af.BuscarActivos();
                         while (m1.next()) {
                             serial = m1.getString("Serial");

        %>
                $('#guardar<%=serial%>').off('click').on('click', function () {
                if (appm.validarCampos<%=serial%>()) {
                appm.guardar<%=serial%>();
                }
                });
        <%}%>

                }, // finaliza init
        <%
                    ResultSet m2 = af.BuscarActivos();
                    while (m2.next()) {
                        serial = m2.getString("Serial");

        %>
        validarCampos<%=serial%>: function () {
        var n_interno<%=serial%> = $('#n_interno<%=serial%>').val();
        if (n_interno<%=serial%> < 1) {
        alert("El número interno interno debe ser un número positivo mayor que cero");
        return false;
        }

        var peso<%=serial%> = $('#peso<%=serial%>').val();
        if (peso<%=serial%> < 1) {
        alert("El peso debe ser un número positivo mayor que cero");
        return false;
        }
        var alto<%=serial%> = $('#alto<%=serial%>').val();
        if (alto<%=serial%> < 1) {
        alert("El alto debe ser un número positivo mayor que cero");
        return false;
        }
        var ancho<%=serial%> = $('#ancho<%=serial%>').val();
        if (ancho<%=serial%> < 1) {
        alert("El ancho debe ser un número positivo mayor que cero");
        return false;
        }
        var largo<%=serial%> = $('#largo<%=serial%>').val();
        if (largo<%=serial%> < 1) {
        alert("El largo debe ser un número positivo mayor que cero");
        return false;
        }
        var valor_compra<%=serial%> = $('#valor_compra<%=serial%>').val();
        if (valor_compra<%=serial%> < 1) {
        alert("El valor de la compra debe ser un número positivo mayor que cero");
        return false;
        }

        var fecha_baja<%=serial%> = $('#fecha_baja<%=serial%>').val();
        var fecha_compra<%=serial%> = $('#fecha_compra<%=serial%>').val();
        if (fecha_compra<%=serial%> === "") {
        alert("La fecha de compra debe tener un valor");
        return false;
        }

        if (fecha_baja<%=serial%> === "") {
        alert("La fecha de baja debe tener un valor");
        return false;
        }

        if (fecha_baja<%=serial%> < fecha_compra<%=serial%>) {
        alert("La fecha de baja no puede ser mayor que la de compra");
        return false;
        }
        
        <%  ResultSet r = af.BuscarActivos();
             while (r.next()) {
             String N_internobd = r.getString("N_interno"); %>
             var  N_internobd = '<%=N_internobd%>';
             var n_interno<%=serial%> = $('#n_interno<%=serial%>').val();
             if(n_interno<%=serial%> === N_internobd){
                  alert("El número interno que desea asignar ya existe");
                  return false;
             }
    
        <%  }%>    


        return true;
        },          // finaliza validar
        
        
                guardar<%=serial%>: function () {

                var estado<%=serial%> = $("#estado<%=serial%>").val();
                var nombre<%=serial%> = $('#nombre<%=serial%>').val();
                var descripcion<%=serial%> = $('#descripcion<%=serial%>').val();
                var tipo<%=serial%> = $('#tipo<%=serial%>').val();
                var n_interno<%=serial%> = $('#n_interno<%=serial%>').val();
                var peso<%=serial%> = $('#peso<%=serial%>').val();
                var alto<%=serial%> = $('#alto<%=serial%>').val();
                var ancho<%=serial%> = $('#ancho<%=serial%>').val();
                var largo<%=serial%> = $('#largo<%=serial%>').val();
                var valor_compra<%=serial%> = $('#valor_compra<%=serial%>').val();
                var fecha_compra<%=serial%> = $('#fecha_compra<%=serial%>').val();
                var fecha_baja<%=serial%> = $('#fecha_baja<%=serial%>').val();
                var color<%=serial%> = $('#color<%=serial%>').val();
                $.ajax({
                url: appm._url,
                        type: 'POST',
                        data: {
                                Serial: <%=serial%>,
                                Nombre: nombre<%=serial%>,
                                Descripcion: descripcion<%=serial%>,
                                Tipo: tipo<%=serial%>,
                                N_interno: n_interno<%=serial%>,
                                Peso: peso<%=serial%>,
                                Alto: alto<%=serial%>,
                                Ancho: ancho<%=serial%>,
                                Largo: largo<%=serial%>,
                                Valor_compra: valor_compra<%=serial%>,
                                Fecha_compra: fecha_compra<%=serial%>,
                                Fecha_baja: fecha_baja<%=serial%>,
                                Estado: estado<%=serial%>,
                                Color: color<%=serial%>,
                                proceso: "EditarActivos"
                        },
                        success: function (data) {
                        if (data.ok === true) {
                        if (data.EditarActivo === true) {
                        alert("El activo se ha modificado");
                        self.location.reload();
                        } else {
                        alert("El activo no se ha modificado");
                        }
                        } else {
                        alert("Error");
                        }
                        }
                });
                },
        <% } %>

        }; //finaliza var app

        $(document).ready(appm.init);
        })();

    </script>

</body>
</html>
