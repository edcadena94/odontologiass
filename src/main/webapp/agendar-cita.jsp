<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.odontologia.models.Paciente" %>
<%@ page import="com.odontologia.models.Doctor" %>

<%-- Control de acceso: solo recepcionista --%>
<%
    String rol = (String) session.getAttribute("rol");
    if (rol == null || !"recepcionista".equals(rol)) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Agendar Cita - Clínica Dental</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <!-- CSS personalizado -->
    <link href="css/citas.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10">

            <!-- Card principal -->
            <div class="card shadow">
                <div class="card-header text-center">
                    <h3><i class="fas fa-calendar-plus me-2"></i>Agendar Nueva Cita</h3>

                </div>

                <div class="card-body p-4">

                    <!-- Mensajes de estado -->
                    <% if ("true".equals(request.getParameter("success"))) { %>
                    <div class="alert alert-success alert-dismissible fade show">
                        <i class="fas fa-check-circle me-2"></i>
                        ¡Cita agendada exitosamente!
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                    <% } %>

                    <% if ("true".equals(request.getParameter("error"))) { %>
                    <div class="alert alert-danger alert-dismissible fade show">
                        <i class="fas fa-exclamation-circle me-2"></i>
                        Error al agendar la cita. Intente nuevamente.
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                    <% } %>

                    <!-- Formulario -->
                    <form action="cita" method="post" id="formCita">
                        <div class="row">
                            <!-- Paciente -->
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    <i class="fas fa-user text-primary me-2"></i>Paciente
                                </label>
                                <select name="idPaciente" class="form-select" required>
                                    <option value="">Seleccionar paciente</option>
                                    <%
                                        List<Paciente> listaPacientes = (List<Paciente>) request.getAttribute("listaPacientes");
                                        if (listaPacientes != null) {
                                            for (Paciente paciente : listaPacientes) {
                                    %>
                                    <option value="<%= paciente.getIdPaciente() %>">
                                        <%= paciente.getNombre() %> <%= paciente.getApellido() %>
                                    </option>
                                    <%
                                            }
                                        }
                                    %>
                                </select>
                            </div>

                            <!-- Doctor -->
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    <i class="fas fa-user-md text-primary me-2"></i>Doctor
                                </label>
                                <select name="idDoctor" class="form-select" required>
                                    <option value="">Seleccionar doctor</option>
                                    <%
                                        List<Doctor> listaDoctores = (List<Doctor>) request.getAttribute("listaDoctores");
                                        if (listaDoctores != null) {
                                            for (Doctor doctor : listaDoctores) {
                                    %>
                                    <option value="<%= doctor.getIdDoctor() %>">
                                        Dr. <%= doctor.getNombre() %> <%= doctor.getApellido() %>
                                        <% if (doctor.getEspecialidad() != null && !doctor.getEspecialidad().isEmpty()) { %>
                                        - <%= doctor.getEspecialidad() %>
                                        <% } %>
                                    </option>
                                    <%
                                            }
                                        }
                                    %>
                                </select>
                            </div>
                        </div>

                        <div class="row">
                            <!-- Fecha -->
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    <i class="fas fa-calendar text-primary me-2"></i>Fecha
                                </label>
                                <input type="date" name="fecha" class="form-control" required>
                            </div>

                            <!-- Hora -->
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    <i class="fas fa-clock text-primary me-2"></i>Hora
                                </label>
                                <select name="hora" class="form-select" required>
                                    <option value="">Seleccionar hora</option>
                                    <option value="08:00">08:00 AM</option>
                                    <option value="08:30">08:30 AM</option>
                                    <option value="09:00">09:00 AM</option>
                                    <option value="09:30">09:30 AM</option>
                                    <option value="10:00">10:00 AM</option>
                                    <option value="10:30">10:30 AM</option>
                                    <option value="11:00">11:00 AM</option>
                                    <option value="11:30">11:30 AM</option>
                                    <option value="14:00">02:00 PM</option>
                                    <option value="14:30">02:30 PM</option>
                                    <option value="15:00">03:00 PM</option>
                                    <option value="15:30">03:30 PM</option>
                                    <option value="16:00">04:00 PM</option>
                                    <option value="16:30">04:30 PM</option>
                                    <option value="17:00">05:00 PM</option>
                                    <option value="17:30">05:30 PM</option>
                                </select>
                            </div>
                        </div>

                        <!-- Motivo -->
                        <div class="mb-4">
                            <label class="form-label">
                                <i class="fas fa-notes-medical text-primary me-2"></i>Motivo de la consulta
                            </label>
                            <textarea name="motivo" class="form-control" rows="3"
                                      placeholder="Describa el motivo de la consulta..."></textarea>
                        </div>

                        <!-- Botones -->
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary btn-lg me-3">
                                <i class="fas fa-save me-2"></i>Agendar Cita
                            </button>
                            <a href="index.jsp" class="btn btn-outline-secondary btn-lg">
                                <i class="fas fa-times me-2"></i>Cancelar
                            </a>
                            <div class="mt-4 text-center">
                                <a href="cabecero-recep.jsp" class="btn btn-secondary">
                                    <i class="fas fa-home me-2"></i>Volver al Inicio
                                </a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Card de información -->
            <div class="card mt-3 info-card">
                <div class="card-body">
                    <h6 class="text-primary mb-3">
                        <i class="fas fa-info-circle me-2"></i>Información Importante
                    </h6>
                    <div class="row">
                        <div class="col-md-6">
                            <ul class="list-unstyled">
                                <li><i class="fas fa-clock text-muted me-2"></i>Horarios: 8:00 AM - 6:00 PM</li>
                                <li><i class="fas fa-calendar-times text-muted me-2"></i>No citas en fechas pasadas</li>
                            </ul>
                        </div>
                        <div class="col-md-6">
                            <ul class="list-unstyled">
                                <li><i class="fas fa-stopwatch text-muted me-2"></i>Duración: 30 minutos aprox.</li>
                                <li><i class="fas fa-phone text-muted me-2"></i>Cancelar con 24hrs anticipación</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Script personalizado -->
<script>
    // Validar fecha mínima (hoy)
    document.addEventListener('DOMContentLoaded', function() {
        const fechaInput = document.querySelector('input[name="fecha"]');
        const hoy = new Date().toISOString().split('T')[0];
        fechaInput.min = hoy;
    });

    // Validación del formulario
    document.getElementById('formCita').addEventListener('submit', function(e) {
        const paciente = document.querySelector('select[name="idPaciente"]').value;
        const doctor = document.querySelector('select[name="idDoctor"]').value;
        const fecha = document.querySelector('input[name="fecha"]').value;
        const hora = document.querySelector('select[name="hora"]').value;

        if (!paciente || !doctor || !fecha || !hora) {
            e.preventDefault();
            alert('Por favor complete todos los campos obligatorios.');
            return false;
        }
    });

    // Auto-ocultar alertas después de 5 segundos
    setTimeout(function() {
        const alertas = document.querySelectorAll('.alert');
        alertas.forEach(function(alerta) {
            const bsAlert = new bootstrap.Alert(alerta);
            bsAlert.close();
        });
    }, 5000);
</script>
</body>
</html>