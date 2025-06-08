<%--
  Created by IntelliJ IDEA.
  User: Clinica de Odontología
  Date: 2/6/2025
  Time: 18:54
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Smile Center - Clínica de Implantes Dentales y Odontología Integral</title>

    <!-- Bootstrap CSS y JS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
    <script src="bootstrap/js/bootstrap.bundle.js" defer></script>

    <!-- Icono favicon -->
    <link rel="icon" href="favicon.ico" type="image/x-icon" />

    <!-- Google Fonts y FontAwesome -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <!-- Enlazar CSS Floating WhatsApp -->
    <link rel="stylesheet" href="https://rawcdn.githack.com/jerfeson/floating-whatsapp/0310b4cd88e9e55dc637d1466670da26b645ae49/floating-wpp.min.css" />

    <script>
        window.onload = function() {
            // Mostrar mensaje de éxito si existe la bandera en localStorage
            if(localStorage.getItem("citaAgendada") === "ok") {
                var modal = new bootstrap.Modal(document.getElementById('modalCitaAgendada'));
                modal.show();
                localStorage.removeItem("citaAgendada");
            }
        }
    </script>

    <!-- Enlazar JS Floating WhatsApp -->
    <script type="text/javascript" src="https://rawcdn.githack.com/jerfeson/floating-whatsapp/0310b4cd88e9e55dc637d1466670da26b645ae49/floating-wpp.min.js" defer></script>

    <style>
        :root {
            --primary-color: #00a6c7;
            --secondary-color: #005f73;
            --accent-color: #94d2bd;
            --text-color: #2b2d42;
            --light-bg: #f8f9fa;
            --white: #ffffff;
            --success: #2dd4bf;
            --warning: #fbbf24;
            --error: #ef4444;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            font-family: 'Poppins', sans-serif;
            line-height: 1.6;
            color: var(--text-color);
            background-color: var(--white);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* Navbar */
        .navbar {
            background: rgba(255, 255, 255, 0.95) !important;
            backdrop-filter: blur(10px);
            box-shadow: 0 2px 20px rgba(0, 0, 0, 0.08);
            padding: 1rem 0;
        }

        .navbar-brand {
            font-size: 1.75rem;
            font-weight: 700;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .nav-link {
            position: relative;
            font-weight: 500;
            padding: 0.5rem 1rem;
            margin: 0 0.25rem;
            color: var(--text-color) !important;
        }

        .nav-link::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            width: 0;
            height: 2px;
            background: var(--primary-color);
            transition: all 0.3s ease;
            transform: translateX(-50%);
        }

        .nav-link:hover::after {
            width: 100%;
        }

        /* Botones */
        .btn-modern {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: var(--white);
            padding: 0.8rem 2rem;
            border-radius: 50px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            border: none;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(0, 166, 199, 0.2);
        }

        .btn-modern:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(0, 166, 199, 0.3);
            color: var(--white);
        }

        .btn-outline-modern {
            color: var(--primary-color);
            border: 2px solid var(--primary-color);
            background-color: transparent;
            padding: 0.7rem 1.8rem;
            border-radius: 50px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-outline-modern:hover {
            background-color: var(--primary-color);
            color: var(--white);
        }

        /* Carrusel */
        .carousel {
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            margin: 0 auto;
            max-width: 1200px;
        }

        .carousel-inner {
            position: relative;
            width: 100%;
            aspect-ratio: 16/9;
        }

        .carousel-item {
            position: relative;
            width: 100%;
            height: 100%;
        }

        .carousel-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            object-position: center;
        }

        .carousel-caption {
            background: linear-gradient(rgba(0, 166, 199, 0.85), rgba(0, 95, 115, 0.85));
            border-radius: 15px;
            padding: 1.5rem;
            backdrop-filter: blur(8px);
            max-width: 80%;
            margin: 0 auto;
            bottom: 2rem;
            left: 50%;
            transform: translateX(-50%);
        }

        /* Cards */
        .card {
            border: none;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            overflow: hidden;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.1);
        }

        .card-title {
            color: var(--secondary-color);
            font-weight: 700;
            margin-bottom: 1rem;
        }

        .card-img-top {
            width: 100%;
            height: 250px;
            object-fit: cover;
        }

        /* Botón agendar */
        .btn-agendar {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: var(--white);
            padding: 1rem 2.5rem;
            border-radius: 50px;
            font-weight: 600;
            font-size: 1.1rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            border: none;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(0, 166, 199, 0.3);
            display: inline-flex;
            align-items: center;
            gap: 0.75rem;
        }

        .btn-agendar:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(0, 166, 199, 0.4);
            background: linear-gradient(135deg, var(--secondary-color), var(--primary-color));
            color: var(--white);
        }

        /* Footer */
        footer {
            background-color: var(--light-bg);
            color: var(--secondary-color);
            padding: 1.5rem 0;
            margin-top: auto;
            border-top: 1px solid rgba(0, 0, 0, 0.05);
        }

        /* Media Queries */
        @media (max-width: 1200px) {
            .carousel {
                max-width: 100%;
                border-radius: 0;
            }
        }

        @media (max-width: 768px) {
            .btn-agendar {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
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
                <li class="nav-item">
                    <a class="nav-link" href="#servicios">Servicios</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="historia_clinica.jsp">Promociones</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="agendar-cita.jsp">Contáctanos</a>
                </li>
                <li class="nav-item">
                    <a class="btn btn-modern ms-3" href="login.jsp">Iniciar Sesión</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Carrusel de promociones -->
<section class="mb-5">
    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="img/3.jpg" class="d-block" alt="Promoción de Implantes">
                <div class="carousel-caption">
                    <h5>Promoción de Implantes Dentales</h5>
                    <p>Aprovecha nuestras ofertas especiales en implantes dentales.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="img/2.webp" class="d-block" alt="Exámenes Gratuitos">
                <div class="carousel-caption">
                    <h5>Exámenes Gratuitos</h5>
                    <p>Realiza tus exámenes dentales sin costo.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="img/1.png" class="d-block" alt="Tratamientos Integrales">
                <div class="carousel-caption">
                    <h5>Tratamientos Integrales</h5>
                    <p>Descubre nuestros servicios de odontología integral.</p>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Anterior</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Siguiente</span>
        </button>
    </div>
</section>

<!-- Servicios destacados -->
<section id="servicios" class="container mb-5">
    <div class="row text-center">
        <div class="col-md-4 mb-4">
            <i class="fas fa-tooth fa-4x text-primary mb-3"></i>
            <h5>Implantes Dentales</h5>
            <p>Soluciones permanentes y seguras para reemplazar tus dientes.</p>
        </div>
        <div class="col-md-4 mb-4">
            <i class="fas fa-x-ray fa-4x text-primary mb-3"></i>
            <h5>Rayos X Digitales</h5>
            <p>Diagnóstico preciso en minutos gracias a la tecnología digital.</p>
        </div>
        <div class="col-md-4 mb-4">
            <i class="fas fa-child fa-4x text-primary mb-3"></i>
            <h5>Odontopediatría</h5>
            <p>Cuidado dental para los más pequeños en un ambiente seguro y amigable.</p>
        </div>
    </div>
</section>

<!-- Modal confirmación de cita -->
<div class="modal fade" id="modalCitaAgendada" tabindex="-1" aria-labelledby="modalCitaLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content rounded-4 shadow">
            <div class="modal-header bg-primary text-white border-0">
                <h5 class="modal-title" id="modalCitaLabel">Cita Agendada</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Cerrar"></button>
            </div>
            <div class="modal-body text-center">
                <p>¡Gracias por agendar tu cita con Smile Center!</p>
                <p>Nos pondremos en contacto contigo para confirmar los detalles.</p>
                <i class="fas fa-check-circle fa-4x text-success"></i>
            </div>

        </div>
    </div>
</div>

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
                    <p class="mb-0">"Recibí un trato excelente y profesional. Mi sonrisa cambió por completo. ¡Gracias Smile Center!"</p>
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
                    <p class="mb-0">"Tenía miedo al dentista, pero el equipo me hizo sentir cómoda y segura. ¡Muy recomendados!"</p>
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
                    <p class="mb-0">"Mi hijo tuvo una excelente experiencia. Las doctoras son muy amables y pacientes."</p>
                </div>
            </div>
        </div>
    </div>
</section>


<section class="mb-5">
    <div class="card mx-auto" style="max-width: 800px;">
        <div class="card-body">
            <h2 class="card-title text-center mb-4">Ubicación</h2>
            <div class="ratio ratio-16x9">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3989.7651537512!2d-78.49600988582161!3d-0.18046789986060375!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x91d59b4c7d0f6d1d%3A0x4a8d11d4f8d8f3b5!2sSmile%20Center%20-%20Cl%C3%ADnica%20de%20Implantes%20Dentales%20y%20Odontolog%C3%ADa%20Integral!5e0!3m2!1ses!2sec!4v1685686800000!5m2!1ses!2sec"
                        style="border:0;"
                        allowfullscreen=""
                        loading="lazy"
                        referrerpolicy="no-referrer-when-downgrade">
                </iframe>
            </div>
        </div>
    </div>
</section>
</main>

<!-- Footer -->
<footer class="text-center">
    <div class="container">
        <p class="mb-1">© 2025 Smile Center - Todos los derechos reservados</p>
    </div>
</footer>

<!-- WhatsApp Flotante -->
<div id="whatsapp"></div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(function() {
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
</html>