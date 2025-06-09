package com.odontologia.models;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.Period;

public class Paciente {
    private Integer idPaciente;
    private String nombre;
    private String apellido;
    private LocalDate fechaNacimiento;
    private String telefono;
    private String email;
    private String direccion;

    // Constructor vacío
    public Paciente() {}

    // Constructor completo
    public Paciente(String nombre, String apellido, LocalDate fechaNacimiento, String telefono, String email, String direccion) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.fechaNacimiento = fechaNacimiento;
        this.telefono = telefono;
        this.email = email;
        this.direccion = direccion;
    }

    // Constructor con ID (para actualizaciones)
    public Paciente(Integer idPaciente, String nombre, String apellido, LocalDate fechaNacimiento, String telefono, String email, String direccion) {
        this.idPaciente = idPaciente;
        this.nombre = nombre;
        this.apellido = apellido;
        this.fechaNacimiento = fechaNacimiento;
        this.telefono = telefono;
        this.email = email;
        this.direccion = direccion;
    }

    // GETTERS
    public Integer getIdPaciente() {
        return idPaciente;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public LocalDate getFechaNacimiento() {
        return fechaNacimiento;
    }

    public String getTelefono() {
        return telefono;
    }

    public String getEmail() {
        return email;
    }

    public String getDireccion() {
        return direccion;
    }

    // SETTERS
    public void setIdPaciente(Integer idPaciente) {
        this.idPaciente = idPaciente;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public void setFechaNacimiento(LocalDate fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    // MÉTODOS DE UTILIDAD
    public String getNombreCompleto() {
        return (nombre != null ? nombre : "") + " " + (apellido != null ? apellido : "");
    }

    public String getFechaNacimientoFormateada() {
        return fechaNacimiento != null ? fechaNacimiento.format(DateTimeFormatter.ofPattern("dd/MM/yyyy")) : "";
    }

    public String getFechaNacimientoISO() {
        return fechaNacimiento != null ? fechaNacimiento.toString() : "";
    }

    public int getEdad() {
        if (fechaNacimiento != null) {
            return Period.between(fechaNacimiento, LocalDate.now()).getYears();
        }
        return 0;
    }

    public boolean esMayorDeEdad() {
        return getEdad() >= 18;
    }

    public boolean esMenor() {
        return getEdad() < 18;
    }

    public boolean esAdultoMayor() {
        return getEdad() >= 65;
    }

    public String getIniciales() {
        String inicialNombre = (nombre != null && !nombre.isEmpty()) ? nombre.substring(0, 1).toUpperCase() : "";
        String inicialApellido = (apellido != null && !apellido.isEmpty()) ? apellido.substring(0, 1).toUpperCase() : "";
        return inicialNombre + inicialApellido;
    }

    public boolean tieneTelefono() {
        return telefono != null && !telefono.trim().isEmpty();
    }

    public boolean tieneEmail() {
        return email != null && !email.trim().isEmpty();
    }

    public boolean tieneDireccion() {
        return direccion != null && !direccion.trim().isEmpty();
    }

    public boolean esValido() {
        return nombre != null && !nombre.trim().isEmpty() &&
                apellido != null && !apellido.trim().isEmpty() &&
                fechaNacimiento != null;
    }

    public String getEdadTexto() {
        int edad = getEdad();
        if (edad == 1) {
            return edad + " año";
        } else {
            return edad + " años";
        }
    }

    public String getGrupoEtario() {
        int edad = getEdad();
        if (edad < 12) return "Niño";
        if (edad < 18) return "Adolescente";
        if (edad < 65) return "Adulto";
        return "Adulto Mayor";
    }

    @Override
    public String toString() {
        return "Paciente{" +
                "idPaciente=" + idPaciente +
                ", nombre='" + nombre + '\'' +
                ", apellido='" + apellido + '\'' +
                ", fechaNacimiento=" + fechaNacimiento +
                ", telefono='" + telefono + '\'' +
                ", email='" + email + '\'' +
                ", direccion='" + direccion + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        Paciente paciente = (Paciente) obj;
        return idPaciente != null && idPaciente.equals(paciente.idPaciente);
    }

    @Override
    public int hashCode() {
        return idPaciente != null ? idPaciente.hashCode() : 0;
    }
}
