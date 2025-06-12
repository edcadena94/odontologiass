<%--
  Created by IntelliJ IDEA.
  User: USUARIO
  Date: 11/6/2025
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Smile Center - Clínica de Implantes Dentales y Odontología Integral</title>

    <!-- Bootstrap CSS y JS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" defer></script>
    <link rel="stylesheet" href="css/cabecero-rep.css">

    <!-- Icono favicon -->
    <link rel="icon" href="favicon.ico" type="image/x-icon" />

    <!-- Google Fonts y FontAwesome -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow-sm sticky-top">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">Smile Center</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent"
                aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarContent">
            <ul class="navbar-nav ms-auto align-items-center">
                <li class="nav-item">
                    <a class="btn btn-danger ms-3" href="login.jsp">Cerrar Sesión</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Panel de Acceso Rápido para la Recepcionista -->
<section class="container my-5">
    <div class="row">
        <div class="col-12">
            <div class="card shadow border-0">
                <div class="card-body">
                    <h5 class="card-title text-center mb-4">
                        <i class="fas fa-tachometer-alt me-2 text-primary"></i>Recepcionista
                    </h5>
                    <div class="row g-4 justify-content-center">
                        <div class="col-md-6">
                            <a href="cita" class="card admin-card text-decoration-none">
                                <div class="card-body text-center">
                                    <i class="fas fa-calendar-plus fa-3x text-success mb-3"></i>
                                    <h6 class="card-title">Nueva Cita</h6>
                                    <p class="small text-muted">Agendar cita médica</p>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-6">
                            <a href="paciente?accion=nuevo" class="card admin-card text-decoration-none">
                                <div class="card-body text-center">
                                    <i class="fas fa-user-plus fa-3x text-info mb-3"></i>
                                    <h6 class="card-title">Nuevo Paciente</h6>
                                    <p class="small text-muted">Registrar paciente</p>
                                </div>
                            </a>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="bg-dark text-white text-center py-4">
        <p class="mb-0">© 2025 Smile Center - Todos los derechos reservados</p>
</footer>

</body>
</html>
