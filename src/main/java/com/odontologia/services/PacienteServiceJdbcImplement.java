package com.odontologia.services;

import com.odontologia.models.Paciente;
import com.odontologia.repositories.PacienteRepository;

import java.sql.Connection;
import java.util.Date;
import java.util.List;

/**
 * Implementación JDBC del servicio de pacientes.
 * Gestiona la lógica de negocio y delega la persistencia al repositorio PacienteRepository.
 */
public class PacienteServiceJdbcImplement implements PacienteService {

    private final PacienteRepository pacienteRepository;

    /**
     * Constructor que inicializa el repositorio con la conexión proporcionada.
     * @param conn Conexión JDBC activa.
     */
    public PacienteServiceJdbcImplement(Connection conn) {
        this.pacienteRepository = new PacienteRepository(conn);
    }

    /**
     * Guarda un nuevo paciente tras realizar validaciones básicas.
     * @param paciente Paciente a guardar.
     * @return true si la operación fue exitosa, false en caso contrario.
     */
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

    /**
     * Actualiza un paciente existente tras realizar validaciones.
     * @param paciente Paciente a actualizar.
     * @return true si la actualización fue exitosa, false en caso contrario.
     */
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

    /**
     * Elimina un paciente por su ID.
     * @param idPaciente ID del paciente a eliminar.
     * @return true si la eliminación fue exitosa, false en caso contrario.
     */
    @Override
    public boolean eliminar(int idPaciente) {
        if (idPaciente <= 0) {
            return false;
        }
        return pacienteRepository.eliminar(idPaciente);
    }

    /**
     * Busca un paciente por su ID.
     * @param idPaciente ID del paciente.
     * @return El paciente encontrado o null si no existe.
     */
    @Override
    public Paciente buscarPorId(int idPaciente) {
        if (idPaciente <= 0) {
            return null;
        }
        return pacienteRepository.buscarPorId(idPaciente);
    }

    /**
     * Lista todos los pacientes.
     * @return Lista de pacientes.
     */
    @Override
    public List<Paciente> listarTodos() {
        return pacienteRepository.obtenerTodos();
    }

    /**
     * Busca pacientes por nombre.
     * @param nombre Nombre o parte del nombre/apellido a buscar.
     * @return Lista de pacientes que coinciden con el nombre.
     */
    @Override
    public List<Paciente> buscarPorNombre(String nombre) {
        if (nombre == null || nombre.trim().isEmpty()) {
            return List.of();
        }
        return pacienteRepository.buscarPorNombre(nombre.trim());
    }

    /**
     * Busca pacientes por fecha de nacimiento.
     * @param fechaNacimiento Fecha de nacimiento.
     * @return Lista de pacientes nacidos en esa fecha.
     */
    @Override
    public List<Paciente> buscarPorFechaNacimiento(Date fechaNacimiento) {
        if (fechaNacimiento == null) {
            return List.of();
        }
        return pacienteRepository.buscarPorFechaNacimiento(fechaNacimiento);
    }

    /**
     * Busca pacientes por sexo.
     * @param sexo Sexo del paciente ('M' o 'F').
     * @return Lista de pacientes con ese sexo.
     */
    @Override
    public List<Paciente> buscarPorSexo(char sexo) {
        if (sexo != 'M' && sexo != 'F') {
            return List.of();
        }
        return pacienteRepository.buscarPorSexo(sexo);
    }

    /**
     * Verifica si existe un paciente con el email proporcionado.
     * @param email Email a verificar.
     * @return true si existe, false si no.
     */
    @Override
    public boolean existeEmail(String email) {
        if (email == null || email.trim().isEmpty()) {
            return false;
        }
        return pacienteRepository.existeEmail(email.trim());
    }

    /**
     * Cuenta el número total de pacientes.
     * @return Número de pacientes.
     */
    @Override
    public int contarPacientes() {
        return pacienteRepository.contar();
    }
}