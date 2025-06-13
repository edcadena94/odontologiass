package com.odontologia.controllers;

import com.odontologia.models.Cita;
import com.odontologia.models.Paciente;
import com.odontologia.models.Doctor;
import com.odontologia.services.CitaService;
import com.odontologia.services.CitaServiceJdbcImplement;
import com.odontologia.repositories.PacienteRepository;
import com.odontologia.repositories.DoctorRepository;
import com.odontologia.util.Conexion;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import java.time.LocalDate;
import java.time.LocalTime;

@WebServlet("/cita")
public class CitaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try (Connection conn = Conexion.getConnection()) {
            // Crear instancias de los repositorios
            PacienteRepository pacienteRepository = new PacienteRepository(conn);
            DoctorRepository doctorRepo = new DoctorRepository(conn);

            // Obtener listas desde la base de datos
            List<Paciente> listaPacientes = pacienteRepository.obtenerTodos();
            List<Doctor> listaDoctores = doctorRepo.obtenerTodos();

            // Enviar atributos para que el JSP los use
            request.setAttribute("listaPacientes", listaPacientes);
            request.setAttribute("listaDoctores", listaDoctores);

            // Redirigir al JSP de agendar cita
            request.getRequestDispatcher("/agendar-cita.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error al cargar los datos: " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        try (Connection conn = Conexion.getConnection()) {
            // Obtener parámetros del formulario
            int idPaciente = Integer.parseInt(request.getParameter("idPaciente"));
            int idDoctor = Integer.parseInt(request.getParameter("idDoctor"));
            LocalDate fecha = LocalDate.parse(request.getParameter("fecha"));
            LocalTime hora = LocalTime.parse(request.getParameter("hora"));
            String motivo = request.getParameter("motivo");

            // Crear objeto Cita
            Cita cita = new Cita();
            cita.setIdPaciente(idPaciente);
            cita.setIdDoctor(idDoctor);
            cita.setFecha(fecha);
            cita.setHora(hora);
            cita.setMotivo(motivo);

            // Usar el servicio para guardar la cita
            CitaService citaService = new CitaServiceJdbcImplement(conn);
            boolean guardado = citaService.agendarCita(cita);

            if (guardado) {
                response.sendRedirect("cita?success=true");
            } else {
                response.sendRedirect("cita?error=true");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("cita?error=true");
        }
    }
}
