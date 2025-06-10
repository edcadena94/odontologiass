package com.odontologia.repositories;

import com.odontologia.models.Medicamentos;
import com.odontologia.util.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MedicamentosRepository implements InterfaceMedicamentosRepository {
    private Conexion connection;

    public MedicamentosRepository(Conexion connection) {
        this.connection = connection;
    }

    @Override
    public List<Medicamentos> listar() {
        // Implementación del listado de medicamentos
        return new ArrayList<>();
    }

    @Override
    public Medicamentos porId(Long id) {
        return null;  // Implementación del metodo porId si es necesario
    }

    @Override
    public void guardar(Medicamentos medicamento) {
        String sql = "INSERT INTO medicamentos (nombre, descripcion, stock) VALUES (?, ?, ?)";

        try (Connection conn = connection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // Establecemos los valores de los parámetros en la consulta
            stmt.setString(1, medicamento.getNombre());
            stmt.setString(2, medicamento.getDescripcion());
            stmt.setLong(3, medicamento.getStock());

            // Ejecutamos la consulta para insertar el medicamento
            stmt.executeUpdate();
            System.out.println("Medicamento guardado exitosamente.");
        } catch (SQLException e) {
            System.err.println("Error al guardar medicamento: " + e.getMessage());
        }
    }

    @Override
    public void eliminar(Long id) {
        // Implementación de la eliminación del medicamento si es necesario
    }
}
