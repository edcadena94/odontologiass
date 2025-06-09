package com.odontologia.util;

import java.sql.Connection;
import java.sql.SQLException;

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
