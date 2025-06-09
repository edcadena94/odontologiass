package com.odontologia.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import com.odontologia.models.Paciente;

@WebServlet("/historia_clinica")
public class HistoriaClinicaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirige al formulario
        RequestDispatcher dispatcher = request.getRequestDispatcher("historia_clinica.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        try {
            // Crear nuevo paciente
            Paciente paciente = new Paciente();

            // Datos básicos
            paciente.setNombre(request.getParameter("nombre"));
            paciente.setSexo(request.getParameter("sexo"));
            paciente.setFechaNacimiento(request.getParameter("fechaNacimiento"));
            paciente.setTelefono(request.getParameter("telefono"));
            paciente.setEmail(request.getParameter("email"));

            // Enviar datos a vista de confirmación
            request.setAttribute("paciente", paciente);
            request.setAttribute("mensaje", "Historia clínica guardada exitosamente");
            RequestDispatcher dispatcher = request.getRequestDispatcher("vista_paciente.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            request.setAttribute("error", "Error al procesar la historia clínica: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("historia_clinica.jsp");
            dispatcher.forward(request, response);
        }
    }
}
