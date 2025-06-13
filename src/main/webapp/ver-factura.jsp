<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.odontologia.models.Factura" %>
<%
    Factura factura = (Factura) request.getAttribute("factura");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Smile Center - Detalle de Factura</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="css/registro.css" />
</head>
<body>
<div class="registro-container">
    <div class="card-header text-center bg-info">
        <img src="img/logo.png" alt="Logo" class="logo" />
        <h3 class="text-white">Smile Center</h3>
    </div>
    <div class="card-body">
        <h4 class="mb-4 text-center text-info"><i class="fas fa-file-invoice-dollar me-2"></i>Detalle de Factura</h4>
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
    <div class="footer-text text-center mt-4">
        <p>&copy; 2025 Smile Center. Todos los derechos reservados.</p>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>