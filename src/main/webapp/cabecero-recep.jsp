<%--
  Created by IntelliJ IDEA.
  User: USUARIO
  Date: 11/6/2025
  Time: 8:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>Clínica Dental</title>

    <!-- Bootstrap CSS desde CDN -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- Font Awesome desde CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- AdminLTE CSS desde CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/2.4.18/css/AdminLTE.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/2.4.18/css/skins/_all-skins.min.css">
    <!-- Favicon -->
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/public/img/apple-touch-icon.png">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/public/img/favicon.ico">
    <!-- DataTables CSS desde CDN -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.7.1/css/buttons.dataTables.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.5/css/responsive.dataTables.min.css">
    <!-- Bootstrap Select CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.min.css">
</head>

<body class="hold-transition skin-blue-light sidebar-mini">
<div class="wrapper">

    <header class="main-header">
        <a href="index2.html" class="logo">
            <span class="logo-mini"><b>CD</b></span>
            <span class="logo-lg"><b>Clínica Dental</b></span>
        </a>
        <nav class="navbar navbar-static-top" role="navigation">
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Navegación</span>
            </a>
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="" class="user-image" alt="User Image">
                            <span class="hidden-xs">Dr. John Doe</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="user-header">
                                <img src="" class="img-circle" alt="User Image">
                                <p>
                                    Dr. John Doe
                                    <small>Odontólogo</small>
                                </p>
                            </li>
                            <li class="user-footer">
                                <div class="pull-right">
                                    <a href="#" class="btn btn-default btn-flat">Cerrar</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </header>

    <aside class="main-sidebar">
        <section class="sidebar">
            <ul class="sidebar-menu">
                <li class="header">MENÚ PRINCIPAL</li>
                <li>
                    <a href="login.jsp">
                        <i class="fa fa-cogs"></i> <span>Login</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fa fa-tasks"></i> <span>Escritorio</span>
                    </a>
                </li>

                <li><a href="${pageContext.request.contextPath}/agendar-cita.jsp"><i class="fa fa-circle-o"></i> Agendar Cita</a></li>
                <li><a href="${pageContext.request.contextPath}/listar-doctores.jsp"><i class="fa fa-circle-o"></i> Nuevo Doctor</a></li>
                <li><a href="${pageContext.request.contextPath}/ver-paciente.jsp"><i class="fa fa-circle-o"></i> Ver Pacientes</a></li>
                <!-- Sección de Pacientes eliminada -->
                <li>
                    <a href="#">
                        <i class="fa fa-plus-square"></i> <span>Ayuda</span>
                        <small class="label pull-right bg-red">PDF</small>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fa fa-info-circle"></i> <span>Acerca De...</span>
                        <small class="label pull-right bg-yellow">IT</small>
                    </a>
                </li>
            </ul>
        </section>
    </aside>
</div>

</body>
</html>
