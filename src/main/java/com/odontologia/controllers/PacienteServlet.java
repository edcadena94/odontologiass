package com.odontologia.controllers;

import com.odontologia.models.Paciente;
import com.odontologia.services.PacienteService;
import com.odontologia.services.PacienteServiceJdbcImplement;
import com.odontologia.util.Conexion;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/paciente")
public class PacienteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        try (Connection conn = Conexion.getConnection()) {
            PacienteService pacienteService = new PacienteServiceJdbcImplement(conn);

            if ("listar".equals(accion) || accion == null) {
                // Listar todos los pacientes
                List<Paciente> listaPacientes = pacienteService.listarTodos();
                request.setAttribute("listaPacientes", listaPacientes);
                request.getRequestDispatcher("/listar-pacientes.jsp").forward(request, response);

            } else if ("nuevo".equals(accion)) {
                // Mostrar formulario para nuevo paciente
                request.getRequestDispatcher("/nuevo-paciente.jsp").forward(request, response);

            } else if ("editar".equals(accion)) {
                // Mostrar formulario para editar paciente
                int id = Integer.parseInt(request.getParameter("id"));
                Paciente paciente = pacienteService.buscarPorId(id);
                if (paciente != null) {
                    request.setAttribute("paciente", paciente);
                    request.getRequestDispatcher("/editar-paciente.jsp").forward(request, response);
                } else {
                    response.sendRedirect("paciente?error=not_found");
                }

            } else if ("ver".equals(accion)) {
                // Ver detalles del paciente
                int id = Integer.parseInt(request.getParameter("id"));
                Paciente paciente = pacienteService.buscarPorId(id);
                if (paciente != null) {
                    request.setAttribute("paciente", paciente);
                    request.getRequestDispatcher("/ver-paciente.jsp").forward(request, response);
                } else {
                    response.sendRedirect("paciente?error=not_found");
                }

            } else if ("buscar".equals(accion)) {
                // Buscar pacientes por nombre
                String nombre = request.getParameter("nombre");
                List<Paciente> listaPacientes = pacienteService.buscarPorNombre(nombre);
                request.setAttribute("listaPacientes", listaPacientes);
                request.setAttribute("termino", nombre);
                request.getRequestDispatcher("/listar-pacientes.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String accion = request.getParameter("accion");

        try (Connection conn = Conexion.getConnection()) {
            PacienteService pacienteService = new PacienteServiceJdbcImplement(conn);

            if ("crear".equals(accion)) {
                // Crear nuevo paciente
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String fechaNacimientoStr = request.getParameter("fechaNacimiento");
                String telefono = request.getParameter("telefono");
                String email = request.getParameter("email");
                String direccion = request.getParameter("direccion");

                // Validaciones básicas
                if (nombre == null || nombre.trim().isEmpty() ||
                        apellido == null || apellido.trim().isEmpty() ||
                        fechaNacimientoStr == null || fechaNacimientoStr.trim().isEmpty()) {
                    response.sendRedirect("paciente?accion=nuevo&error=campos_vacios");
                    return;
                }

                // Verificar si el email ya existe
                if (email != null && !email.trim().isEmpty() && pacienteService.existeEmail(email)) {
                    response.sendRedirect("paciente?accion=nuevo&error=email_existe");
                    return;
                }

                LocalDate fechaNacimiento = LocalDate.parse(fechaNacimientoStr);

                Paciente paciente = new Paciente();
                paciente.setNombre(nombre.trim());
                paciente.setApellido(apellido.trim());
                paciente.setFechaNacimiento(fechaNacimiento);
                paciente.setTelefono(telefono != null ? telefono.trim() : "");
                paciente.setEmail(email != null ? email.trim() : "");
                paciente.setDireccion(direccion != null ? direccion.trim() : "");

                boolean guardado = pacienteService.guardar(paciente);

                if (guardado) {
                    response.sendRedirect("paciente?success=created");
                } else {
                    response.sendRedirect("paciente?accion=nuevo&error=no_guardado");
                }

            } else if ("actualizar".equals(accion)) {
                // Actualizar paciente existente
                int id = Integer.parseInt(request.getParameter("id"));
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String fechaNacimientoStr = request.getParameter("fechaNacimiento");
                String telefono = request.getParameter("telefono");
                String email = request.getParameter("email");
                String direccion = request.getParameter("direccion");

                // Validaciones básicas
                if (nombre == null || nombre.trim().isEmpty() ||
                        apellido == null || apellido.trim().isEmpty() ||
                        fechaNacimientoStr == null || fechaNacimientoStr.trim().isEmpty()) {
                    response.sendRedirect("paciente?accion=editar&id=" + id + "&error=campos_vacios");
                    return;
                }

                LocalDate fechaNacimiento = LocalDate.parse(fechaNacimientoStr);

                Paciente paciente = new Paciente();
                paciente.setIdPaciente(id);
                paciente.setNombre(nombre.trim());
                paciente.setApellido(apellido.trim());
                paciente.setFechaNacimiento(fechaNacimiento);
                paciente.setTelefono(telefono != null ? telefono.trim() : "");
                paciente.setEmail(email != null ? email.trim() : "");
                paciente.setDireccion(direccion != null ? direccion.trim() : "");

                boolean actualizado = pacienteService.actualizar(paciente);

                if (actualizado) {
                    response.sendRedirect("paciente?success=updated");
                } else {
                    response.sendRedirect("paciente?accion=editar&id=" + id + "&error=no_actualizado");
                }

            } else if ("eliminar".equals(accion)) {
                // Eliminar paciente
                int id = Integer.parseInt(request.getParameter("id"));
                boolean eliminado = pacienteService.eliminar(id);

                if (eliminado) {
                    response.sendRedirect("paciente?success=deleted");
                } else {
                    response.sendRedirect("paciente?error=no_eliminado");
                }
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("paciente?error=datos_invalidos");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("paciente?error=error_interno");
        }
    }
}