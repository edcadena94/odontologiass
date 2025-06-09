package com.odontologia.services;

import com.odontologia.models.Paciente;
import com.odontologia.repositories.PacienteRepository;
import java.sql.Connection;
import java.util.List;

public class PacienteServiceJdbcImplement implements PacienteService {
    private final PacienteRepository pacienteRepository;

    public PacienteServiceJdbcImplement(Connection conn) {
        this.pacienteRepository = new PacienteRepository(conn);
    }

    @Override
    public boolean guardar(Paciente paciente) {
        // Validaciones de negocio
        if (paciente == null || paciente.getNombre() == null || paciente.getNombre().trim().isEmpty()) {
            return false;
        }

        if (paciente.getApellido() == null || paciente.getApellido().trim().isEmpty()) {
            return false;
        }

        if (paciente.getFechaNacimiento() == null) {
            return false;
        }

        // Verificar si el email ya existe (solo si se proporciona email)
        if (paciente.getEmail() != null && !paciente.getEmail().trim().isEmpty()) {
            if (existeEmail(paciente.getEmail())) {
                return false; // Email ya existe
            }
        }

        return pacienteRepository.guardar(paciente);
    }

    @Override
    public boolean actualizar(Paciente paciente) {
        if (paciente == null || paciente.getIdPaciente() == null || paciente.getIdPaciente() <= 0) {
            return false;
        }

        if (paciente.getNombre() == null || paciente.getNombre().trim().isEmpty()) {
            return false;
        }

        if (paciente.getApellido() == null || paciente.getApellido().trim().isEmpty()) {
            return false;
        }

        return pacienteRepository.actualizar(paciente);
    }

    @Override
    public boolean eliminar(int idPaciente) {
        if (idPaciente <= 0) {
            return false;
        }
        return pacienteRepository.eliminar(idPaciente);
    }

    @Override
    public Paciente buscarPorId(int idPaciente) {
        if (idPaciente <= 0) {
            return null;
        }
        return pacienteRepository.buscarPorId(idPaciente);
    }

    @Override
    public List<Paciente> listarTodos() {
        return pacienteRepository.obtenerTodos();
    }

    @Override
    public List<Paciente> buscarPorNombre(String nombre) {
        if (nombre == null || nombre.trim().isEmpty()) {
            return List.of();
        }
        return pacienteRepository.buscarPorNombre(nombre.trim());
    }

    @Override
    public boolean existeEmail(String email) {
        if (email == null || email.trim().isEmpty()) {
            return false;
        }
        return pacienteRepository.existeEmail(email.trim());
    }

    @Override
    public List<Paciente> buscarPorTelefono(String telefono) {
        if (telefono == null || telefono.trim().isEmpty()) {
            return List.of();
        }
        return pacienteRepository.buscarPorTelefono(telefono.trim());
    }

    @Override
    public int contarPacientes() {
        try {
            return pacienteRepository.contar();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public List<Paciente> obtenerPacientesRecientes(int limite) {
        if (limite <= 0) {
            limite = 10; // Valor por defecto
        }
        return pacienteRepository.obtenerRecientes(limite);
    }
}