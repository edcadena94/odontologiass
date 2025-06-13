package com.odontologia.controllers;

import com.odontologia.models.Paciente;
import com.odontologia.services.PacienteService;
import com.odontologia.services.PacienteServiceJdbcImplement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/pacientes")
public class PacienteServlet extends HttpServlet {

    private PacienteService pacienteService;

    @Override
    public void init() throws ServletException {
        // Obtener conexión desde contexto de la app (asegúrate que exista)
        Connection conn = (Connection) getServletContext().getAttribute("conexion");
        this.pacienteService = new PacienteServiceJdbcImplement(conn);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String accion = req.getParameter("accion");

        if (accion == null || accion.isEmpty()) {
            // Listar todos los pacientes
            List<Paciente> pacientes = pacienteService.listarTodos();
            req.setAttribute("pacientes", pacientes);
            req.getRequestDispatcher("/verPacientes.jsp").forward(req, resp);
            return;
        }

        switch (accion) {
            case "editar":
                editarPaciente(req, resp);
                break;
            case "eliminar":
                eliminarPaciente(req, resp);
                break;
            default:
                resp.sendRedirect("pacientes");
        }
    }

    private void editarPaciente(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            Paciente paciente = pacienteService.buscarPorId(id);
            req.setAttribute("paciente", paciente);
            req.getRequestDispatcher("/paciente/formulario.jsp").forward(req, resp);
        } catch (NumberFormatException e) {
            resp.sendRedirect("pacientes");
        }
    }

    private void eliminarPaciente(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            pacienteService.eliminar(id);
        } catch (NumberFormatException ignored) {
        }
        resp.sendRedirect("pacientes");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idParam = req.getParameter("id");
        String nombre = req.getParameter("nombre");
        String apellido = req.getParameter("apellido");
        String email = req.getParameter("email");
        String telefono = req.getParameter("telefono");
        String direccion = req.getParameter("direccion");
        String fechaNacStr = req.getParameter("fechaNacimiento");
        String sexo = req.getParameter("sexo");

        Paciente paciente = new Paciente();
        paciente.setNombre(nombre);
        paciente.setApellido(apellido);
        paciente.setEmail(email);
        paciente.setTelefono(telefono);
        paciente.setDireccion(direccion);
        paciente.setSexo(sexo != null && !sexo.isEmpty() ? sexo.charAt(0) : ' ');

        try {
            Date fechaNacimiento = new SimpleDateFormat("yyyy-MM-dd").parse(fechaNacStr);
            paciente.setFechaNacimiento(fechaNacimiento);
        } catch (Exception e) {
            req.setAttribute("error", "Fecha de nacimiento inválida");
            req.getRequestDispatcher("/paciente/formulario.jsp").forward(req, resp);
            return;
        }

        if (idParam != null && !idParam.isEmpty()) {
            try {
                int id = Integer.parseInt(idParam);
                paciente.setIdPaciente(id);
                pacienteService.actualizar(paciente);
            } catch (NumberFormatException e) {
                req.setAttribute("error", "ID inválido");
                req.getRequestDispatcher("/paciente/formulario.jsp").forward(req, resp);
                return;
            }
        } else {
            pacienteService.guardar(paciente);
        }

        resp.sendRedirect("pacientes");
    }
}
