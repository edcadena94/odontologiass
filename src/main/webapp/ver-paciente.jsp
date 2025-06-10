<%--
  Created by IntelliJ IDEA.
  User: USUARIO
  Date: 10/6/2025
  Time: 18:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.odontologia.models.Paciente" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ver Paciente - Clínica Dental</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="css/crud.css" rel="stylesheet">
</head>
<body>
<%
    Paciente paciente = (Paciente) request.getAttribute("paciente");
    if (paciente == null) {
        response.sendRedirect("paciente?error=not_found");
        return;
    }
%>

<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-lg-8">

            <!-- Información del Paciente -->
            <div class="card">
                <div class="card-header text-center">
                    <h3><i class="fas fa-user me-2"></i>Información del Paciente</h3>
                    <small class="text-muted">ID: <%= paciente.getIdPaciente() %></small>
                </div>
                <div class="card-body p-4">

                    <!-- Avatar y nombre -->
                    <div class="text-center mb-4">
                        <div class="avatar-circle mb-3">
                            <%= paciente.getIniciales() %>
                        </div>
                        <h4><%= paciente.getNombreCompleto() %></h4>
                        <span class="badge bg-info fs-6"><%= paciente.getGrupoEtario() %></span>
                    </div>

                    <!-- Detalles en tarjetas -->
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <div class="info-card p-3">
                                <h6 class="text-primary">
                                    <i class="fas fa-calendar me-2"></i>Fecha de Nacimiento
                                </h6>
                                <p class="mb-0"><%= paciente.getFechaNacimientoFormateada() %></p>
                                <small class="text-muted"><%= paciente.getEdadTexto() %></small>
                            </div>
                        </div>

                        <div class="col-md-6 mb-3">
                            <div class="info-card p-3">
                                <h6 class="text-primary">
                                    <i class="fas fa-phone me-2"></i>Teléfono
                                </h6>
                                <p class="mb-0">
                                    <%= paciente.getTelefono() != null && !paciente.getTelefono().isEmpty()
                                            ? paciente.getTelefono() : "No registrado" %>
                                </p>
                            </div>
                        </div>

                        <div class="col-md-6 mb-3">
                            <div class="info-card p-3">
                                <h6 class="text-primary">
                                    <i class="fas fa-envelope me-2"></i>Email
                                </h6>
                                <p class="mb-0">
                                    <%= paciente.getEmail() != null && !paciente.getEmail().isEmpty()
                                            ? paciente.getEmail() : "No registrado" %>
                                </p>
                            </div>
                        </div>

                        <div class="col-md-6 mb-3">
                            <div class="info-card p-3">
                                <h6 class="text-primary">
                                    <i class="fas fa-map-marker-alt me-2"></i>Dirección
                                </h6>
                                <p class="mb-0">
                                    <%= paciente.getDireccion() != null && !paciente.getDireccion().isEmpty()
                                            ? paciente.getDireccion() : "No registrado" %>
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Información adicional -->
                    <div class="info-card p-3 mt-3">
                        <h6 class="text-primary mb-3">
                            <i class="fas fa-info-circle me-2"></i>Información Adicional
                        </h6>
                        <div class="row">
                            <div class="col-md-4">
                                <small class="text-muted">Estado</small>
                                <p class="mb-2">
                                        <span class="badge <%= paciente.esMayorDeEdad() ? "bg-success" : "bg-warning" %>">
                                            <%= paciente.esMayorDeEdad() ? "Mayor de edad" : "Menor de edad" %>
                                        </span>
                                </p>
                            </div>
                            <div class="col-md-4">
                                <small class="text-muted">Categoría</small>
                                <p class="mb-2">
                                    <span class="badge bg-info"><%= paciente.getGrupoEtario() %></span>
                                </p>
                            </div>
                            <div class="col-md-4">
                                <small class="text-muted">Contacto</small>
                                <p class="mb-2">
                                        <span class="badge <%= paciente.tieneEmail() ? "bg-success" : "bg-secondary" %>">
                                            <%= paciente.tieneEmail() ? "Completo" : "Incompleto" %>
                                        </span>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Acciones -->
            <div class="card mt-3">
                <div class="card-body text-center">
                    <h6 class="text-primary mb-3">Acciones</h6>
                    <div class="btn-group" role="group">
                        <a href="paciente?accion=editar&id=<%= paciente.getIdPaciente() %>"
                           class="btn btn-warning">
                            <i class="fas fa-edit me-2"></i>Editar
                        </a>
                        <a href="cita?idPaciente=<%= paciente.getIdPaciente() %>"
                           class="btn btn-success">
                            <i class="fas fa-calendar-plus me-2"></i>Agendar Cita
                        </a>
                        <button onclick="confirmarEliminar(<%= paciente.getIdPaciente() %>)"
                                class="btn btn-danger">
                            <i class="fas fa-trash me-2"></i>Eliminar
                        </button>
                    </div>
                </div>
            </div>

            <!-- Navegación -->
            <div class="mt-4 text-center">
                <a href="paciente" class="btn btn-outline-primary">
                    <i class="fas fa-arrow-left me-2"></i>Volver a la Lista
                </a>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function confirmarEliminar(id) {
        if (confirm('¿Está seguro de eliminar este paciente?\n\nEsta acción no se puede deshacer.')) {
            const form = document.createElement('form');
            form.method = 'POST';
            form.action = 'paciente';

            const inputAccion = document.createElement('input');
            inputAccion.type = 'hidden';
            inputAccion.name = 'accion';
            inputAccion.value = 'eliminar';

            const inputId = document.createElement('input');
            inputId.type = 'hidden';
            inputId.name = 'id';
            inputId.value = id;

            form.appendChild(inputAccion);
            form.appendChild(inputId);
            document.body.appendChild(form);
            form.submit();
        }
    }
</script>

<style>
    .avatar-circle {
        width: 80px;
        height: 80px;
        border-radius: 50%;
        background: linear-gradient(45deg, #007bff, #0056b3);
        color: white;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.5rem;
        font-weight: bold;
        margin: 0 auto;
    }

    .info-card {
        background: #f8f9fa;
        border-radius: 8px;
        border-left: 4px solid #007bff;
    }

    .info-card h6 {
        margin-bottom: 0.5rem;
    }
</style>
</body>
</html>