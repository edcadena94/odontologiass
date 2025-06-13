package com.odontologia.repositories;

import com.odontologia.models.Paciente;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class PacienteRepository {
    private final Connection conn;

    public PacienteRepository(Connection conn) {
        this.conn = conn;
    }

    public boolean guardar(Paciente paciente) {
        String sql;

        if ((paciente.getIdPaciente() == null) || (paciente.getIdPaciente() == 0)) {
            sql = "INSERT INTO pacientes (nombre, apellido, fecha_nacimiento, sexo, direccion, telefono, email) VALUES (?, ?, ?, ?, ?, ?, ?)";
        } else {
            sql = "UPDATE pacientes SET nombre = ?, apellido = ?, fecha_nacimiento = ?, sexo = ?, direccion = ?, telefono = ?, email = ? WHERE id_paciente = ?";
        }

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, paciente.getNombre());
            stmt.setString(2, paciente.getApellido());
            stmt.setDate(3, new java.sql.Date(paciente.getFechaNacimiento().getTime()));
            stmt.setString(4, String.valueOf(paciente.getSexo()));
            stmt.setString(5, paciente.getDireccion());
            stmt.setString(6, paciente.getTelefono());
            stmt.setString(7, paciente.getEmail());

            if (paciente.getIdPaciente() != null && paciente.getIdPaciente() > 0) {
                stmt.setInt(8, paciente.getIdPaciente());
            }

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean actualizar(Paciente paciente) {
        return guardar(paciente);
    }

    public boolean eliminar(int id) {
        String sql = "DELETE FROM pacientes WHERE id_paciente = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Paciente buscarPorId(int id) {
        String sql = "SELECT * FROM pacientes WHERE id_paciente = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return mapearPaciente(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Paciente> obtenerTodos() {
        List<Paciente> pacientes = new ArrayList<>();
        String sql = "SELECT * FROM pacientes ORDER BY nombre, apellido";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                pacientes.add(mapearPaciente(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pacientes;
    }

    public List<Paciente> buscarPorNombre(String nombre) {
        List<Paciente> pacientes = new ArrayList<>();
        String sql = "SELECT * FROM pacientes WHERE nombre LIKE ? OR apellido LIKE ? ORDER BY nombre, apellido";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            String busqueda = "%" + nombre + "%";
            stmt.setString(1, busqueda);
            stmt.setString(2, busqueda);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                pacientes.add(mapearPaciente(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pacientes;
    }

    public List<Paciente> buscarPorFechaNacimiento(Date fecha) {
        List<Paciente> pacientes = new ArrayList<>();
        String sql = "SELECT * FROM pacientes WHERE fecha_nacimiento = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setDate(1, new java.sql.Date(fecha.getTime()));
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                pacientes.add(mapearPaciente(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pacientes;
    }

    public List<Paciente> buscarPorSexo(char sexo) {
        List<Paciente> pacientes = new ArrayList<>();
        String sql = "SELECT * FROM pacientes WHERE sexo = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, String.valueOf(sexo));
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                pacientes.add(mapearPaciente(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pacientes;
    }

    public boolean existeEmail(String email) {
        String sql = "SELECT COUNT(*) FROM pacientes WHERE email = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public int contar() {
        String sql = "SELECT COUNT(*) FROM pacientes";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    private Paciente mapearPaciente(ResultSet rs) throws SQLException {
        Paciente paciente = new Paciente();
        paciente.setIdPaciente(rs.getInt("id_paciente"));
        paciente.setNombre(rs.getString("nombre"));
        paciente.setApellido(rs.getString("apellido"));
        paciente.setFechaNacimiento(rs.getDate("fecha_nacimiento"));
        paciente.setSexo(rs.getString("sexo").charAt(0));
        paciente.setDireccion(rs.getString("direccion"));
        paciente.setTelefono(rs.getString("telefono"));
        paciente.setEmail(rs.getString("email"));
        return paciente;
    }
}
