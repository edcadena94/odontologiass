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

<!-- Mensajes de Sistema -->
<% if ("true".equals(request.getParameter("cita_agendada"))) { %>
<div class="alert alert-success alert-dismissible fade show m-3" role="alert">
    <i class="fas fa-check-circle me-2"></i>
    ¡Cita agendada exitosamente! Nos pondremos en contacto contigo pronto.
    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
</div>
<% } %>

<!-- Carrusel -->
<section class="mb-5">
    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="img/3.jpg" class="d-block w-100" alt="Promoción de Implantes">
                <div class="carousel-caption">
                    <h5>Promoción de Implantes Dentales</h5>
                    <p>Aprovecha nuestras ofertas especiales en implantes dentales.</p>
                    <a href="cita" class="btn btn-light btn-lg mt-2">Agendar Consulta</a>
                </div>
            </div>
            <div class="carousel-item">
                <img src="img/2.webp" class="d-block w-100" alt="Exámenes Gratuitos">
                <div class="carousel-caption">
                    <h5>Exámenes Gratuitos</h5>
                    <p>Realiza tus exámenes dentales sin costo.</p>
                    <a href="cita" class="btn btn-light btn-lg mt-2">Reservar Examen</a>
                </div>
            </div>
            <div class="carousel-item">
                <img src="img/1.png" class="d-block w-100" alt="Tratamientos Integrales">
                <div class="carousel-caption">
                    <h5>Tratamientos Integrales</h5>
                    <p>Descubre nuestros servicios de odontología integral.</p>
                    <a href="cita" class="btn btn-light btn-lg mt-2">Más Información</a>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
            <span class="visually-hidden">Anterior</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
            <span class="visually-hidden">Siguiente</span>
        </button>
    </div>
</section>

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

<!-- Servicios -->
<section id="servicios" class="container mb-5">
    <h2 class="text-center mb-5 text-primary fw-bold">Nuestros Servicios</h2>
    <div class="row text-center">
        <div class="col-md-4 mb-4">
            <div class="service-card p-4">
                <i class="fas fa-tooth fa-4x text-primary mb-3"></i>
                <h5>Implantes Dentales</h5>
                <p>Soluciones permanentes y seguras para reemplazar tus dientes.</p>
                <a href="cita" class="btn btn-outline-primary">Consultar</a>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="service-card p-4">
                <i class="fas fa-x-ray fa-4x text-primary mb-3"></i>
                <h5>Rayos X Digitales</h5>
                <p>Diagnóstico preciso en minutos gracias a la tecnología digital.</p>
                <a href="cita" class="btn btn-outline-primary">Agendar</a>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="service-card p-4">
                <i class="fas fa-child fa-4x text-primary mb-3"></i>
                <h5>Odontopediatría</h5>
                <p>Cuidado dental para los más pequeños en un ambiente seguro y amigable.</p>
                <a href="cita" class="btn btn-outline-primary">Reservar</a>
            </div>
        </div>
    </div>
</section>

<!-- Testimonios -->
<section id="testimonios" class="py-5 bg-light">
    <div class="container">
        <h2 class="text-center mb-5 text-primary fw-bold">Testimonios de Nuestros Pacientes</h2>
        <div class="row g-4">
            <div class="col-md-4">
                <div class="card p-3 shadow-sm h-100 border-0">
                    <div class="d-flex align-items-center mb-3">
                        <img src="img/t1.png" alt="Paciente 1" class="rounded-circle me-3" width="60" height="60">
                        <div>
                            <h6 class="mb-0 fw-semibold">Gabriel Salguero</h6>
                            <small class="text-muted">Paciente de Implantes</small>
                        </div>
                    </div>
                    <p class="mb-0">"Recibí un trato excelente y profesional. ¡Gracias Smile Center!"</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card p-3 shadow-sm h-100 border-0">
                    <div class="d-flex align-items-center mb-3">
                        <img src="img/t2.png" alt="Paciente 2" class="rounded-circle me-3" width="60" height="60">
                        <div>
                            <h6 class="mb-0 fw-semibold">Lesly Becerra</h6>
                            <small class="text-muted">Paciente de Ortodoncia</small>
                        </div>
                    </div>
                    <p class="mb-0">"Tenía miedo al dentista, pero el equipo me hizo sentir cómoda y segura."</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card p-3 shadow-sm h-100 border-0">
                    <div class="d-flex align-items-center mb-3">
                        <img src="img/t3.png" alt="Paciente 3" class="rounded-circle me-3" width="60" height="60">
                        <div>
                            <h6 class="mb-0 fw-semibold">Erick Cadena</h6>
                            <small class="text-muted">Odontopediatría</small>
                        </div>
                    </div>
                    <p class="mb-0">"Mi hijo tuvo una excelente experiencia. Las doctoras son muy amables."</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Ubicación -->
<section id="contacto" class="mb-5">
    <div class="container">
        <div class="card mx-auto shadow" style="max-width: 800px;">
            <div class="card-body">
                <h2 class="card-title text-center mb-4 text-primary">Nuestra Ubicación</h2>
                <div class="ratio ratio-16x9">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3989.7651537512!2d-78.49600988582161!3d-0.18046789986060375!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x91d59b4c7d0f6d1d%3A0x4a8d11d4f8d8f3b5!2sSmile%20Center%20-%20Cl%C3%ADnica%20de%20Implantes%20Dentales%20y%20Odontolog%C3%ADa%20Integral!5e0!3m2!1ses!2sec!4v1685686800000!5m2!1ses!2sec"
                            style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
                <div class="row mt-4">
                    <div class="col-md-6">
                        <h6><i class="fas fa-map-marker-alt text-primary me-2"></i>Dirección</h6>
                        <p>Av. Principal 123, Centro Médico</p>
                    </div>
                    <div class="col-md-6">
                        <h6><i class="fas fa-phone text-primary me-2"></i>Teléfono</h6>
                        <p>+593 99 327 4512</p>
                    </div>
                </div>
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

<!-- WhatsApp -->
<div id="whatsapp"></div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(function () {
        $('#whatsapp').floatingWhatsApp({
            phone: '593993274512',
            popupMessage: 'Hola 👋 ¿En qué podemos ayudarte?',
            showPopup: true,
            position: 'right',
            buttonImage:
                '<img src="https://rawcdn.githack.com/jerfeson/floating-whatsapp/0310b4cd88e9e55dc637d1466670da26b645ae49/whatsapp.svg" />',
            headerTitle: 'Escríbenos por WhatsApp',
            headerColor: '#00a6c7',
            backgroundColor: '#25D366',
            color: '#FFF',
            size: '60px'
        });
    });
</script>
</body>
</html> btn-outline-primary">Reservar</a>
</div>
</div>
</div>
</section>

<!-- Testimonios -->
<section id="testimonios" class="py-5 bg-light">
    <div class="container">
        <h2 class="text-center mb-5 text-primary fw-bold">Testimonios de Nuestros Pacientes</h2>
        <div class="row g-4">
            <div class="col-md-4">
                <div class="card p-3 shadow-sm h-100 border-0">
                    <div class="d-flex align-items-center mb-3">
                        <img src="img/t1.png" alt="Paciente 1" class="rounded-circle me-3" width="60" height="60">
                        <div>
                            <h6 class="mb-0 fw-semibold">Gabriel Salguero</h6>
                            <small class="text-muted">Paciente de Implantes</small>
                        </div>
                    </div>
                    <p class="mb-0">"Recibí un trato excelente y profesional. ¡Gracias Smile Center!"</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card p-3 shadow-sm h-100 border-0">
                    <div class="d-flex align-items-center mb-3">
                        <img src="img/t2.png" alt="Paciente 2" class="rounded-circle me-3" width="60" height="60">
                        <div>
                            <h6 class="mb-0 fw-semibold">Lesly Becerra</h6>
                            <small class="text-muted">Paciente de Ortodoncia</small>
                        </div>
                    </div>
                    <p class="mb-0">"Tenía miedo al dentista, pero el equipo me hizo sentir cómoda y segura."</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card p-3 shadow-sm h-100 border-0">
                    <div class="d-flex align-items-center mb-3">
                        <img src="img/t3.png" alt="Paciente 3" class="rounded-circle me-3" width="60" height="60">
                        <div>
                            <h6 class="mb-0 fw-semibold">Erick Cadena</h6>
                            <small class="text-muted">Odontopediatría</small>
                        </div>
                    </div>
                    <p class="mb-0">"Mi hijo tuvo una excelente experiencia. Las doctoras son muy amables."</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Ubicación -->
<section id="contacto" class="mb-5">
    <div class="container">
        <div class="card mx-auto shadow" style="max-width: 800px;">
            <div class="card-body">
                <h2 class="card-title text-center mb-4 text-primary">Nuestra Ubicación</h2>
                <div class="ratio ratio-16x9">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3989.7651537512!2d-78.49600988582161!3d-0.18046789986060375!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x91d59b4c7d0f6d1d%3A0x4a8d11d4f8d8f3b5!2sSmile%20Center%20-%20Cl%C3%ADnica%20de%20Implantes%20Dentales%20y%20Odontolog%C3%ADa%20Integral!5e0!3m2!1ses!2sec!4v1685686800000!5m2!1ses!2sec"
                            style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
                <div class="row mt-4">
                    <div class="col-md-6">
                        <h6><i class="fas fa-map-marker-alt text-primary me-2"></i>Dirección</h6>
                        <p>Av. Principal 123, Centro Médico</p>
                    </div>
                    <div class="col-md-6">
                        <h6><i class="fas fa-phone text-primary me-2"></i>Teléfono</h6>
                        <p>+593 99 327 4512</p>
                    </div>
                </div>
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

<!-- WhatsApp -->
<div id="whatsapp"></div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(function () {
        $('#whatsapp').floatingWhatsApp({
            phone: '593993274512',
            popupMessage: 'Hola 👋 ¿En qué podemos ayudarte?',
            showPopup: true,
            position: 'right',
            buttonImage:
                '<img src="https://rawcdn.githack.com/jerfeson/floating-whatsapp/0310b4cd88e9e55dc637d1466670da26b645ae49/whatsapp.svg" />',
            headerTitle: 'Escríbenos por WhatsApp',
            headerColor: '#00a6c7',
            backgroundColor: '#25D366',
            color: '#FFF',
            size: '60px'
        });
    });
</script>

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