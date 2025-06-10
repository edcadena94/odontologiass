<%--
  Created by IntelliJ IDEA.
  User: USUARIO
  Date: 10/6/2025
  Time: 17:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.odontologia.models.Paciente" %>
<!DOCTYPE html>
<html>
<head>
    <title>Editar Paciente - Clínica Dental</title>
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
            <div class="card">
                <div class="card-header text-center">
                    <h3><i class="fas fa-user-edit me-2"></i>Editar Paciente</h3>
                    <small class="text-muted">ID: <%= paciente.getIdPaciente() %></small>
                </div>
                <div class="card-body p-4">

                    <!-- Mensajes de error -->
                    <% if ("campos_vacios".equals(request.getParameter("error"))) { %>
                    <div class="alert alert-danger">Todos los campos obligatorios deben ser completados.</div>
                    <% } else if ("no_actualizado".equals(request.getParameter("error"))) { %>
                    <div class="alert alert-danger">Error al actualizar el paciente. Intente nuevamente.</div>
                    <% } %>

                    <form action="paciente" method="post" id="formPaciente">
                        <input type="hidden" name="accion" value="actualizar">
                        <input type="hidden" name="id" value="<%= paciente.getIdPaciente() %>">

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    <i class="fas fa-user text-primary me-2"></i>Nombre *
                                </label>
                                <input type="text" name="nombre" class="form-control" required
                                       value="<%= paciente.getNombre() != null ? paciente.getNombre() : "" %>">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    <i class="fas fa-user text-primary me-2"></i>Apellido *
                                </label>
                                <input type="text" name="apellido" class="form-control" required
                                       value="<%= paciente.getApellido() != null ? paciente.getApellido() : "" %>">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    <i class="fas fa-calendar text-primary me-2"></i>Fecha de Nacimiento *
                                </label>
                                <input type="date" name="fechaNacimiento" class="form-control" required
                                       value="<%= paciente.getFechaNacimientoISO() %>">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    <i class="fas fa-phone text-primary me-2"></i>Teléfono
                                </label>
                                <input type="tel" name="telefono" class="form-control"
                                       value="<%= paciente.getTelefono() != null ? paciente.getTelefono() : "" %>">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    <i class="fas fa-envelope text-primary me-2"></i>Email
                                </label>
                                <input type="email" name="email" class="form-control"
                                       value="<%= paciente.getEmail() != null ? paciente.getEmail() : "" %>">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    <i class="fas fa-map-marker-alt text-primary me-2"></i>Dirección
                                </label>
                                <input type="text" name="direccion" class="form-control"
                                       value="<%= paciente.getDireccion() != null ? paciente.getDireccion() : "" %>">
                            </div>
                        </div>

                        <div class="text-center pt-3">
                            <button type="submit" class="btn btn-primary btn-lg me-3">
                                <i class="fas fa-save me-2"></i>Actualizar Paciente
                            </button>
                            <a href="paciente" class="btn btn-outline-secondary btn-lg">
                                <i class="fas fa-times me-2"></i>Cancelar
                            </a>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Información adicional -->
            <div class="card mt-3">
                <div class="card-body">
                    <h6 class="text-primary mb-3">
                        <i class="fas fa-info-circle me-2"></i>Información del Paciente
                    </h6>
                    <div class="row">
                        <div class="col-md-6">
                            <p><strong>Edad:</strong> <%= paciente.getEdadTexto() %></p>
                            <p><strong>Grupo Etario:</strong> <%= paciente.getGrupoEtario() %></p>
                        </div>
                        <div class="col-md-6">
                            <p><strong>Registro:</strong> ID <%= paciente.getIdPaciente() %></p>
                            <p><strong>Estado:</strong> <%= paciente.esMayorDeEdad() ? "Mayor de edad" : "Menor de edad" %></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Validación adicional
    document.getElementById('formPaciente').addEventListener('submit', function(e) {
        const fechaNacimiento = new Date(document.querySelector('[name="fechaNacimiento"]').value);
        const hoy = new Date();

        if (fechaNacimiento > hoy) {
            e.preventDefault();
            alert('La fecha de nacimiento no puede ser futura.');
            return false;
        }
    });
</script>
</body>
</html>