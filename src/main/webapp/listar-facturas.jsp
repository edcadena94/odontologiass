<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.odontologia.models.Factura" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lista de Facturas - Clínica Dental</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/crud.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="text-primary"><i class="fas fa-file-invoice-dollar me-2"></i>Gestión de Facturas</h2>
        <a href="factura?accion=nuevo" class="btn btn-success">
            <i class="fas fa-plus me-2"></i>Nueva Factura
        </a>
    </div>

    <% if ("created".equals(request.getParameter("success"))) { %>
    <div class="alert alert-success">¡Factura creada exitosamente!</div>
    <% } else if ("updated".equals(request.getParameter("success"))) { %>
    <div class="alert alert-info">¡Factura actualizada exitosamente!</div>
    <% } else if ("deleted".equals(request.getParameter("success"))) { %>
    <div class="alert alert-warning">¡Factura eliminada exitosamente!</div>
    <% } else if ("true".equals(request.getParameter("error"))) { %>
    <div class="alert alert-danger">Error en la operación. Intente nuevamente.</div>
    <% } %>

    <div class="card">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead class="table-primary">
                    <tr>
                        <th>ID</th>
                        <th>Número</th>
                        <th>Fecha</th>
                        <th>Monto Total</th>
                        <th>ID Paciente</th>
                        <th>Acciones</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        List<Factura> listaFacturas = (List<Factura>) request.getAttribute("listaFacturas");
                        if (listaFacturas != null && !listaFacturas.isEmpty()) {
                            for (Factura factura : listaFacturas) {
                    %>
                    <tr>
                        <td><%= factura.getIdFactura() %></td>
                        <td><%= factura.getNumeroFactura() %></td>
                        <td><%= factura.getFecha() %></td>
                        <td>$ <%= factura.getMontoTotal() %></td>
                        <td><%= factura.getIdPaciente() %></td>
                        <td>
                            <div class="btn-group" role="group">
                                <a href="factura?accion=ver&id=<%= factura.getIdFactura() %>" class="btn btn-outline-info btn-sm">
                                    <i class="fas fa-eye"></i>
                                </a>
                                <a href="factura?accion=editar&id=<%= factura.getIdFactura() %>" class="btn btn-outline-warning btn-sm">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <button onclick="confirmarEliminar(<%= factura.getIdFactura() %>)" class="btn btn-outline-danger btn-sm">
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
                            <i class="fas fa-info-circle me-2"></i>No hay facturas registradas
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
    <div class="mt-4 text-center">
        <a href="index.jsp" class="btn btn-secondary">
            <i class="fas fa-home me-2"></i>Volver al Inicio
        </a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function confirmarEliminar(id) {
        if (confirm('¿Está seguro de eliminar esta factura?')) {
            const form = document.createElement('form');
            form.method = 'POST';
            form.action = 'factura';

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