package com.odontologia.repositories;

import com.odontologia.models.Doctor;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DoctorRepository {
    private final Connection conn;

    public DoctorRepository(Connection conn) {
        this.conn = conn;
    }

    // CRUD específico con boolean (tu lógica original)
    public boolean guardar(Doctor doctor) {
        String sql;

        if (doctor.getIdDoctor() == null || doctor.getIdDoctor() == 0) {
            // Insertar nuevo doctor
            sql = "INSERT INTO doctores (nombre, apellido, especialidad, telefono, email) VALUES (?, ?, ?, ?, ?)";
        } else {
            // Actualizar doctor existente
            sql = "UPDATE doctores SET nombre = ?, apellido = ?, especialidad = ?, telefono = ?, email = ? WHERE id_doctor = ?";
        }

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, doctor.getNombre());
            stmt.setString(2, doctor.getApellido());
            stmt.setString(3, doctor.getEspecialidad());
            stmt.setString(4, doctor.getTelefono());
            stmt.setString(5, doctor.getEmail());

            if (doctor.getIdDoctor() != null && doctor.getIdDoctor() > 0) {
                stmt.setInt(6, doctor.getIdDoctor());
            }

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean actualizar(Doctor doctor) {
        // Simplemente llama a guardar que ya maneja insert/update
        return guardar(doctor);
    }

    public boolean eliminar(int id) {
        String sql = "DELETE FROM doctores WHERE id_doctor = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Doctor buscarPorId(int id) {
        String sql = "SELECT * FROM doctores WHERE id_doctor = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return mapearDoctor(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Doctor> obtenerTodos() {
        List<Doctor> doctores = new ArrayList<>();
        String sql = "SELECT * FROM doctores ORDER BY nombre, apellido";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                doctores.add(mapearDoctor(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return doctores;
    }

    public List<Doctor> buscarPorNombre(String nombre) {
        List<Doctor> doctores = new ArrayList<>();
        String sql = "SELECT * FROM doctores WHERE nombre LIKE ? OR apellido LIKE ? ORDER BY nombre, apellido";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            String busqueda = "%" + nombre + "%";
            stmt.setString(1, busqueda);
            stmt.setString(2, busqueda);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                doctores.add(mapearDoctor(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return doctores;
    }

    public List<Doctor> buscarPorEspecialidad(String especialidad) {
        List<Doctor> doctores = new ArrayList<>();
        String sql = "SELECT * FROM doctores WHERE especialidad = ? ORDER BY nombre, apellido";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, especialidad);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                doctores.add(mapearDoctor(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return doctores;
    }

    public boolean existeEmail(String email) {
        String sql = "SELECT COUNT(*) FROM doctores WHERE email = ?";

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

    public List<String> listarEspecialidades() {
        List<String> especialidades = new ArrayList<>();
        String sql = "SELECT DISTINCT especialidad FROM doctores WHERE especialidad IS NOT NULL ORDER BY especialidad";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                especialidades.add(rs.getString("especialidad"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return especialidades;
    }

    public int contar() {
        String sql = "SELECT COUNT(*) FROM doctores";

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

    // Método helper para mapear ResultSet
    private Doctor mapearDoctor(ResultSet rs) throws SQLException {
        Doctor doctor = new Doctor();
        doctor.setIdDoctor(rs.getInt("id_doctor"));
        doctor.setNombre(rs.getString("nombre"));
        doctor.setApellido(rs.getString("apellido"));
        doctor.setEspecialidad(rs.getString("especialidad"));
        doctor.setTelefono(rs.getString("telefono"));
        doctor.setEmail(rs.getString("email"));
        return doctor;
    }
}