<%--
  Created by IntelliJ IDEA.
  User: USUARIO
  Date: 9/6/2025
  Time: 14:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Smile Center - Inicio de Sesión</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/login.css">
</head>
<body>

<div class="login-container">
    <div class="card-header text-center">
        <img src="img/logo.png" alt="Logo" class="logo">
        <h3>Smile Center</h3>
    </div>
    <div class="card-body">
        <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-danger mb-4" role="alert">
            <%= request.getAttribute("error") %>
        </div>
        <% } %>

        <form method="post" action="${pageContext.request.contextPath}/login">
            <div class="mb-4">
                <label for="username" class="form-label">Correo Electrónico</label>
                <input type="email"
                       class="form-control"
                       id="username"
                       name="username"
                       required
                       placeholder="dentistas@gmail.com"
                       autocomplete="email">
            </div>
            <div class="mb-4">
                <label for="password" class="form-label">Contraseña</label>
                <input type="password"
                       class="form-control"
                       id="password"
                       name="password"
                       required
                       placeholder="Ingrese su contraseña"
                       autocomplete="current-password">
            </div>
            <button type="submit" class="btn btn-primary btn-login w-100">
                Iniciar Sesión
            </button>
        </form>

        <!-- Enlace de registro -->
        <div class="text-center mt-3">
            <span>¿No tienes cuenta? <a href="registro.jsp">Regístrate aquí</a></span>
        </div>
    </div>

    <div class="footer-text text-center mt-4">
        <p>&copy; 2025 Smile Center. Todos los derechos reservados.</p>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
