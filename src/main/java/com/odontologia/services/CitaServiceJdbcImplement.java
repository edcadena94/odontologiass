package com.odontologia.services;

import com.odontologia.models.Cita;
import com.odontologia.repositories.CitaRepository;
import java.sql.Connection;
import java.util.List;

public class CitaServiceJdbcImplement implements CitaService {
    private final CitaRepository citaRepository;

    public CitaServiceJdbcImplement(Connection conn) {
        this.citaRepository = new CitaRepository(conn);
    }

    @Override
    public boolean agendarCita(Cita cita) {
        // Validaciones básicas antes de agendar
        if (cita == null || cita.getIdPaciente() <= 0 || cita.getIdDoctor() <= 0) {
            return false;
        }

        if (cita.getFecha() == null) {
            return false;
        }

        return citaRepository.agendarCita(cita);
    }

    @Override
    public List<Cita> listarCitasPorDoctor(int idDoctor) {
        return citaRepository.buscarPorDoctor(idDoctor);
    }

    @Override
    public List<Cita> listarCitasPorPaciente(int idPaciente) {
        return citaRepository.buscarPorPaciente(idPaciente);
    }

    // Métodos adicionales para completar la interfaz
    public List<Cita> listarTodasLasCitas() {
        return citaRepository.obtenerTodasLasCitas();
    }

    public boolean cancelarCita(int idCita) {
        return citaRepository.actualizarEstado(idCita, "CANCELADA");
    }

    public boolean actualizarEstadoCita(int idCita, String nuevoEstado) {
        return citaRepository.actualizarEstado(idCita, nuevoEstado);
    }
}