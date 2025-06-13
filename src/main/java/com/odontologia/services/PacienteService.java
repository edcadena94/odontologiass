package com.odontologia.services;

import com.odontologia.models.Paciente;

import java.util.Date;
import java.util.List;

public interface PacienteService {
    // CRUD básico
    boolean guardar(Paciente paciente);
    boolean actualizar(Paciente paciente);
    boolean eliminar(int idPaciente);

    // Consultas
    Paciente buscarPorId(int idPaciente);
    List<Paciente> listarTodos();
    List<Paciente> buscarPorNombre(String nombre);
    List<Paciente> buscarPorFechaNacimiento(Date fechaNacimiento);
    List<Paciente> buscarPorSexo(char sexo);

    // Métodos adicionales
    boolean existeEmail(String email);
    int contarPacientes();
}
