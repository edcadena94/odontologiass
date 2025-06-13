package com.odontologia.util;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * Clase de utilidad para probar la conexión a la base de datos.
 * Ejecutar este main para verificar que la configuración de JDBC es correcta.
 */
public class TestConnection {
    // Para probar la conexión a la base de datos, ejecutar este código
    public static void main(String[] args) {
        try (Connection connection = Conexion.getConnection()) {
            System.out.println("¡Conexión exitosa!");
        } catch (SQLException e) {
            System.err.println("Error al conectar: " + e.getMessage());
        }
    }
}