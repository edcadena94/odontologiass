<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 11/6/2025
  Time: 19:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.odontologia.models.Factura" %>
<%
    Factura factura = (Factura) request.getAttribute("factura");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Editar Factura - Clínica Dental</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/crud.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <div class="card mx-auto" style="max-width: 560px;">
        <div class="card-header bg-warning text-white">
            <h4 class="mb-0"><i class="fas fa-pen me-2"></i>Editar Factura</h4>
        </div>
        <div class="card-body">
            <form action="factura" method="post">
                <input type="hidden" name="accion" value="actualizar">
                <input type="hidden" name="id" value="<%= factura.getIdFactura() %>">

                <div class="mb-3">
                    <label for="numeroFactura" class="form-label">Número de Factura</label>
                    <input type="text" class="form-control" name="numeroFactura" id="numeroFactura"
                           value="<%= factura.getNumeroFactura() %>" required>
                </div>
                <div class="mb-3">
                    <label for="fecha" class="form-label">Fecha</label>
                    <input type="date" class="form-control" name="fecha" id="fecha"
                           value="<%= factura.getFecha() %>" required>
                </div>
                <div class="mb-3">
                    <label for="montoTotal" class="form-label">Monto Total</label>
                    <input type="number" class="form-control" name="montoTotal" id="montoTotal"
                           min="0" step="0.01" value="<%= factura.getMontoTotal() %>" required>
                </div>
                <div class="mb-3">
                    <label for="idPaciente" class="form-label">ID Paciente</label>
                    <input type="number" class="form-control" name="idPaciente" id="idPaciente"
                           min="1" value="<%= factura.getIdPaciente() %>" required>
                </div>
                <div class="d-flex justify-content-between">
                    <a href="factura?accion=listar" class="btn btn-secondary">Volver</a>
                    <button type="submit" class="btn btn-warning text-white">Actualizar Factura</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
