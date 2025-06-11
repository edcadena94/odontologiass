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
    <link rel="stylesheet" href="css/index.css">

    <!-- Icono favicon -->
    <link rel="icon" href="favicon.ico" type="image/x-icon" />

    <!-- Google Fonts y FontAwesome -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

    <!-- Floating WhatsApp CSS -->
    <link rel="stylesheet" href="https://rawcdn.githack.com/jerfeson/floating-whatsapp/0310b4cd88e9e55dc637d1466670da26b645ae49/floating-wpp.min.css" />

    <!-- Floating WhatsApp JS -->
    <script type="text/javascript" src="https://rawcdn.githack.com/jerfeson/floating-whatsapp/0310b4cd88e9e55dc637d1466670da26b645ae49/floating-wpp.min.js" defer></script>
</head>

<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg sticky-top shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">Smile Center</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent"
                aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarContent">
            <ul class="navbar-nav ms-auto align-items-center">
                <li class="nav-item"><a class="nav-link" href="#servicios">Servicios</a></li>
                <li class="nav-item"><a class="nav-link" href="#testimonios">Testimonios</a></li>
                <li class="nav-item"><a class="nav-link" href="#contacto">Contáctanos</a></li>
                <!-- Panel de Administración -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                        <i class="fas fa-cog me-1"></i>Gestión
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="paciente"><i class="fas fa-users me-2"></i>Pacientes</a></li>
                        <li><a class="dropdown-item" href="doctor"><i class="fas fa-user-md me-2"></i>Doctores</a></li>
                        <li><a class="dropdown-item" href="cita"><i class="fas fa-calendar-alt me-2"></i>Citas</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="login.jsp"><i class="fas fa-sign-in-alt me-2"></i>Iniciar Sesión</a></li>
                    </ul>
                </li>
                <li class="nav-item"><a class="btn btn-modern ms-3" href="cita">Agendar Cita</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Panel de Acceso Rápido para Administración -->
<section class="container mb-5">
    <div class="row">
        <div class="col-12">
            <div class="card shadow-sm border-0 admin-panel">
                <div class="card-body">
                    <h5 class="card-title text-center mb-4">
                        <i class="fas fa-tachometer-alt me-2 text-primary"></i>Panel de Gestión Rápida
                    </h5>
                    <div class="row g-3">
                        <div class="col-md-3">
                            <a href="cita" class="card admin-card text-decoration-none">
                                <div class="card-body text-center">
                                    <i class="fas fa-calendar-plus fa-3x text-success mb-3"></i>
                                    <h6>Nueva Cita</h6>
                                    <p class="small text-muted">Agendar cita médica</p>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3">
                            <a href="paciente?accion=nuevo" class="card admin-card text-decoration-none">
                                <div class="card-body text-center">
                                    <i class="fas fa-user-plus fa-3x text-info mb-3"></i>
                                    <h6>Nuevo Paciente</h6>
                                    <p class="small text-muted">Registrar paciente</p>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3">
                            <a href="paciente" class="card admin-card text-decoration-none">
                                <div class="card-body text-center">
                                    <i class="fas fa-users fa-3x text-warning mb-3"></i>
                                    <h6>Ver Pacientes</h6>
                                    <p class="small text-muted">Gestionar pacientes</p>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3">
                            <a href="doctor" class="card admin-card text-decoration-none">
                                <div class="card-body text-center">
                                    <i class="fas fa-user-md fa-3x text-primary mb-3"></i>
                                    <h6>Ver Doctores</h6>
                                    <p class="small text-muted">Gestionar doctores</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

</body>
</html> btn-outline-primary">Reservar</a>
</div>
</div>
</div>
</section>


<!-- Footer -->
<footer class="bg-dark text-white text-center py-4">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h6>Smile Center</h6>
                <p class="small">Clínica especializada en odontología integral e implantes dentales.</p>
            </div>
            <div class="col-md-4">
                <h6>Enlaces Rápidos</h6>
                <p class="small">
                    <a href="paciente" class="text-white-50 text-decoration-none me-2">Pacientes</a> |
                    <a href="doctor" class="text-white-50 text-decoration-none ms-2">Doctores</a>
                </p>
            </div>
            <div class="col-md-4">
                <h6>Horarios</h6>
                <p class="small">Lun-Vie: 8:00-18:00<br>Sáb: 9:00-14:00</p>
            </div>
        </div>
        <hr class="my-3">
        <p class="mb-0">© 2025 Smile Center - Todos los derechos reservados</p>
    </div>
</footer>


<style>
    .admin-panel {
        background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
    }

    .admin-card {
        transition: all 0.3s ease;
        border: 1px solid #dee2e6;
    }

    .admin-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 25px rgba(0,0,0,0.1);
        text-decoration: none;
        color: inherit;
    }

    .service-card {
        transition: all 0.3s ease;
        border-radius: 15px;
        background: #fff;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
    }

    .service-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 8px 30px rgba(0,0,0,0.15);
    }
</style>
</body>
</html>