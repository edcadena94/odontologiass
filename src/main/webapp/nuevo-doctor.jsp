<%--
  Created by IntelliJ IDEA.
  User: USUARIO
  Date: 10/6/2025
  Time: 17:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Nuevo Doctor - Clínica Dental</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="css/crud.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card">
                <div class="card-header text-center">
                    <h3><i class="fas fa-user-md-plus me-2"></i>Registrar Nuevo Doctor</h3>
                </div>
                <div class="card-body p-4">

                    <!-- Mensajes de error -->
                    <% if ("campos_vacios".equals(request.getParameter("error"))) { %>
                    <div class="alert alert-danger">Todos los campos obligatorios deben ser completados.</div>
                    <% } else if ("email_existe".equals(request.getParameter("error"))) { %>
                    <div class="alert alert-warning">El email ingresado ya está registrado.</div>
                    <% } else if ("no_guardado".equals(request.getParameter("error"))) { %>
                    <div class="alert alert-danger">Error al guardar el doctor. Intente nuevamente.</div>
                    <% } %>

                    <form action="doctor" method="post" id="formDoctor">
                        <input type="hidden" name="accion" value="crear">

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    <i class="fas fa-user text-primary me-2"></i>Nombre *
                                </label>
                                <input type="text" name="nombre" class="form-control" required
                                       placeholder="Ingrese el nombre">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    <i class="fas fa-user text-primary me-2"></i>Apellido *
                                </label>
                                <input type="text" name="apellido" class="form-control" required
                                       placeholder="Ingrese el apellido">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    <i class="fas fa-stethoscope text-primary me-2"></i>Especialidad *
                                </label>
                                <select name="especialidad" class="form-select" required>
                                    <option value="">Seleccione especialidad</option>
                                    <option value="Odontología General">Odontología General</option>
                                    <option value="Ortodóncia">Ortodóncia</option>
                                    <option value="Endodoncia">Endodoncia</option>
                                    <option value="Periodoncia">Periodoncia</option>
                                    <option value="Cirugía Oral">Cirugía Oral</option>
                                    <option value="Odontopediatría">Odontopediatría</option>
                                    <option value="Implantología">Implantología</option>
                                    <option value="Estética Dental">Estética Dental</option>
                                </select>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    <i class="fas fa-phone text-primary me-2"></i>Teléfono
                                </label>
                                <input type="tel" name="telefono" class="form-control"
                                       placeholder="Ingrese el teléfono">
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">
                                <i class="fas fa-envelope text-primary me-2"></i>Email
                            </label>
                            <input type="email" name="email" class="form-control"
                                   placeholder="doctor@clinica.com">
                        </div>

                        <div class="text-center pt-3">
                            <button type="submit" class="btn btn-success btn-lg me-3">
                                <i class="fas fa-save me-2"></i>Guardar Doctor
                            </button>
                            <a href="doctor" class="btn btn-outline-secondary btn-lg">
                                <i class="fas fa-times me-2"></i>Cancelar
                            </a>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Información -->
            <div class="card mt-3">
                <div class="card-body">
                    <h6 class="text-primary">
                        <i class="fas fa-info-circle me-2"></i>Información
                    </h6>
                    <p class="mb-0">Los campos marcados con (*) son obligatorios.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>