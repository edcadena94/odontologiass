package com.odontologia.controllers;

import com.odontologia.util.Conexion;
import com.odontologia.util.PasswordUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/registrar")
public class RegistroServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rol = request.getParameter("rol");

        // Validar fortaleza de la contraseña
        if (!PasswordUtil.isPasswordStrong(password)) {
            request.setAttribute("error", "La contraseña debe tener al menos 8 caracteres, una mayúscula y un número");
            request.getRequestDispatcher("/registro.jsp").forward(request, response);
            return;
        }

        try (Connection conn = Conexion.getConnection()) {
            String sql = "INSERT INTO Usuarios (username, password_hash, rol) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, PasswordUtil.hashPassword(password)); // Encriptación segura
            stmt.setString(3, rol);
            stmt.executeUpdate();

            response.sendRedirect("login.jsp?registroExitoso=true");

        } catch (Exception e) {
            request.setAttribute("error", "Error al registrar: " + e.getMessage());
            request.getRequestDispatcher("/registro.jsp").forward(request, response);
        }
    }
}