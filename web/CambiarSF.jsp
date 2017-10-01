<%-- 
    Document   : CambiarSF
    Created on : 30/09/2017, 05:53:39 PM
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
            .bs-example2{
                margin: 20px;
            }
        </style>
       
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
                    String serials = "";
                    ActivosFijos af = new ActivosFijos();
                    ResultSet m = af.BuscarActivos();
                    while (m.next()) {
                        serials = m.getString("Serial");
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
                    <td><a href="#myModal_<%=serials%>" class="btn btn-primary btn-details" data-toggle="modal">Editar</a></td>                     
                </tr> 

            <div class="bs-example">         

                <!-- Modal HTML -->
                <div id="myModal_<%=serials%>" class="modal fade">
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
                                            <label class="control-label col-sm-2" for="serials">Serial</label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" id="serials"  value="<%=serials%>" name="serials" disabled>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2" for="nombre">Nombre</label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" id="nombre_<%=serials%>"  value="<%=m.getString("Nombre")%>" name="nombre" disabled>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2" for="descripcion">Descripcion</label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" id="descripcion_<%=serials%>" value="<%=m.getString("Descripcion")%>" name="descripcion" disabled>
                                            </div>
                                        </div> 
                                        <div class="form-group">
                                            <label class="control-label col-sm-2" for="tipo">Tipo</label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" id="tipo_<%=serials%>" value="<%=m.getString("Tipo")%>" name="tipo" disabled>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2" for="n_interno">Número interno</label>
                                            <div class="col-sm-4">
                                                <input type="number" class="form-control" id="n_interno_<%=serials%>" value="<%=m.getString("N_interno")%>" name="n_interno" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2" for="peso">Peso</label>
                                            <div class="col-sm-4">
                                                <input type="number" class="form-control" id="peso_<%=serials%>" value="<%=m.getString("Peso")%>" name="peso" disabled>
                                            </div>
                                        </div>                
                                        <div class="form-group">
                                            <label class="control-label col-sm-2" for="alto">Alto</label>
                                            <div class="col-sm-4">
                                                <input type="number" class="form-control" id="alto_<%=serials%>" value="<%=m.getString("Alto")%>" name="alto" disabled>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2" for="ancho">Ancho</label>
                                            <div class="col-sm-4">
                                                <input type="number" class="form-control" id="ancho_<%=serials%>" value="<%=m.getString("Ancho")%>" name="ancho" disabled>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2" for="largo">Largo</label>
                                            <div class="col-sm-4">
                                                <input type="number" class="form-control" id="largo_<%=serials%>" value="<%=m.getString("Largo")%>" name="largo" disabled>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2" for="valor_compra">Valor de compra</label>
                                            <div class="col-sm-4">
                                                <input type="number" class="form-control" id="valor_compra_<%=serials%>" value="<%=m.getString("Valor_compra")%>" name="valor_compra" disabled>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2" for="fecha_compra">Fecha de compra</label>
                                            <div class="col-sm-4">
                                                <input type="date" class="form-control" id="fecha_compra_<%=serials%>" value="<%=m.getString("Fecha_compra")%>" name="fecha_compra" disabled>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2" for="fecha_baja">Fecha de baja</label>
                                            <div class="col-sm-4">
                                                <input type="date" class="form-control" id="fecha_baja_<%=serials%>" value="<%=m.getString("Fecha_baja")%>" name="fecha_baja" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2" for="estado">Estado actual</label>
                                            <div class="col-sm-4">
                                                <select  id="estado_<%=serials%>" disabled>                           
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
                                                <input type="text" class="form-control" id="color_<%=serials%>" value="<%=m.getString("Color")%>" name="color" disabled>
                                            </div>
                                        </div>                
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                <button type="button" class="btn btn-primary" id="guardar_<%=serials%>">Guardar</button>
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

        var appl = {
        _url: "Peticiones.jsp",
                init: function () {
        <%
                         ResultSet m1 = af.BuscarActivos();
                         while (m1.next()) {
                             serials = m1.getString("Serial");

        %>
                $('#guardar_<%=serials%>').off('click').on('click', function () {
                if (appl.validarCampos_<%=serials%>()) {
                appl.guardar_<%=serials%>();
                }
                });
        <%}%>

                }, // finaliza init
        <%
                    ResultSet m2 = af.BuscarActivos();
                    while (m2.next()) {
                        serials = m2.getString("Serial");

        %>
        validarCampos_<%=serials%>: function () {
        
        var n_interno_<%=serials%> = $('#n_interno_<%=serials%>').val();
        if (n_interno_<%=serials%> < 1) {
        alert("400. El número interno interno debe ser un número positivo mayor que cero");
        return false;
        }

        
        var fecha_baja_<%=serials%> = $('#fecha_baja_<%=serials%>').val();
        var fecha_compra_<%=serials%> = $('#fecha_compra_<%=serials%>').val();
        if (fecha_compra_<%=serials%> === "") {
        alert("400. La fecha de compra debe tener un valor");
        return false;
        }

        if (fecha_baja_<%=serials%> === "") {
        alert("400. La fecha de baja debe tener un valor");
        return false;
        }

        if (fecha_baja_<%=serials%> < fecha_compra_<%=serials%>) {
        alert("400. La fecha de baja no puede ser mayor que la de compra");
        return false;
        }
        
          <%  ResultSet r = af.BuscarActivos();
             while (r.next()) {
             String N_internobd = r.getString("N_interno"); %>
             var  N_internobd = '<%=N_internobd%>';
             var n_interno<%=serials%> = $('#n_interno<%=serials%>').val();
             if(n_interno<%=serials%> === N_internobd){
                  alert("El número interno que desea asignar ya existe");
                  return false;
             }
    
        <%  }%>   


        return true;
        },          // finaliza validar
        
        
                guardar_<%=serials%>: function () {

                
                var n_interno_<%=serials%> = $('#n_interno_<%=serials%>').val();                
                var fecha_baja_<%=serials%> = $('#fecha_baja_<%=serials%>').val();
               
                $.ajax({
                url: appl._url,
                        type: 'POST',
                        data: {
                                Serial: <%=serials%>,                                
                                N_interno: n_interno_<%=serials%>,                               
                                Fecha_baja: fecha_baja_<%=serials%>,                                
                                proceso: "EditarSerialFecha"
                        },
                        success: function (data) {
                        if (data.ok === true) {
                        if (data.EditarSerialFecha === true) {
                        alert("200. El activo se ha modificado");
                        self.location.reload();
                        } else {
                        alert("500. El activo no se ha modificado");
                        }
                        } else {
                        alert("500. Error");
                        }
                        }
                });
                },
        <% } %>

        }; //finaliza var app

        $(document).ready(appl.init);
        })();

    </script>

</body>
</html>

