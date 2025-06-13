package com.odontologia.services;

import com.odontologia.models.Paciente;
import com.odontologia.repositories.PacienteRepository;

import java.sql.Connection;
import java.util.Date;
import java.util.List;

public class PacienteServiceJdbcImplement implements PacienteService {

    private final PacienteRepository pacienteRepository;

    public PacienteServiceJdbcImplement(Connection conn) {
        this.pacienteRepository = new PacienteRepository(conn);
    }

    @Override
    public boolean guardar(Paciente paciente) {
        if (paciente == null || paciente.getNombre() == null || paciente.getNombre().trim().isEmpty()) {
            return false;
        }
        if (paciente.getApellido() == null || paciente.getApellido().trim().isEmpty()) {
            return false;
        }
        if (paciente.getFechaNacimiento() == null) {
            return false;
        }

        if (paciente.getEmail() != null && !paciente.getEmail().trim().isEmpty()) {
            if (existeEmail(paciente.getEmail())) {
                return false;
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
        if (paciente.getFechaNacimiento() == null) {
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
    public List<Paciente> buscarPorFechaNacimiento(Date fechaNacimiento) {
        if (fechaNacimiento == null) {
            return List.of();
        }
        return pacienteRepository.buscarPorFechaNacimiento(fechaNacimiento);
    }

    @Override
    public List<Paciente> buscarPorSexo(char sexo) {
        if (sexo != 'M' && sexo != 'F') {
            return List.of();
        }
        return pacienteRepository.buscarPorSexo(sexo);
    }

    @Override
    public boolean existeEmail(String email) {
        if (email == null || email.trim().isEmpty()) {
            return false;
        }
        return pacienteRepository.existeEmail(email.trim());
    }

    @Override
    public int contarPacientes() {
        return pacienteRepository.contar();
    }
}
