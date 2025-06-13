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
    <title>Detalle de Factura - Clínica Dental</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/crud.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <div class="card mx-auto" style="max-width: 560px;">
        <div class="card-header bg-info text-white">
            <h4 class="mb-0"><i class="fas fa-file-invoice-dollar me-2"></i>Detalle de Factura</h4>
        </div>
        <div class="card-body">
            <dl class="row">
                <dt class="col-sm-5">ID</dt>
                <dd class="col-sm-7"><%= factura.getIdFactura() %></dd>
                <dt class="col-sm-5">Número de Factura</dt>
                <dd class="col-sm-7"><%= factura.getNumeroFactura() %></dd>
                <dt class="col-sm-5">Fecha</dt>
                <dd class="col-sm-7"><%= factura.getFecha() %></dd>
                <dt class="col-sm-5">Monto Total</dt>
                <dd class="col-sm-7">$ <%= factura.getMontoTotal() %></dd>
                <dt class="col-sm-5">ID Paciente</dt>
                <dd class="col-sm-7"><%= factura.getIdPaciente() %></dd>
            </dl>
            <div class="d-flex justify-content-end">
                <a href="factura?accion=listar" class="btn btn-secondary">Volver</a>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
