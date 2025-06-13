<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.odontologia.models.Paciente" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lista de Pacientes - Clínica Dental</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="css/crud.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <!-- Header -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2><i class="fas fa-users text-primary me-2"></i>Gestión de Pacientes</h2>
        <a href="pacientes?accion=nuevo" class="btn btn-success">
            <i class="fas fa-plus me-2"></i>Nuevo Paciente
        </a>
    </div>

    <!-- Mensajes -->
    <% if ("guardado_exitoso".equals(request.getParameter("status"))) { %>
    <div class="alert alert-success">¡Paciente creado exitosamente!</div>
    <% } else if ("error".equals(request.getParameter("error"))) { %>
    <div class="alert alert-danger">Error en la operación. Intente nuevamente.</div>
    <% } %>

    <!-- Tabla -->
    <div class="card">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead class="table-primary">
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Fecha Nacimiento</th>
                        <th>Sexo</th>
                        <th>Dirección</th>
                        <th>Teléfono</th>
                        <th>Email</th>
                        <!-- Puedes agregar columna para acciones si quieres -->
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        List<Paciente> listaPacientes = (List<Paciente>) request.getAttribute("pacientes");
                        if (listaPacientes != null && !listaPacientes.isEmpty()) {
                            for (Paciente paciente : listaPacientes) {
                    %>
                    <tr>
                        <td><%= paciente.getIdPaciente() %></td>
                        <td><%= paciente.getNombre() != null ? paciente.getNombre() : "-" %></td>
                        <td><%= paciente.getApellido() != null ? paciente.getApellido() : "-" %></td>
                        <td><%= paciente.getFechaNacimiento() != null ? new java.text.SimpleDateFormat("yyyy-MM-dd").format(paciente.getFechaNacimiento()) : "-" %></td>
                        <td><%= paciente.getSexo() %></td>
                        <td><%= paciente.getDireccion() != null ? paciente.getDireccion() : "-" %></td>
                        <td><%= paciente.getTelefono() != null ? paciente.getTelefono() : "-" %></td>
                        <td><%= paciente.getEmail() != null ? paciente.getEmail() : "-" %></td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="8" class="text-center">
                            <i class="fas fa-info-circle me-2"></i>No hay pacientes registrados
                        </td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Navegación -->
    <div class="mt-4 text-center">
        <a href="index1.jsp" class="btn btn-secondary">
            <i class="fas fa-home me-2"></i>Volver al Inicio
        </a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
