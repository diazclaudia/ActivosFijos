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
public class Personas {
    
    private String IdPersona;
    private String Nombre;
    private String Cedula;
    private String Serial;
    

    public Personas(String IdPersona, String Nombre, String Cedula, String Serial) {
        this.IdPersona = IdPersona;
        this.Nombre = Nombre;
        this.Cedula = Cedula;
        this.Serial = Serial;
    }
    
    public Personas() {
       
    }

    public String getIdPersona() {
        return IdPersona;
    }

    public String getNombre() {
        return Nombre;
    }

    public String getCedula() {
        return Cedula;
    }

    public String getSerial() {
        return Serial;
    }

    public void setIdPersona(String IdPersona) {
        this.IdPersona = IdPersona;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public void setCedula(String Cedula) {
        this.Cedula = Cedula;
    }

    public void setSerial(String Serial) {
        this.Serial = Serial;
    }
    
    public ResultSet BuscarPersonas() throws SQLException {

        Conexion bd = new Conexion();
        String sentencia = "select * from personas  ";
        ResultSet consultar = bd.consultarBD(sentencia);
        bd.cerrarConexion();
        return consultar;
    }
    
}
