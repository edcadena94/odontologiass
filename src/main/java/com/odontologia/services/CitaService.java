package com.odontologia.services;

import com.odontologia.models.Cita;
import java.util.List;

public interface CitaService {
    // Método para agendar una nueva cita
    boolean agendarCita(Cita cita);

    // Listar citas por doctor
    List<Cita> listarCitasPorDoctor(int idDoctor);

    // Listar citas por paciente
    List<Cita> listarCitasPorPaciente(int idPaciente);

    // Métodos adicionales útiles
    List<Cita> listarTodasLasCitas();
    boolean cancelarCita(int idCita);
    boolean actualizarEstadoCita(int idCita, String nuevoEstado);
}