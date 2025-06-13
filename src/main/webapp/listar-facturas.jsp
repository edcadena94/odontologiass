<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.odontologia.models.Factura" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Smile Center - Lista de Facturas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="css/listaFacturas.css" />
</head>
<body>
<div class="main-content">
    <div class="header-area mb-3 mt-2 flex-wrap">
        <h1 class="custom-title"><i class="fas fa-file-invoice-dollar me-2"></i>Gestión de Facturas</h1>
        <a href="factura?accion=nuevo" class="btn btn-success d-flex align-items-center gap-2">
            <i class="fas fa-plus"></i> Nueva Factura
        </a>
    </div>

    <% if ("created".equals(request.getParameter("success"))) { %>
    <div class="alert alert-success text-center shadow-sm mt-4">¡Factura creada exitosamente!</div>
    <% } else if ("updated".equals(request.getParameter("success"))) { %>
    <div class="alert alert-info text-center shadow-sm mt-4">¡Factura actualizada exitosamente!</div>
    <% } else if ("deleted".equals(request.getParameter("success"))) { %>
    <div class="alert alert-warning text-center shadow-sm mt-4">¡Factura eliminada exitosamente!</div>
    <% } else if ("true".equals(request.getParameter("error"))) { %>
    <div class="alert alert-danger text-center shadow-sm mt-4">Error en la operación. Intente nuevamente.</div>
    <% } %>

    <div class="factura-table-card mt-4">
        <div class="table-responsive">
            <table class="table table-hover mb-0 align-middle">
                <thead>
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
                            <a href="factura?accion=ver&id=<%= factura.getIdFactura() %>" class="btn btn-outline-info btn-sm" title="Ver">
                                <i class="fas fa-eye"></i>
                            </a>
                            <a href="factura?accion=editar&id=<%= factura.getIdFactura() %>" class="btn btn-outline-warning btn-sm" title="Editar">
                                <i class="fas fa-edit"></i>
                            </a>
                            <button type="button" onclick="confirmarEliminar(<%= factura.getIdFactura() %>)" class="btn btn-outline-danger btn-sm" title="Eliminar">
                                <i class="fas fa-trash"></i>
                            </button>
                        </div>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr class="no-facturas-row">
                    <td colspan="6" class="text-center">
                        No hay facturas registradas
                    </td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
    <div class="text-center mt-5">
        <a href="index.jsp" class="btn btn-secondary justify-content-center">
            <i class="fas fa-home"></i> Volver al Inicio
        </a>
    </div>
    <div class="footer-text text-center mt-4">
        <p>&copy; 2025 Smile Center. Todos los derechos reservados.</p>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/7c36ef5b0e.js" crossorigin="anonymous"></script>
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