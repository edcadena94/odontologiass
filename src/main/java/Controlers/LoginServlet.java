package Controlers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import Model.Usuario;
import Service.UsuarioService;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private final UsuarioService usuarioService = new UsuarioService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username == null || password == null || username.trim().isEmpty() || password.trim().isEmpty()) {
            mostrarError(request, response, "Por favor complete todos los campos");
            return;
        }

        Usuario usuario = usuarioService.autenticar(username.trim(), password.trim());
        if (usuario != null) {
            HttpSession session = request.getSession(true);
            session.setAttribute("usuario", username);
            session.setAttribute("rol", usuario.getRol());
            session.setMaxInactiveInterval(1800);

            Cookie sessionCookie = new Cookie("JSESSIONID", session.getId());
            sessionCookie.setHttpOnly(true);
            sessionCookie.setSecure(true);
            response.addCookie(sessionCookie);

            if ("DOCTOR".equals(usuario.getRol())) {
                response.sendRedirect("historia_clinica.jsp");
            } else {
                response.sendRedirect("agendar-cita.jsp");
            }
        } else {
            mostrarError(request, response, "Usuario o contraseña incorrectos");
        }
    }

    private void mostrarError(HttpServletRequest request,
                              HttpServletResponse response,
                              String mensaje) throws ServletException, IOException {
        request.setAttribute("error", mensaje);
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}