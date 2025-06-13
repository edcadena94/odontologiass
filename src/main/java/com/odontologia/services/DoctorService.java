package com.odontologia.services;

import com.odontologia.models.Doctor;
import java.util.List;

/**
 * Servicio para la gestión de doctores.
 * Define las operaciones CRUD y consultas para la entidad Doctor.
 */
public interface DoctorService {
    // CRUD básico

    /**
     * Guarda un nuevo doctor en el sistema.
     * @param doctor Objeto Doctor a guardar.
     * @return true si la operación fue exitosa, false en caso contrario.
     */
    boolean guardar(Doctor doctor);

    /**
     * Actualiza un doctor existente.
     * @param doctor Objeto Doctor a actualizar.
     * @return true si la actualización fue exitosa, false en caso contrario.
     */
    boolean actualizar(Doctor doctor);

    /**
     * Elimina un doctor por su ID.
     * @param idDoctor ID del doctor a eliminar.
     * @return true si la eliminación fue exitosa, false en caso contrario.
     */
    boolean eliminar(int idDoctor);

    // Consultas

    /**
     * Busca un doctor por su ID.
     * @param idDoctor ID del doctor a buscar.
     * @return El doctor encontrado o null si no existe.
     */
    Doctor buscarPorId(int idDoctor);

    /**
     * Lista todos los doctores del sistema.
     * @return Lista de doctores.
     */
    List<Doctor> listarTodos();

    /**
     * Busca doctores por nombre o apellido.
     * @param nombre Nombre o parte del nombre/apellido a buscar.
     * @return Lista de doctores que coinciden con el nombre.
     */
    List<Doctor> buscarPorNombre(String nombre);

    /**
     * Busca doctores por especialidad.
     * @param especialidad Especialidad del doctor.
     * @return Lista de doctores con la especialidad dada.
     */
    List<Doctor> buscarPorEspecialidad(String especialidad);

    // Métodos adicionales

    /**
     * Verifica si ya existe un doctor con el email proporcionado.
     * @param email Email a verificar.
     * @return true si existe, false si no.
     */
    boolean existeEmail(String email);

    /**
     * Lista las especialidades de todos los doctores.
     * @return Lista de especialidades.
     */
    List<String> listarEspecialidades();

    /**
     * Cuenta el número total de doctores registrados.
     * @return Número de doctores.
     */
    int contarDoctores();

    /**
     * Obtiene la lista de doctores activos.
     * @return Lista de doctores activos.
     */
    List<Doctor> obtenerDoctoresActivos();
}