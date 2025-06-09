package com.odontologia.repositories;

import com.odontologia.models.Cita;
import java.sql.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

public class CitaRepository {
    private final Connection conn;

    public CitaRepository(Connection conn) {
        this.conn = conn;
    }

    // Método principal para agendar cita (tu lógica original)
    public boolean agendarCita(Cita cita) {
        String sql;

        if (cita.getId() == null || cita.getId() == 0) {
            // Insertar nueva cita
            sql = "INSERT INTO citas (id_paciente, id_doctor, fecha, hora, estado, motivo) VALUES (?, ?, ?, ?, ?, ?)";
        } else {
            // Actualizar cita existente
            sql = "UPDATE citas SET id_paciente = ?, id_doctor = ?, fecha = ?, hora = ?, estado = ?, motivo = ? WHERE id_cita = ?";
        }

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, cita.getIdPaciente());
            stmt.setInt(2, cita.getIdDoctor());
            stmt.setDate(3, Date.valueOf(cita.getFecha()));

            // Manejar hora (puede ser null)
            if (cita.getHora() != null) {
                stmt.setTime(4, Time.valueOf(cita.getHora()));
            } else {
                stmt.setTime(4, null);
            }

            stmt.setString(5, cita.getEstado() != null ? cita.getEstado() : "PROGRAMADA");
            stmt.setString(6, cita.getMotivo());

            if (cita.getId() != null && cita.getId() > 0) {
                stmt.setInt(7, cita.getId());
            }

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean actualizar(Cita cita) {
        // Simplemente llama a agendarCita que ya maneja insert/update
        return agendarCita(cita);
    }

    public boolean eliminar(int id) {
        String sql = "DELETE FROM citas WHERE id_cita = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Cita buscarPorId(int id) {
        String sql = "SELECT * FROM citas WHERE id_cita = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return mapearCita(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Buscar citas por doctor
    public List<Cita> buscarPorDoctor(int idDoctor) {
        List<Cita> citas = new ArrayList<>();
        String sql = "SELECT * FROM citas WHERE id_doctor = ? ORDER BY fecha, hora";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idDoctor);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                citas.add(mapearCita(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return citas;
    }

    // Buscar citas por paciente
    public List<Cita> buscarPorPaciente(int idPaciente) {
        List<Cita> citas = new ArrayList<>();
        String sql = "SELECT * FROM citas WHERE id_paciente = ? ORDER BY fecha, hora";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idPaciente);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                citas.add(mapearCita(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return citas;
    }

    // Obtener todas las citas
    public List<Cita> obtenerTodasLasCitas() {
        List<Cita> citas = new ArrayList<>();
        String sql = "SELECT * FROM citas ORDER BY fecha, hora";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                citas.add(mapearCita(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return citas;
    }

    // Actualizar estado de una cita
    public boolean actualizarEstado(int idCita, String nuevoEstado) {
        String sql = "UPDATE citas SET estado = ? WHERE id_cita = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, nuevoEstado);
            stmt.setInt(2, idCita);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Buscar por fecha
    public List<Cita> buscarPorFecha(LocalDate fecha) {
        List<Cita> citas = new ArrayList<>();
        String sql = "SELECT * FROM citas WHERE DATE(fecha) = ? ORDER BY hora";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setDate(1, Date.valueOf(fecha));
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                citas.add(mapearCita(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return citas;
    }

    // Buscar por estado
    public List<Cita> buscarPorEstado(String estado) {
        List<Cita> citas = new ArrayList<>();
        String sql = "SELECT * FROM citas WHERE estado = ? ORDER BY fecha, hora";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, estado);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                citas.add(mapearCita(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return citas;
    }

    // Verificar disponibilidad
    public boolean verificarDisponibilidad(int idDoctor, LocalDate fecha, LocalTime hora) {
        String sql = "SELECT COUNT(*) FROM citas WHERE id_doctor = ? AND fecha = ? AND hora = ? AND estado != 'CANCELADA'";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idDoctor);
            stmt.setDate(2, Date.valueOf(fecha));
            stmt.setTime(3, Time.valueOf(hora));

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) == 0; // True si no hay citas
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public int contar() {
        String sql = "SELECT COUNT(*) FROM citas";

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

    // Query con JOIN para obtener nombres (opcional)
    public List<Cita> listarConNombres() {
        List<Cita> citas = new ArrayList<>();
        String sql = """
            SELECT c.*, 
                   p.nombre as nombre_paciente, p.apellido as apellido_paciente,
                   d.nombre as nombre_doctor, d.apellido as apellido_doctor, d.especialidad
            FROM citas c 
            LEFT JOIN pacientes p ON c.id_paciente = p.id_paciente 
            LEFT JOIN doctores d ON c.id_doctor = d.id_doctor 
            ORDER BY c.fecha, c.hora
            """;

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Cita cita = mapearCita(rs);

                // Agregar nombres si están disponibles
                cita.setNombrePaciente(rs.getString("nombre_paciente"));
                cita.setApellidoPaciente(rs.getString("apellido_paciente"));
                cita.setNombreDoctor(rs.getString("nombre_doctor"));
                cita.setApellidoDoctor(rs.getString("apellido_doctor"));
                cita.setEspecialidadDoctor(rs.getString("especialidad"));

                citas.add(cita);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return citas;
    }

    // Método helper para mapear ResultSet a objeto Cita
    private Cita mapearCita(ResultSet rs) throws SQLException {
        Cita cita = new Cita();

        cita.setId(rs.getInt("id_cita"));
        cita.setIdPaciente(rs.getInt("id_paciente"));
        cita.setIdDoctor(rs.getInt("id_doctor"));
        cita.setFecha(rs.getDate("fecha").toLocalDate());
        cita.setEstado(rs.getString("estado"));
        cita.setMotivo(rs.getString("motivo"));

        // Manejar hora (puede ser null en BD)
        Time hora = rs.getTime("hora");
        if (hora != null) {
            cita.setHora(hora.toLocalTime());
        }

        return cita;
    }
}