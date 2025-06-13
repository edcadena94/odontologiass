package com.odontologia.services;

import com.odontologia.models.Paciente;
import com.odontologia.repositories.PacienteRepository;
import com.odontologia.util.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PacienteServiceJdbcImplement implements PacienteRepository {
    @Override
    public void save(Paciente paciente) {
        String sql = "INSERT INTO Pacientes (nombre, apellido, fecha_nacimiento, sexo, direccion, telefono, email) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = Conexion.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, paciente.getNombre());
            statement.setString(2, paciente.getApellido());
            statement.setDate(3, new java.sql.Date(paciente.getFechaNacimiento().getTime()));
            statement.setString(4, String.valueOf(paciente.getSexo()));
            statement.setString(5, paciente.getDireccion());
            statement.setString(6, paciente.getTelefono());
            statement.setString(7, paciente.getEmail());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Paciente> findAll() {
        List<Paciente> pacientes = new ArrayList<>();
        String sql = "SELECT * FROM Pacientes";
        try (Connection connection = Conexion.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                Paciente paciente = new Paciente();
                paciente.setIdPaciente(resultSet.getInt("id_paciente"));
                paciente.setNombre(resultSet.getString("nombre"));
                paciente.setApellido(resultSet.getString("apellido"));
                paciente.setFechaNacimiento(resultSet.getDate("fecha_nacimiento"));
                paciente.setSexo(resultSet.getString("sexo").charAt(0));
                paciente.setDireccion(resultSet.getString("direccion"));
                paciente.setTelefono(resultSet.getString("telefono"));
                paciente.setEmail(resultSet.getString("email"));
                pacientes.add(paciente);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pacientes;
    }

    @Override
    public List<Paciente> obtenerTodos() {
        return List.of();
    }
}
