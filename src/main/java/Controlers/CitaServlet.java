package Controlers;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CitaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nombre = request.getParameter("nombre");
        String email = request.getParameter("email");
        String telefono = request.getParameter("telefono");
        String fecha = request.getParameter("fecha");

        // Aquí debes implementar la lógica de procesamiento de la cita
        // y guardar los datos en la base de datos o enviar un correo de confirmación

        // Redirige al usuario a una página de confirmación o de agradecimiento
        response.sendRedirect("cita-confirmada.jsp");
    }
}