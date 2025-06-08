<%--
  Created by IntelliJ IDEA.
  User: CLINICA
  Date: 2/6/2025
  Time: 18:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Historia Clínica - Smile Center</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Estilos embebidos -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #0073b7;
            color: white;
            padding: 20px;
            text-align: center;
        }
        .container {
            max-width: 900px;
            margin: 30px auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 {
            color: #0073b7;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }
        input[type="text"],
        input[type="date"],
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            margin-top: 5px;
        }
        textarea {
            resize: vertical;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .button {
            background-color: #0073b7;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }
        .button:hover {
            background-color: #005f8a;
        }
    </style>
</head>
<body>

<header>
    <h1>Smile Center</h1>
    <p>Registro de Historia Clínica Odontológica</p>
</header>

<div class="container">
    <h2>Historia Clínica del Paciente</h2>
    <form method="post" action="historia_clinica">

        <div class="form-group">
            <label>Nombre completo</label>
            <input type="text" name="nombre" required>
        </div>

        <div class="form-group">
            <label>Fecha de Nacimiento</label>
            <input type="date" name="fechaNacimiento" required>
        </div>

        <div class="form-group">
            <label>Dirección</label>
            <input type="text" name="direccion" required>
        </div>

        <div class="form-group">
            <label>Teléfono</label>
            <input type="text" name="telefono">
        </div>

        <div class="form-group">
            <label>Correo Electrónico</label>
            <input type="text" name="correo">
        </div>

        <div class="form-group">
            <label>Motivo de Consulta</label>
            <textarea name="motivoConsulta" rows="3"></textarea>
        </div>

        <div class="form-group">
            <label>Antecedentes</label>
            <textarea name="antecedentes" rows="3"></textarea>
        </div>

        <div class="form-group">
            <label>Tratamientos Previos</label>
            <textarea name="tratamientosPrevios" rows="3"></textarea>
        </div>

        <div class="form-group">
            <label>Examen Clínico</label>
            <textarea name="examenClinico" rows="3"></textarea>
        </div>

        <div class="form-group">
            <label>Diagnóstico</label>
            <textarea name="diagnostico" rows="3"></textarea>
        </div>

        <div class="form-group">
            <label>Plan de Tratamiento</label>
            <textarea name="planTratamiento" rows="3"></textarea>
        </div>

        <button type="submit" class="button">Guardar Historia Clínica</button>
    </form>
</div>
<div class="user-info" style="position: absolute; top: 10px; right: 10px;">
    <span class="text-white">
        Usuario: <%= session.getAttribute("usuario") %>
        (<%= session.getAttribute("rol") %>)
    </span>
    <a href="logout" class="btn btn-outline-light btn-sm ms-2">Cerrar Sesión</a>
</div>

</body>
</html>
