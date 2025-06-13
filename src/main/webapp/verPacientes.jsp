<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Pacientes Registrados</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Pacientes Registrados</h1>

    <c:if test="${empty pacientes}">
        <p class="alert alert-info text-center">No hay pacientes registrados.</p>
    </c:if>

    <c:if test="${not empty pacientes}">
        <table class="table table-striped table-bordered mt-4">
            <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Fecha de Nacimiento</th>
                <th>Sexo</th>
                <th>Dirección</th>
                <th>Teléfono</th>
                <th>Email</th>
                <th>Acciones</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="paciente" items="${pacientes}">
                <tr>
                    <td>${paciente.idPaciente}</td>
                    <td>${paciente.nombre}</td>
                    <td>${paciente.apellido}</td>
                    <td>
                        <c:out value="${paciente.fechaNacimiento}" />
                        <!-- Si quieres formato yyyy-MM-dd, podríamos hacer algo en el Servlet -->
                    </td>
                    <td>${paciente.sexo}</td>
                    <td>${paciente.direccion}</td>
                    <td>${paciente.telefono}</td>
                    <td>${paciente.email}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/pacientes?accion=editar&id=${paciente.idPaciente}" class="btn btn-sm btn-warning">Editar</a>
                        <a href="${pageContext.request.contextPath}/pacientes?accion=eliminar&id=${paciente.idPaciente}"
                           class="btn btn-sm btn-danger"
                           onclick="return confirm('¿Está seguro de eliminar este paciente?');">Eliminar</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>

    <div class="text-center mt-4">
        <a href="${pageContext.request.contextPath}/registrarPaciente.jsp" class="btn btn-primary">Registrar Nuevo Paciente</a>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
