package com.odontologia.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Utilidad para obtener una conexión a la base de datos MySQL.
 */
public class Conexion {

    private static String url = "jdbc:mysql://localhost:3306/clinica?serverTimezone=UTC";
    private static String username = "root";
    private static String password = "";

    /**
     * Obtiene una conexión activa a la base de datos.
     * @return Conexión JDBC activa.
     * @throws SQLException Si ocurre un error al conectar.
     */
    public static Connection getConnection() throws SQLException {
        try {
            // Carga explícitamente el driver de MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException("No se pudo cargar el driver de MySQL", e);
        }
        return DriverManager.getConnection(url, username, password);
    }
}