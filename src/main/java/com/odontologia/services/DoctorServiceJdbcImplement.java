package com.odontologia.services;

import com.odontologia.models.Doctor;
import com.odontologia.repositories.DoctorRepository;
import java.sql.Connection;
import java.util.List;

public class DoctorServiceJdbcImplement implements DoctorService {
    private final DoctorRepository doctorRepository;

    public DoctorServiceJdbcImplement(Connection conn) {
        this.doctorRepository = new DoctorRepository(conn);
    }

    @Override
    public boolean guardar(Doctor doctor) {
        // Validaciones de negocio
        if (doctor == null || doctor.getNombre() == null || doctor.getNombre().trim().isEmpty()) {
            return false;
        }

        if (doctor.getApellido() == null || doctor.getApellido().trim().isEmpty()) {
            return false;
        }

        if (doctor.getEspecialidad() == null || doctor.getEspecialidad().trim().isEmpty()) {
            return false;
        }

        // Verificar si el email ya existe (solo si se proporciona email)
        if (doctor.getEmail() != null && !doctor.getEmail().trim().isEmpty()) {
            if (existeEmail(doctor.getEmail())) {
                return false; // Email ya existe
            }
        }

        return doctorRepository.guardar(doctor);
    }

    @Override
    public boolean actualizar(Doctor doctor) {
        if (doctor == null || doctor.getIdDoctor() == null || doctor.getIdDoctor() <= 0) {
            return false;
        }

        if (doctor.getNombre() == null || doctor.getNombre().trim().isEmpty()) {
            return false;
        }

        if (doctor.getApellido() == null || doctor.getApellido().trim().isEmpty()) {
            return false;
        }

        if (doctor.getEspecialidad() == null || doctor.getEspecialidad().trim().isEmpty()) {
            return false;
        }

        return doctorRepository.actualizar(doctor);
    }

    @Override
    public boolean eliminar(int idDoctor) {
        if (idDoctor <= 0) {
            return false;
        }
        return doctorRepository.eliminar(idDoctor);
    }

    @Override
    public Doctor buscarPorId(int idDoctor) {
        if (idDoctor <= 0) {
            return null;
        }
        return doctorRepository.buscarPorId(idDoctor);
    }

    @Override
    public List<Doctor> listarTodos() {
        return doctorRepository.obtenerTodos();
    }

    @Override
    public List<Doctor> buscarPorNombre(String nombre) {
        if (nombre == null || nombre.trim().isEmpty()) {
            return List.of();
        }
        return doctorRepository.buscarPorNombre(nombre.trim());
    }

    @Override
    public List<Doctor> buscarPorEspecialidad(String especialidad) {
        if (especialidad == null || especialidad.trim().isEmpty()) {
            return List.of();
        }
        return doctorRepository.buscarPorEspecialidad(especialidad.trim());
    }

    @Override
    public boolean existeEmail(String email) {
        if (email == null || email.trim().isEmpty()) {
            return false;
        }
        return doctorRepository.existeEmail(email.trim());
    }

    @Override
    public List<String> listarEspecialidades() {
        return doctorRepository.listarEspecialidades();
    }

    @Override
    public int contarDoctores() {
        return doctorRepository.contar();
    }

    @Override
    public List<Doctor> obtenerDoctoresActivos() {
        // Por ahora devuelve todos, pero se puede personalizar
        return doctorRepository.obtenerTodos();
    }

}