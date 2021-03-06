/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Consultas;

import BD.Conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Lenovo
 */
public class ActivosFijos {

    private String Nombre;
    private String Descripcion;
    private String Tipo;
    private String Serial;
    private String N_interno;
    private String Peso;
    private String Alto;
    private String Ancho;
    private String Largo;
    private String Valor_compra;
    private String Fecha_compra;
    private String Fecha_baja;
    private String Estado_Actual;
    private String Color;

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public void setTipo(String Tipo) {
        this.Tipo = Tipo;
    }

    public void setSerial(String Serial) {
        this.Serial = Serial;
    }

    public void setN_interno(String N_interno) {
        this.N_interno = N_interno;
    }

    public void setPeso(String Peso) {
        this.Peso = Peso;
    }

    public void setAlto(String Alto) {
        this.Alto = Alto;
    }

    public void setAncho(String Ancho) {
        this.Ancho = Ancho;
    }

    public void setLargo(String Largo) {
        this.Largo = Largo;
    }

    public void setValor_compra(String Valor_compra) {
        this.Valor_compra = Valor_compra;
    }

    public void setFecha_compra(String Fecha_compra) {
        this.Fecha_compra = Fecha_compra;
    }

    public void setFecha_baja(String Fecha_baja) {
        this.Fecha_baja = Fecha_baja;
    }

    public void setEstado_Actual(String Estado_Actual) {
        this.Estado_Actual = Estado_Actual;
    }

    public void setColor(String Color) {
        this.Color = Color;
    }

    public String getNombre() {
        return Nombre;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public String getTipo() {
        return Tipo;
    }

    public String getSerial() {
        return Serial;
    }

    public String getN_interno() {
        return N_interno;
    }

    public String getPeso() {
        return Peso;
    }

    public String getAlto() {
        return Alto;
    }

    public String getAncho() {
        return Ancho;
    }

    public String getLargo() {
        return Largo;
    }

    public String getValor_compra() {
        return Valor_compra;
    }

    public String getFecha_compra() {
        return Fecha_compra;
    }

    public String getFecha_baja() {
        return Fecha_baja;
    }

    public String getEstado_Actual() {
        return Estado_Actual;
    }

    public String getColor() {
        return Color;
    }

    public ActivosFijos(String Nombre, String Descripcion, String Tipo, String Serial, String N_interno, String Peso, String Alto, String Ancho, String Largo, String Valor_compra, String Fecha_compra, String Fecha_baja, String Estado_Actual, String Color) {
        this.Nombre = Nombre;
        this.Descripcion = Descripcion;
        this.Tipo = Tipo;
        this.Serial = Serial;
        this.N_interno = N_interno;
        this.Peso = Peso;
        this.Alto = Alto;
        this.Ancho = Ancho;
        this.Largo = Largo;
        this.Valor_compra = Valor_compra;
        this.Fecha_compra = Fecha_compra;
        this.Fecha_baja = Fecha_baja;
        this.Estado_Actual = Estado_Actual;
        this.Color = Color;
    }

    public ActivosFijos() {

    }

    public boolean crearActivo() {
        Conexion c = new Conexion();
        String sentencia = "insert into activosfijos (Nombre,Descripcion,Tipo,N_interno,Peso,Alto,Ancho,Largo,Valor_compra,Fecha_compra,"
                + "Fecha_baja,Estado_Actual,Color) "
                + "Values('" + this.Nombre + "','" + this.Descripcion + "','" + this.Tipo + "','" + this.N_interno + "','"
                + "" + this.Peso + "','" + this.Alto + "','" + this.Ancho + "','" + this.Largo + "','" + this.Valor_compra + "','" + this.Fecha_compra + "','"
                + "" + this.Fecha_baja + "','" + this.Estado_Actual + "','" + this.Color + "' )";
        boolean exito = c.insertarBD(sentencia);
        c.cerrarConexion();
        return exito;
    }

    public ResultSet BuscarActivos() throws SQLException {

        Conexion bd = new Conexion();
        String sentencia = "select * from activosfijos  ";
        ResultSet consultar = bd.consultarBD(sentencia);
        bd.cerrarConexion();
        return consultar;
    }

    public ResultSet BuscarActivosSerial(String Serial) throws SQLException {

        Conexion bd = new Conexion();
        String sentencia = "select * from activosfijos where Serial= '" + Serial + "'";
        ResultSet consultar = bd.consultarBD(sentencia);
        bd.cerrarConexion();
        return consultar;
    }

    public boolean EditarActivo() throws SQLException {
        Conexion bd = new Conexion();
        String sentencia = "Update activosfijos set  "
                + " Nombre='" + this.Nombre + "',"
                + " Descripcion='" + this.Descripcion + "',"
                + " Tipo='" + this.Tipo + "',"
                + " N_interno='" + this.N_interno + "',"
                + " Peso='" + this.Peso + "',"
                + " Alto='" + this.Alto + "',"
                + " Ancho='" + this.Ancho + "',"
                + " Largo='" + this.Largo + "',"
                + " Valor_compra='" + this.Valor_compra + "',"
                + " Fecha_compra='" + this.Fecha_compra + "',"
                + " Fecha_baja='" + this.Fecha_baja + "',"
                + " Estado_Actual='" + this.Estado_Actual + "',"
                + " Color='" + this.Color + "' "
                + " where Serial='" + this.Serial + "'";

        if (bd.actualizarBD(sentencia)) {
            bd.cerrarConexion();
            return true;
        } else {
            bd.cerrarConexion();
            return false;
        }

    }

    public boolean EditarSerialFecha() throws SQLException {
        Conexion bd = new Conexion();
        String sentencia = "Update activosfijos set  "
                + " N_interno='" + this.N_interno + "',"
                + " Fecha_baja='" + this.Fecha_baja + "' "
                + " where Serial='" + this.Serial + "'";

        if (bd.actualizarBD(sentencia)) {
            bd.cerrarConexion();
            return true;
        } else {
            bd.cerrarConexion();
            return false;
        }

    }

    public ResultSet AsignadoArea(String serial) throws SQLException {

        Conexion bd = new Conexion();
        String sentencia = "select * from areas where Serial= '" + serial + "'";
        ResultSet consultar = bd.consultarBD(sentencia);
        bd.cerrarConexion();
        return consultar;
    }

    public ResultSet AsignadoPersona(String serial) throws SQLException {

        Conexion bd = new Conexion();
        String sentencia = "select * from personas where Serial= '" + serial + "'";
        ResultSet consultar = bd.consultarBD(sentencia);
        bd.cerrarConexion();
        return consultar;
    }

}
