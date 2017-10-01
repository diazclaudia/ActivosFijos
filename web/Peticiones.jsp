<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Consultas.ActivosFijos"%>
<%@page contentType="application/json;charset=iso-8859-1" language="java" pageEncoding="iso-8859-1" session="true"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonParser"%>




<%    // Iniciando respuesta JSON.
    String respuesta = "{";

    //Lista de procesos o tareas a realizar 
    List<String> tareas = Arrays.asList(new String[]{
        "BuscarTodosActivos",
        "CrearActivos",
        "EditarActivos"
    });

    String proceso = "" + request.getParameter("proceso");
    // Validación de parámetros utilizados en todos los procesos.
    if (tareas.contains(proceso)) {
        respuesta += "\"ok\": true";
        
        String Serial = "" + request.getParameter("Serial");
        String Nombre = "" + request.getParameter("Nombre");
        String Descripcion = "" + request.getParameter("Descripcion");
        String Tipo = "" + request.getParameter("Tipo");
        String N_interno = "" + request.getParameter("N_interno");
        String Peso = "" + request.getParameter("Peso");
        String Alto = "" + request.getParameter("Alto");
        String Ancho = "" + request.getParameter("Ancho");
        String Largo = "" + request.getParameter("Largo");
        String Valor_compra = "" + request.getParameter("Valor_compra");
        String Fecha_compra = "" + request.getParameter("Fecha_compra");
        String Fecha_baja = "" + request.getParameter("Fecha_baja");
        String Estado = "" + request.getParameter("Estado");
        String Color = "" + request.getParameter("Color");
        ActivosFijos af = new ActivosFijos();

        // ------------------------------------------------------------------------------------- //
        // -----------------------------------INICIO PROCESOS----------------------------------- //
        // ------------------------------------------------------------------------------------- //
        // ---------------------------------Proceso 1--------------------------------- //
        if (proceso.equals("CrearActivos")) {

            // Procesos para determinar respuestas...
            af.setNombre(Nombre);
            af.setDescripcion(Descripcion);
            af.setTipo(Tipo);
            af.setN_interno(N_interno);
            af.setPeso(Peso);
            af.setAlto(Alto);
            af.setAncho(Ancho);
            af.setLargo(Largo);
            af.setValor_compra(Valor_compra);
            af.setFecha_compra(Fecha_compra);
            af.setFecha_baja(Fecha_baja);
            af.setEstado_Actual(Estado);
            af.setColor(Color);

            // Adjuntar respuesta.
            if (af.crearActivo()) {
                respuesta += ",\"CrearActivos\":true";
            } else {
                respuesta += ",\"CrearActivos\":false";
            }

            // --------------------------------Proceso 2---------------------------------- //
        } else if (proceso.equals("EditarActivos")) {
            // Procesos para determinar respuestas...
            af.setSerial(Serial);
            af.setNombre(Nombre);
            af.setDescripcion(Descripcion);
            af.setTipo(Tipo);
            af.setN_interno(N_interno);
            af.setPeso(Peso);
            af.setAlto(Alto);
            af.setAncho(Ancho);
            af.setLargo(Largo);
            af.setValor_compra(Valor_compra);
            af.setFecha_compra(Fecha_compra);
            af.setFecha_baja(Fecha_baja);
            af.setEstado_Actual(Estado);
            af.setColor(Color);

            // Adjuntar respuesta.
            if (af.EditarActivo()) {
                respuesta += ",\"EditarActivo\":true";
            } else {
                respuesta += ",\"EditarActivo\":false";
            }

        }

        // ------------------------------------------------------------------------------------- //
        // -----------------------------------FIN PROCESOS-------------------------------------- //
        // ------------------------------------------------------------------------------------- //
        // Proceso desconocido.
    } else {
        respuesta += "\"ok\": false,";
        respuesta += "\"error\": \"INVALID\",";
        respuesta += "\"errorMsg\": \"Lo sentimos, los datos que ha enviado,"
                + " son inválidos. Corrijalos y vuelva a intentar por favor.\"";
    }

    // Responder como objeto JSON codificación ISO 8859-1.
    respuesta += "}";
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);
%>



