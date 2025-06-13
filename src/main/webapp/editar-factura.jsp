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
    <title>Smile Center - Editar Factura</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="css/registro.css" />
    <style>
        .form-control.is-invalid, .form-select.is-invalid {
            border-color: #dc3545;
        }
    </style>
</head>
<body>
<div class="registro-container">
    <div class="card-header text-center bg-warning">
        <img src="img/logo.png" alt="Logo" class="logo" />
        <h3 class="text-white">Smile Center</h3>
    </div>
    <div class="card-body">
        <%-- Mensaje general de error del servidor --%>
        <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-danger mb-4" role="alert">
            <%= request.getAttribute("error") %>
        </div>
        <% } %>

        <form action="factura" method="post" class="needs-validation" novalidate>
            <input type="hidden" name="accion" value="actualizar" />
            <input type="hidden" name="id" value="<%= factura.getIdFactura() %>" />

            <div class="mb-3">
                <label for="numeroFactura" class="form-label">Número de Factura</label>
                <input type="text"
                       class="form-control"
                       id="numeroFactura"
                       name="numeroFactura"
                       required
                       pattern="^[0-9]+$"
                       inputmode="numeric"
                       autocomplete="off"
                       value="<%= factura.getNumeroFactura() %>" />
                <div class="invalid-feedback">
                    Es obligatorio llenar el campo y solo se permiten números.
                </div>
            </div>

            <div class="mb-3">
                <label for="fecha" class="form-label">Fecha</label>
                <input type="date"
                       class="form-control"
                       id="fecha"
                       name="fecha"
                       required
                       value="<%= factura.getFecha() %>" />
                <div class="invalid-feedback">
                    Es obligatorio llenar el campo.
                </div>
            </div>

            <div class="mb-3">
                <label for="montoTotal" class="form-label">Monto Total</label>
                <input type="number"
                       class="form-control"
                       id="montoTotal"
                       name="montoTotal"
                       min="0"
                       step="0.01"
                       required
                       autocomplete="off"
                       value="<%= factura.getMontoTotal() %>" />
                <div class="invalid-feedback">
                    Es obligatorio llenar el campo.
                </div>
            </div>

            <div class="mb-3">
                <label for="idPaciente" class="form-label">ID Paciente</label>
                <input type="text"
                       class="form-control"
                       id="idPaciente"
                       name="idPaciente"
                       required
                       pattern="^[0-9]+$"
                       inputmode="numeric"
                       autocomplete="off"
                       value="<%= factura.getIdPaciente() %>" />
                <div class="invalid-feedback">
                    Es obligatorio llenar el campo y solo se permiten números.
                </div>
            </div>

            <div class="d-flex justify-content-between">
                <a href="factura?accion=listar" class="btn btn-secondary">Volver</a>
                <button type="submit" class="btn btn-warning text-white">Actualizar Factura</button>
            </div>
        </form>
    </div>
    <div class="footer-text text-center mt-4">
        <p>&copy; 2025 Smile Center. Todos los derechos reservados.</p>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    (() => {
        'use strict';
        const forms = document.querySelectorAll('.needs-validation');

        Array.from(forms).forEach(form => {
            form.addEventListener('submit', event => {
                // Validación personalizada de solo números para numeroFactura y idPaciente.
                const numeroFactura = document.getElementById('numeroFactura');
                const idPaciente = document.getElementById('idPaciente');
                const numRegex = /^[0-9]+$/;

                let valid = true;

                if (!numRegex.test(numeroFactura.value)) {
                    numeroFactura.classList.add('is-invalid');
                    valid = false;
                } else {
                    numeroFactura.classList.remove('is-invalid');
                }

                if (!numRegex.test(idPaciente.value)) {
                    idPaciente.classList.add('is-invalid');
                    valid = false;
                } else {
                    idPaciente.classList.remove('is-invalid');
                }

                if (!form.checkValidity() || !valid) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
            }, false);
        });
    })();
</script>
</body>
</html>