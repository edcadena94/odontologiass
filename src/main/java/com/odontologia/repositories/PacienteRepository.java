package com.odontologia.repositories;

import com.odontologia.models.Paciente;
import java.util.List;

public interface PacienteRepository {
    void save(Paciente paciente);
    List<Paciente> findAll();

    List<Paciente> obtenerTodos();
}
