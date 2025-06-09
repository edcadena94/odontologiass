package com.odontologia.repositories;

import com.odontologia.models.Paciente;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PacienteRepository {
    private final Connection conn;

    public PacienteRepository(Connection conn) {
        this.conn = conn;
    }

    // CRUD específico con boolean (tu lógica original)
    public boolean guardar(Paciente paciente) {
        String sql;

        if (paciente.getIdPaciente() == null || paciente.getIdPaciente() == 0) {
            // Insertar nuevo paciente
            sql = "INSERT INTO pacientes (nombre, apellido, fecha_nacimiento, telefono, email, direccion) VALUES (?, ?, ?, ?, ?, ?)";
        } else {
            // Actualizar paciente existente
            sql = "UPDATE pacientes SET nombre = ?, apellido = ?, fecha_nacimiento = ?, telefono = ?, email = ?, direccion = ? WHERE id_paciente = ?";
        }

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, paciente.getNombre());
            stmt.setString(2, paciente.getApellido());
            stmt.setDate(3, Date.valueOf(paciente.getFechaNacimiento()));
            stmt.setString(4, paciente.getTelefono());
            stmt.setString(5, paciente.getEmail());
            stmt.setString(6, paciente.getDireccion());

            if (paciente.getIdPaciente() != null && paciente.getIdPaciente() > 0) {
                stmt.setInt(7, paciente.getIdPaciente());
            }

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean actualizar(Paciente paciente) {
        // Simplemente llama a guardar que ya maneja insert/update
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

    public List<Paciente> buscarPorTelefono(String telefono) {
        List<Paciente> pacientes = new ArrayList<>();
        String sql = "SELECT * FROM pacientes WHERE telefono LIKE ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, "%" + telefono + "%");
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

    public List<Paciente> obtenerRecientes(int limite) {
        List<Paciente> pacientes = new ArrayList<>();
        String sql = "SELECT * FROM pacientes ORDER BY id_paciente DESC LIMIT ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, limite);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                pacientes.add(mapearPaciente(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pacientes;
    }

    // Método helper para mapear ResultSet
    private Paciente mapearPaciente(ResultSet rs) throws SQLException {
        Paciente paciente = new Paciente();
        paciente.setIdPaciente(rs.getInt("id_paciente"));
        paciente.setNombre(rs.getString("nombre"));
        paciente.setApellido(rs.getString("apellido"));
        paciente.setFechaNacimiento(rs.getDate("fecha_nacimiento").toLocalDate());
        paciente.setTelefono(rs.getString("telefono"));
        paciente.setEmail(rs.getString("email"));
        paciente.setDireccion(rs.getString("direccion"));
        return paciente;
    }

}
