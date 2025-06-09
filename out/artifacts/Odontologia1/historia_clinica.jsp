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

</head>
<link rel="stylesheet" href="css/historia_clinica.css">
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
