package com.odontologia.controllers;

import com.odontologia.models.Paciente;
import com.odontologia.services.PacienteService;
import com.odontologia.services.PacienteServiceJdbcImplement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

@WebServlet("/pacientes")
public class PacienteServlet extends HttpServlet {
    private PacienteService pacienteService;

    @Override
    public void init() throws ServletException {
        pacienteService = new PacienteService(new PacienteServiceJdbcImplement());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");

        if("crear".equals(accion)) {
            // Validar campos obligatorios
            if (request.getParameter("nombre") == null || request.getParameter("nombre").trim().isEmpty() ||
                    request.getParameter("apellido") == null || request.getParameter("apellido").trim().isEmpty() ||
                    request.getParameter("fecha_nacimiento") == null || request.getParameter("fecha_nacimiento").trim().isEmpty() ||
                    request.getParameter("sexo") == null || request.getParameter("sexo").trim().isEmpty() ||
                    request.getParameter("direccion") == null || request.getParameter("direccion").trim().isEmpty() ||
                    request.getParameter("telefono") == null || request.getParameter("telefono").trim().isEmpty() ||
                    request.getParameter("email") == null || request.getParameter("email").trim().isEmpty()) {

                response.sendRedirect("registrarPaciente.jsp?error=campos_vacios");
                return;
            }

            // Validar formato de teléfono
            String telefono = request.getParameter("telefono");
            if (!telefono.matches("^[\\d\\s+-]{8,15}$")) {
                response.sendRedirect("registrarPaciente.jsp?error=telefono_invalido");
                return;
            }

            // Validar formato de email
            String email = request.getParameter("email");
            if (!email.matches("^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$")) {
                response.sendRedirect("registrarPaciente.jsp?error=email_invalido");
                return;
            }

            Paciente paciente = new Paciente();
            paciente.setNombre(request.getParameter("nombre"));
            paciente.setApellido(request.getParameter("apellido"));

            try {
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                paciente.setFechaNacimiento(dateFormat.parse(request.getParameter("fecha_nacimiento")));
            } catch (Exception e) {
                response.sendRedirect("registrarPaciente.jsp?error=fecha_invalida");
                return;
            }

            paciente.setSexo(request.getParameter("sexo").charAt(0));
            paciente.setDireccion(request.getParameter("direccion"));
            paciente.setTelefono(telefono);
            paciente.setEmail(email);

            try {
                // Verificar si el email ya existe
                if (pacienteService.existeEmail(email)) {
                    response.sendRedirect("registrarPaciente.jsp?error=email_existe");
                    return;
                }

                // Guardar el paciente
                pacienteService.registrarPaciente(paciente);
                response.sendRedirect("registrarPaciente.jsp?status=guardado_exitoso");
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("registrarPaciente.jsp?error=no_guardado");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");

        if(accion == null) {
            // Listar pacientes por defecto
            List<Paciente> pacientes = pacienteService.listarPacientes();
            request.setAttribute("pacientes", pacientes);
            request.getRequestDispatcher("verPacientes.jsp").forward(request, response);
        } else if("nuevo".equals(accion)) {
            // Redirigir al formulario de registro
            response.sendRedirect("registrarPaciente.jsp");
        }
    }
}
