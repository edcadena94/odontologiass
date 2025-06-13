package com.odontologia.services;

import com.odontologia.models.Paciente;
import com.odontologia.repositories.PacienteRepository;

import java.util.List;

public class PacienteService {
    private PacienteRepository repository;

    public PacienteService(PacienteRepository repository) {
        this.repository = repository;
    }

    public void registrarPaciente(Paciente paciente) {
        repository.save(paciente);
    }

    public List<Paciente> listarPacientes() {
        return repository.findAll();
    }

    public boolean existeEmail(String email) {
        return false;
    }
}
