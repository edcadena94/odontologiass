package com.odontologia.services;

import com.odontologia.models.Doctor;
import java.util.List;

public interface DoctorService {
    // CRUD básico
    boolean guardar(Doctor doctor);
    boolean actualizar(Doctor doctor);
    boolean eliminar(int idDoctor);

    // Consultas
    Doctor buscarPorId(int idDoctor);
    List<Doctor> listarTodos();
    List<Doctor> buscarPorNombre(String nombre);
    List<Doctor> buscarPorEspecialidad(String especialidad);

    // Métodos adicionales
    boolean existeEmail(String email);
    List<String> listarEspecialidades();
    int contarDoctores();
    List<Doctor> obtenerDoctoresActivos();
}