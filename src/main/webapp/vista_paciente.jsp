<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Datos del Paciente - Smile Center</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
<header>
    <h1>Smile Center</h1>
    <p>Datos del Paciente</p>
</header>

<div class="container">
    <% if (request.getAttribute("mensaje") != null) { %>
    <div class="mensaje-exito">
        <%= request.getAttribute("mensaje") %>
    </div>
    <% } %>

    <h2>Información del Paciente</h2>

    <% Model.Paciente paciente = (Model.Paciente) request.getAttribute("paciente"); %>

    <div class="data-group">
        <p><span class="label">Nombre:</span> <%= paciente.getNombre() %></p>
        <p><span class="label">Fecha de Nacimiento:</span> <%= paciente.getFechaNacimiento() %></p>
        <p><span class="label">Dirección:</span> <%= paciente.getDireccion() %></p>
        <p><span class="label">Teléfono:</span> <%= paciente.getTelefono() %></p>
        <p><span class="label">Correo:</span> <%= paciente.getCorreo() %></p>
    </div>

    <div class="data-group">
        <h3>Historia Clínica</h3>
        <p><span class="label">Motivo de Consulta:</span> <%= paciente.getMotivoConsulta() %></p>
        <p><span class="label">Antecedentes:</span> <%= paciente.getAntecedentes() %></p>
        <p><span class="label">Tratamientos Previos:</span> <%= paciente.getTratamientosPrevios() %></p>
        <p><span class="label">Examen Clínico:</span> <%= paciente.getExamenClinico() %></p>
        <p><span class="label">Diagnóstico:</span> <%= paciente.getDiagnostico() %></p>
        <p><span class="label">Plan de Tratamiento:</span> <%= paciente.getPlanTratamiento() %></p>
    </div>

    <a href="PacienteServlet" class="button">Nueva Historia Clínica</a>
</div>
</body>
</html>
