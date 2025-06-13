<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Registrar Paciente - Clínica Dental</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="css/crud.css" rel="stylesheet">
    <style>
        .is-invalid {
            border-color: #dc3545;
        }
        .invalid-feedback {
            color: #dc3545;
            font-size: 0.875em;
            display: none;
        }
        .is-invalid ~ .invalid-feedback {
            display: block;
        }
        .alert-success {
            border-left: 5px solid #28a745;
            animation: fadeIn 0.5s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card border-primary">
                <div class="card-header text-white bg-primary text-center">
                    <h3><i class="fas fa-user-plus me-2"></i>Registrar Nuevo Paciente</h3>
                </div>
                <div class="card-body p-4">

                    <!-- Mensajes del servidor -->
                    <% if ("campos_vacios".equals(request.getParameter("error"))) { %>
                    <div class="alert alert-danger alert-dismissible fade show">
                        <strong><i class="fas fa-exclamation-circle me-2"></i>Error:</strong> Todos los campos obligatorios deben ser completados.
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                    <% } else if ("email_existe".equals(request.getParameter("error"))) { %>
                    <div class="alert alert-warning alert-dismissible fade show">
                        <strong><i class="fas fa-exclamation-triangle me-2"></i>Advertencia:</strong> El email ingresado ya está registrado.
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                    <% } else if ("no_guardado".equals(request.getParameter("error"))) { %>
                    <div class="alert alert-danger alert-dismissible fade show">
                        <strong><i class="fas fa-times-circle me-2"></i>Error:</strong> No se pudo guardar el paciente. Intente nuevamente.
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                    <% } else if ("telefono_invalido".equals(request.getParameter("error"))) { %>
                    <div class="alert alert-danger alert-dismissible fade show">
                        <strong><i class="fas fa-phone-slash me-2"></i>Error:</strong> El número de teléfono no es válido.
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                    <% } else if ("fecha_invalida".equals(request.getParameter("error"))) { %>
                    <div class="alert alert-danger alert-dismissible fade show">
                        <strong><i class="fas fa-calendar-times me-2"></i>Error:</strong> La fecha de nacimiento no es válida.
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                    <% } else if ("guardado_exitoso".equals(request.getParameter("status"))) { %>
                    <div class="alert alert-success alert-dismissible fade show">
                        <strong><i class="fas fa-check-circle me-2"></i>Éxito:</strong> Se ha guardado el paciente correctamente.
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                    <% } %>

                    <form action="pacientes" method="post" id="formPaciente" class="needs-validation" novalidate>
                        <input type="hidden" name="accion" value="crear">

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    <i class="fas fa-user text-primary me-2"></i>Nombre
                                </label>
                                <input type="text" name="nombre" class="form-control" required
                                       placeholder="Ingrese el nombre">
                                <div class="invalid-feedback">
                                    Por favor ingrese el nombre del paciente
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    <i class="fas fa-user text-primary me-2"></i>Apellido
                                </label>
                                <input type="text" name="apellido" class="form-control" required
                                       placeholder="Ingrese el apellido">
                                <div class="invalid-feedback">
                                    Por favor ingrese el apellido del paciente
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    <i class="fas fa-calendar-alt text-primary me-2"></i>Fecha de Nacimiento
                                </label>
                                <input type="date" name="fecha_nacimiento" class="form-control" required>
                                <div class="invalid-feedback">
                                    Por favor seleccione la fecha de nacimiento
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    <i class="fas fa-venus-mars text-primary me-2"></i>Sexo
                                </label>
                                <select name="sexo" class="form-select" required>
                                    <option value="">Seleccione sexo</option>
                                    <option value="M">Masculino</option>
                                    <option value="F">Femenino</option>
                                </select>
                                <div class="invalid-feedback">
                                    Por favor seleccione el sexo del paciente
                                </div>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">
                                <i class="fas fa-home text-primary me-2"></i>Dirección
                            </label>
                            <input type="text" name="direccion" class="form-control" required
                                   placeholder="Ingrese la dirección">
                            <div class="invalid-feedback">
                                Por favor ingrese la dirección del paciente
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">
                                <i class="fas fa-phone text-primary me-2"></i>Teléfono
                            </label>
                            <input type="tel" name="telefono" class="form-control" required
                                   placeholder="Ingrese el teléfono">
                            <div class="invalid-feedback">
                                Por favor ingrese un número de teléfono válido (8-15 dígitos)
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">
                                <i class="fas fa-envelope text-primary me-2"></i>Email
                            </label>
                            <input type="email" name="email" class="form-control" required
                                   placeholder="paciente@clinica.com">
                            <div class="invalid-feedback">
                                Por favor ingrese un email válido (ejemplo: usuario@dominio.com)
                            </div>
                        </div>

                        <div class="text-center pt-3">
                            <button type="submit" class="btn btn-success btn-lg me-3">
                                <i class="fas fa-save me-2"></i>Guardar Paciente
                            </button>
                            <div class="mt-4 text-center">
                                <a href="cabecero-recep.jsp" class="btn btn-secondary">
                                    <i class="fas fa-home me-2"></i>Volver al Inicio
                                </a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Validación en tiempo real para campos específicos
    document.addEventListener('DOMContentLoaded', function() {
        const form = document.getElementById('formPaciente');

        // Validación para teléfono
        const telefonoInput = document.querySelector('input[name="telefono"]');
        if (telefonoInput) {
            telefonoInput.addEventListener('blur', function() {
                if (this.value && !/^[\d\s+-]{8,15}$/.test(this.value)) {
                    this.classList.add('is-invalid');
                } else {
                    this.classList.remove('is-invalid');
                }
            });
        }

        // Validación para email
        const emailInput = document.querySelector('input[name="email"]');
        if (emailInput) {
            emailInput.addEventListener('blur', function() {
                if (this.value && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(this.value)) {
                    this.classList.add('is-invalid');
                } else {
                    this.classList.remove('is-invalid');
                }
            });
        }

        // Validación para todos los campos obligatorios
        const camposObligatorios = form.querySelectorAll('[required]');
        camposObligatorios.forEach(campo => {
            campo.addEventListener('blur', function() {
                if (!this.value.trim()) {
                    this.classList.add('is-invalid');
                } else {
                    this.classList.remove('is-invalid');
                }
            });
        });

        // Validación al enviar el formulario
        form.addEventListener('submit', function(event) {
            let formValido = true;

            // Validar todos los campos obligatorios
            camposObligatorios.forEach(campo => {
                if (!campo.value.trim()) {
                    campo.classList.add('is-invalid');
                    formValido = false;
                }
            });

            // Validación específica para teléfono
            if (telefonoInput && telefonoInput.value && !/^[\d\s+-]{8,15}$/.test(telefonoInput.value)) {
                telefonoInput.classList.add('is-invalid');
                formValido = false;
            }

            // Validación específica para email
            if (emailInput && emailInput.value && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(emailInput.value)) {
                emailInput.classList.add('is-invalid');
                formValido = false;
            }

            if (!formValido) {
                event.preventDefault();
                event.stopPropagation();

                // Desplazarse al primer error
                const primerError = form.querySelector('.is-invalid');
                if (primerError) {
                    primerError.scrollIntoView({
                        behavior: 'smooth',
                        block: 'center'
                    });
                }
            }
        }, false);

        // Auto-cierre de mensaje de éxito después de 5 segundos
        const successAlert = document.querySelector('.alert-success');
        if (successAlert) {
            setTimeout(() => {
                const bsAlert = new bootstrap.Alert(successAlert);
                bsAlert.close();
            }, 5000);

            // Limpiar el formulario después de guardar exitosamente
            form.reset();
        }
    });
</script>
</body>
</html>
