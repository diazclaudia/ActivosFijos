/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Consultas;

import BD.Conexion;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Lenovo
 */
public class Areas {
    
    private String IdArea;
    private String Nombre;
    private String Ciudad;
    private String Serial;

    public Areas(String IdArea, String Nombre, String Ciudad, String Serial) {
        this.IdArea = IdArea;
        this.Nombre = Nombre;
        this.Ciudad = Ciudad;
        this.Serial = Serial;
    }
    
    public Areas() {
       
    }

    public String getIdArea() {
        return IdArea;
    }

    public String getNombre() {
        return Nombre;
    }

    public String getCiudad() {
        return Ciudad;
    }

    public String getSerial() {
        return Serial;
    }

    public void setIdArea(String IdArea) {
        this.IdArea = IdArea;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public void setCiudad(String Ciudad) {
        this.Ciudad = Ciudad;
    }

    public void setSerial(String Serial) {
        this.Serial = Serial;
    }
    
   public ResultSet BuscarAreas() throws SQLException {

        Conexion bd = new Conexion();
        String sentencia = "select * from areas  ";
        ResultSet consultar = bd.consultarBD(sentencia);
        bd.cerrarConexion();
        return consultar;
    }
   
     
    
}
