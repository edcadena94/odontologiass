<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Smile Center - Clínica de Implantes Dentales y Odontología Integral</title>

    <!-- Bootstrap CSS y JS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" defer></script>

    <!-- Google Fonts y FontAwesome -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

    <!-- Estilos personalizados -->
    <link href="css/panelDoctor.css" rel="stylesheet" />
</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg sticky-top shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold" href="index.jsp">Smile Center</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent"
                aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarContent">
            <ul class="navbar-nav align-items-center">
                <li class="nav-item ms-3">
                    <a class="btn btn-danger" href="index.jsp">Cerrar Sesión</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Panel principal -->
<div class="container my-5">
    <div class="row justify-content-center g-4">
        <!-- Ver Pacientes -->
        <div class="col-md-4">
            <a href="verPacientes.jsp" class="text-decoration-none">
                <div class="dashboard-card">
                    <i class="fas fa-users"></i>
                    <div class="dashboard-title">Ver Pacientes</div>
                    <div class="dashboard-subtext">Gestionar pacientes</div>
                </div>
            </a>
        </div>

        <!-- Ver Doctores -->
        <div class="col-md-4">
            <a href="doctor" class="text-decoration-none">
                <div class="dashboard-card">
                    <i class="fas fa-user-md"></i>
                    <div class="dashboard-title">Ver Doctores</div>
                    <div class="dashboard-subtext">Gestionar doctores</div>
                </div>
            </a>
        </div>
    </div>
</div>

<!-- Footer -->
<footer>
    <div class="container">
        <div class="row gy-4">
            <div class="col-md-4 text-center text-md-start">
                <h6>Smile Center</h6>
                <p>Clínica especializada en odontología integral e implantes dentales.</p>
            </div>
            <div class="col-md-4 text-center">
                <h6>Enlaces Rápidos</h6>
                <p class="footer-links">
                    <a href="paciente">Pacientes</a> |
                    <a href="doctor">Doctores</a>
                </p>
                <div class="social-icons mt-3">
                    <a href="#" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                    <a href="#" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
            <div class="col-md-4 text-center text-md-end">
                <h6>Horarios</h6>
                <p>Lun-Vie: 8:00-18:00<br>Sáb: 9:00-14:00</p>
            </div>
        </div>
        <div class="footer-bottom text-center mt-4">
            © 2025 Smile Center - Todos los derechos reservados
        </div>
    </div>
</footer>

</body>
</html>
