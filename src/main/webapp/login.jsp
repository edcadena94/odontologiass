<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Smile Center - Inicio de Sesión</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #e0f7fa 0%, #ffffff 100%);
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-container {
            width: 100%;
            max-width: 450px;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
        }

        .card-header {
            background: linear-gradient(135deg, #00796b 0%, #004d40 100%);
            color: white;
            text-align: center;
            padding: 2rem;
            border-radius: 15px 15px 0 0;
        }

        .card-header h3 {
            margin: 0;
            font-weight: 600;
        }

        .card-body {
            padding: 2rem;
        }

        .form-control {
            border-radius: 10px;
            padding: 12px;
            border: 2px solid #e0e0e0;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: #00796b;
            box-shadow: 0 0 0 0.2rem rgba(0, 121, 107, 0.25);
        }

        .btn-login {
            background: linear-gradient(135deg, #00796b 0%, #004d40 100%);
            border: none;
            border-radius: 10px;
            padding: 12px;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s ease;
        }

        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 121, 107, 0.4);
        }

        .alert {
            border-radius: 10px;
            border: none;
            background-color: #ff5252;
            color: white;
        }

        .form-label {
            font-weight: 500;
            color: #333;
            margin-bottom: 0.5rem;
        }

        .logo {
            width: 100px;
            height: 100px;
            margin-bottom: 1rem;
        }

        .footer-text {
            text-align: center;
            margin-top: 20px;
            font-size: 0.9rem;
            color: #555;
        }
    </style>
</head>
<body>

<div class="login-container">
    <div class="card-header">
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
    </div>
    <div class="footer-text">
        <p>&copy; 2025 Smile Center. Todos los derechos reservados.</p>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
