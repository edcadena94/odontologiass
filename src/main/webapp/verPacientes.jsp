<%@ page import="com.odontologia.models.Paciente" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pacientes Registrados</title>
    <!-- Enlace a Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Pacientes Registrados</h1>
    <table class="table table-striped table-bordered mt-4">
        <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Fecha de Nacimiento</th>
            <th>Sexo</th>
            <th>Dirección</th>
            <th>Teléfono</th>
            <th>Email</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Paciente> pacientes = (List<Paciente>) request.getAttribute("pacientes");
            for (Paciente paciente : pacientes) {
        %>
        <tr>
            <td><%= paciente.getIdPaciente() %></td>
            <td><%= paciente.getNombre() %></td>
            <td><%= paciente.getApellido() %></td>
            <td><%= new SimpleDateFormat("yyyy-MM-dd").format(paciente.getFechaNacimiento()) %></td>
            <td><%= paciente.getSexo() %></td>
            <td><%= paciente.getDireccion() %></td>
            <td><%= paciente.getTelefono() %></td>
            <td><%= paciente.getEmail() %></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <div class="text-center">
        <a href="registrarPaciente.jsp" class="btn btn-primary">Registrar Nuevo Paciente</a>
    </div>
</div>

<!-- Enlace a Bootstrap JS y dependencias (opcional) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
