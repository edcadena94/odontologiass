package com.odontologia.services;

import com.odontologia.models.Paciente;
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

    // Métodos adicionales
    boolean existeEmail(String email);
    List<Paciente> buscarPorTelefono(String telefono);
    int contarPacientes();
    List<Paciente> obtenerPacientesRecientes(int limite);
}