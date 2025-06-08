package Controlers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import Model.Paciente;

@WebServlet("/PacienteServlet")
public class PacienteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirigir al formulario
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

            // Enviar el paciente a la vista
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