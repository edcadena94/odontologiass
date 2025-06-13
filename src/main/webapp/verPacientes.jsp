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
        <h2><i class="fas fa-user-injured text-primary me-2"></i>Gestión de Pacientes</h2>

    </div>

    <!-- Mensajes -->
    <% if ("true".equals(request.getParameter("success"))) { %>
    <div class="alert alert-success">¡Paciente creado exitosamente!</div>
    <% } else if ("true".equals(request.getParameter("updated"))) { %>
    <div class="alert alert-info">¡Paciente actualizado exitosamente!</div>
    <% } else if ("true".equals(request.getParameter("deleted"))) { %>
    <div class="alert alert-warning">¡Paciente eliminado exitosamente!</div>
    <% } else if ("true".equals(request.getParameter("error"))) { %>
    <div class="alert alert-danger">Error en la operación. Intente nuevamente.</div>
    <% } %>

    <!-- Buscar -->
    <div class="card mb-4">
        <div class="card-body">
            <form action="paciente" method="get" class="row g-3">
                <input type="hidden" name="accion" value="buscar">
                <div class="col-md-9">
                    <input type="text" name="nombre" class="form-control"
                           placeholder="Buscar por nombre o apellido..."
                           value="<%= request.getParameter("nombre") != null ? request.getParameter("nombre") : "" %>">
                </div>
                <div class="col-md-3">
                    <button type="submit" class="btn btn-outline-primary w-100">
                        <i class="fas fa-search me-2"></i>Buscar
                    </button>
                </div>
            </form>
        </div>
    </div>

    <!-- Tabla -->
    <div class="card">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead class="table-primary">
                    <tr>
                        <th>ID</th>
                        <th>Nombre Completo</th>
                        <th>Sexo</th>
                        <th>Teléfono</th>
                        <th>Email</th>
                        <th>Acciones</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        List<Paciente> listaPacientes = (List<Paciente>) request.getAttribute("listaPacientes");
                        if (listaPacientes != null && !listaPacientes.isEmpty()) {
                            for (Paciente paciente : listaPacientes) {
                                String sexoStr = paciente.getSexo() == 'M' || paciente.getSexo() == 'm' ? "Masculino" :
                                        paciente.getSexo() == 'F' || paciente.getSexo() == 'f' ? "Femenino" : "No especificado";
                    %>
                    <tr>
                        <td><%= paciente.getIdPaciente() %></td>
                        <td><strong><%= paciente.getNombre() %> <%= paciente.getApellido() %></strong></td>
                        <td><span class="badge bg-info"><%= sexoStr %></span></td>
                        <td><%= paciente.getTelefono() != null ? paciente.getTelefono() : "-" %></td>
                        <td><%= paciente.getEmail() != null ? paciente.getEmail() : "-" %></td>
                        <td>
                            <div class="btn-group" role="group">
                                <a href="paciente?accion=ver&id=<%= paciente.getIdPaciente() %>"
                                   class="btn btn-outline-info btn-sm">
                                    <i class="fas fa-eye"></i>
                                </a>
                                <a href="paciente?accion=editar&id=<%= paciente.getIdPaciente() %>"
                                   class="btn btn-outline-warning btn-sm">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <button onclick="confirmarEliminar(<%= paciente.getIdPaciente() %>)"
                                        class="btn btn-outline-danger btn-sm">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </div>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="6" class="text-center">
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
        <a href="panelDoctor.jsp" class="btn btn-secondary">
            <i class="fas fa-home me-2"></i>Volver al Inicio
        </a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function confirmarEliminar(id) {
        if (confirm('¿Está seguro de eliminar este paciente?')) {
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
</body>
</html>