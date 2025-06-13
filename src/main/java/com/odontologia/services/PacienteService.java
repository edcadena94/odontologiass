package com.odontologia.services;

import com.odontologia.models.Paciente;
import java.util.Date;
import java.util.List;

/**
 * Servicio para la gestión de pacientes.
 * Define las operaciones CRUD y consultas para la entidad Paciente.
 */
public interface PacienteService {
    // CRUD básico

    /**
     * Guarda un nuevo paciente en el sistema.
     * @param paciente Objeto Paciente a guardar.
     * @return true si la operación fue exitosa, false en caso contrario.
     */
    boolean guardar(Paciente paciente);

    /**
     * Actualiza un paciente existente.
     * @param paciente Objeto Paciente a actualizar.
     * @return true si la actualización fue exitosa, false en caso contrario.
     */
    boolean actualizar(Paciente paciente);

    /**
     * Elimina un paciente por su ID.
     * @param idPaciente ID del paciente a eliminar.
     * @return true si la eliminación fue exitosa, false en caso contrario.
     */
    boolean eliminar(int idPaciente);

    // Consultas

    /**
     * Busca un paciente por su ID.
     * @param idPaciente ID del paciente a buscar.
     * @return El paciente encontrado o null si no existe.
     */
    Paciente buscarPorId(int idPaciente);

    /**
     * Lista todos los pacientes del sistema.
     * @return Lista de pacientes.
     */
    List<Paciente> listarTodos();

    /**
     * Busca pacientes por nombre o apellido.
     * @param nombre Nombre o parte del nombre/apellido a buscar.
     * @return Lista de pacientes que coinciden con el nombre.
     */
    List<Paciente> buscarPorNombre(String nombre);

    /**
     * Busca pacientes por fecha de nacimiento exacta.
     * @param fechaNacimiento Fecha de nacimiento.
     * @return Lista de pacientes que nacieron en esa fecha.
     */
    List<Paciente> buscarPorFechaNacimiento(Date fechaNacimiento);

    /**
     * Busca pacientes por sexo.
     * @param sexo Sexo del paciente ('M', 'F', etc.).
     * @return Lista de pacientes con ese sexo.
     */
    List<Paciente> buscarPorSexo(char sexo);

    // Métodos adicionales

    /**
     * Verifica si existe un paciente con el email proporcionado.
     * @param email Email a verificar.
     * @return true si existe, false si no.
     */
    boolean existeEmail(String email);

    /**
     * Cuenta el número total de pacientes registrados.
     * @return Número de pacientes.
     */
    int contarPacientes();
}