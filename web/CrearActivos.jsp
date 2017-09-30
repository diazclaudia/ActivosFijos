<%-- 
    Document   : CrearActivos
    Created on : 30/09/2017, 11:34:12 AM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
         <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
         <script src="//code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    </head>
    <body>
        <div class="container">

            <div class="form-horizontal" >
                <div class="form-group">
                    <label class="control-label col-sm-2" for="nombre">Nombre</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="nombre" placeholder="Escriba el nombre" name="nombre" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="descripcion">Descripcion</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="descripcion" placeholder="Escriba la descripcion" name="descripcion" required>
                    </div>
                </div> 
                <div class="form-group">
                    <label class="control-label col-sm-2" for="tipo">Tipo</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="tipo" placeholder="Escriba el tipo" name="tipo" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="n_interno">Número interno</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="n_interno" placeholder="Escriba el número interno" name="n_interno" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="peso">Peso</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="peso" placeholder="Escriba el peso" name="peso" required>
                    </div>
                </div>                
                <div class="form-group">
                    <label class="control-label col-sm-2" for="alto">Alto</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="alto" placeholder="Escriba el alto" name="alto" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="ancho">Ancho</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="ancho" placeholder="Escriba el ancho" name="ancho" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="largo">Largo</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="largo" placeholder="Escriba el largo" name="largo" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="valor_compra">Valor de compra</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="valor_compra" placeholder="Escriba el valor de compra" name="valor_compra" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="fecha_compra">Fecha de compra</label>
                    <div class="col-sm-10">
                        <input type="date" class="form-control" id="fecha_compra"  name="fecha_compra" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="fecha_baja">Fecha de baja</label>
                    <div class="col-sm-10">
                        <input type="date" class="form-control" id="fecha_baja"  name="fecha_baja" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="estado">Estado actual</label>
                    <div class="col-sm-10">
                        <select  id="estado" >
                            <option value="activo">Activo</option>
                            <option value="dado de baja">Dado de baja</option>
                            <option value="en reparación">En reparación</option>
                            <option value="disponible">Disponible</option>
                            <option value="asignado">Asignado</option>
                        </select>                     
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="color">Color</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="color" placeholder="Escriba el color" name="color" required>
                    </div>
                </div>
                <div class="form-group">        
                    <div class="col-sm-offset-2 col-sm-10">
                        <button class="btn btn-default" id="guardar">Guardar</button>
                    </div>
                </div>
            </div>
        </div>



        <script>
            (function () {

                var app = {
                    _url: "Peticiones.jsp",
                    init: function () {
                        
                                
                            $('#guardar').off('click').on('click', function () {
                                if (app.validarCampos()) {
                                    app.guardar();
                                }
                        });


                    }, // finaliza init
                    validarCampos: function () {
                        var n_interno = $('#n_interno').val();
                        if (n_interno < 1) {
                            alert("El número interno interno debe ser un número positivo mayor que cero");
                            return false;
                        }
                        
                        var peso = $('#peso').val();
                        if (peso < 1) {
                            alert("El peso debe ser un número positivo mayor que cero");
                            return false;
                        }
                        var alto = $('#alto').val();
                        if (alto < 1) {
                            alert("El alto debe ser un número positivo mayor que cero");
                            return false;
                        }
                        var ancho = $('#ancho').val();
                        if (ancho < 1) {
                            alert("El ancho debe ser un número positivo mayor que cero");
                            return false;
                        }
                        var largo = $('#largo').val();
                        if (largo < 1) {
                            alert("El largo debe ser un número positivo mayor que cero");
                            return false;
                        }
                        var valor_compra = $('#valor_compra').val();
                        if (valor_compra < 1) {
                            alert("El valor de la compra debe ser un número positivo mayor que cero");
                            return false;
                        }                        
                        
                        var fecha_baja = $('#fecha_baja').val();
                        var fecha_compra = $('#fecha_compra').val();
                        
                        if (fecha_compra === "") {
                            alert("La fecha de compra debe tener un valor");
                            return false;
                        }
                        
                        if (fecha_baja === "") {
                            alert("La fecha de baja debe tener un valor");
                            return false;
                        }
                        
                        if (fecha_baja < fecha_compra) {
                            alert("La fecha de baja no puede ser mayor que la de compra");
                            return false;
                        }


                        return true;
                    }, // finaliza validar
                    guardar: function () {

                      
                        var estado = $('#estado').val();  
                        var nombre = $('#nombre').val();
                        var descripcion = $('#descripcion').val();
                        var tipo = $('#tipo').val();
                        var n_interno = $('#n_interno').val();
                        var peso = $('#peso').val();
                        var alto = $('#alto').val();
                        var ancho = $('#ancho').val();
                        var largo = $('#largo').val();
                        var valor_compra = $('#valor_compra').val();
                        var fecha_compra = $('#fecha_compra').val();
                        var fecha_baja = $('#fecha_baja').val();                       
                        var color = $('#color').val();

                        $.ajax({
                            url: app._url,
                            type: 'POST',
                            data: {
                                Nombre: nombre,
                                Descripcion: descripcion,
                                Tipo: tipo,
                                N_interno: n_interno,
                                Peso: peso,
                                Alto: alto,
                                Ancho: ancho,
                                Largo: largo,
                                Valor_compra: valor_compra,
                                Fecha_compra: fecha_compra,
                                Fecha_baja: fecha_baja,
                                Estado: estado,
                                Color: color,
                                proceso: "CrearActivos"
                            },
                            success: function (data) {
                                if (data.ok === true) {
                                    if (data.CrearActivos === true) {
                                        alert("El activo se ha creado");
                                    } else {
                                        alert("El activo no se ha creado");
                                    }
                                } else {
                                    alert("Error");
                                }
                            }
                        });
                    }


                }; //finaliza var app

                $(document).ready(app.init);
            })();

        </script>
    </body>
</html>
