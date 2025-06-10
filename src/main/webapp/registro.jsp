<%--
  Created by IntelliJ IDEA.
  User: USUARIO
  Date: 9/6/2025
  Time: 20:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Smile Center - Registro</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="css/registro.css" />
</head>
<body>

<div class="registro-container">
    <div class="card-header text-center">
        <img src="img/logo.png" alt="Logo" class="logo" />
        <h3>Smile Center</h3>
    </div>
    <div class="card-body">
        <%-- Mensaje general de error del servidor --%>
        <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-danger mb-4" role="alert">
            <%= request.getAttribute("error") %>
        </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/registrar" method="post" class="needs-validation" novalidate>
            <div class="mb-3">
                <label for="username" class="form-label">Correo Electrónico</label>
                <input type="email"
                       class="form-control <% if (request.getAttribute("errorUsername") != null) out.print("is-invalid"); %>"
                       id="username"
                       name="username"
                       required
                       placeholder="ejemplo@correo.com"
                       autocomplete="email"
                       value="<%= request.getParameter("username") != null ? request.getParameter("username") : "" %>" />
                <div class="invalid-feedback">
                    <%
                        if (request.getAttribute("errorUsername") != null) {
                            out.print(request.getAttribute("errorUsername"));
                        } else { %>
                    Por favor ingresa un correo electrónico válido.
                    <% } %>
                </div>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Contraseña</label>
                <input type="password"
                       class="form-control <% if (request.getAttribute("errorPassword") != null) out.print("is-invalid"); %>"
                       id="password"
                       name="password"
                       required
                       placeholder="Crea una contraseña segura"
                       autocomplete="new-password" />
                <div class="invalid-feedback">
                    <%
                        if (request.getAttribute("errorPassword") != null) {
                            out.print(request.getAttribute("errorPassword"));
                        } else { %>
                    Por favor ingresa una contraseña.
                    <% } %>
                </div>
            </div>

            <div class="mb-3">
                <label for="rol" class="form-label">Rol</label>
                <select class="form-select <% if (request.getAttribute("errorRol") != null) out.print("is-invalid"); %>"
                        id="rol"
                        name="rol"
                        required>
                    <option value="" disabled <%= (request.getParameter("rol") == null) ? "selected" : "" %>>Selecciona un rol</option>
                    <option value="doctor" <%= "doctor".equals(request.getParameter("rol")) ? "selected" : "" %>>Doctor</option>
                    <option value="recepcionista" <%= "recepcionista".equals(request.getParameter("rol")) ? "selected" : "" %>>Recepcionista</option>
                </select>
                <div class="invalid-feedback">
                    <%
                        if (request.getAttribute("errorRol") != null) {
                            out.print(request.getAttribute("errorRol"));
                        } else { %>
                    Por favor selecciona un rol.
                    <% } %>
                </div>
            </div>

            <button type="submit" class="btn btn-primary w-100">Registrar</button>
        </form>

        <div class="text-center mt-3">
            <span>¿Ya tienes cuenta? <a href="login.jsp">Inicia sesión</a></span>
        </div>
    </div>

    <div class="footer-text text-center mt-4">
        <p>&copy; 2025 Smile Center. Todos los derechos reservados.</p>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    (() => {
        'use strict';
        const forms = document.querySelectorAll('.needs-validation');
        Array.from(forms).forEach(form => {
            form.addEventListener('submit', event => {
                if (!form.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
            }, false);
        });
    })();
</script>
</body>
</html>
