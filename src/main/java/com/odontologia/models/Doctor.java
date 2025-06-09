package com.odontologia.models;

public class Doctor {
    private Integer idDoctor;
    private String nombre;
    private String apellido;
    private String especialidad;
    private String telefono;
    private String email;

    // Constructor vacío
    public Doctor() {}

    // Constructor completo
    public Doctor(String nombre, String apellido, String especialidad, String telefono, String email) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.especialidad = especialidad;
        this.telefono = telefono;
        this.email = email;
    }

    // Constructor con ID (para actualizaciones)
    public Doctor(Integer idDoctor, String nombre, String apellido, String especialidad, String telefono, String email) {
        this.idDoctor = idDoctor;
        this.nombre = nombre;
        this.apellido = apellido;
        this.especialidad = especialidad;
        this.telefono = telefono;
        this.email = email;
    }

    // GETTERS
    public Integer getIdDoctor() {
        return idDoctor;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public String getTelefono() {
        return telefono;
    }

    public String getEmail() {
        return email;
    }

    // SETTERS
    public void setIdDoctor(Integer idDoctor) {
        this.idDoctor = idDoctor;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    // MÉTODOS DE UTILIDAD
    public String getNombreCompleto() {
        return (nombre != null ? nombre : "") + " " + (apellido != null ? apellido : "");
    }

    public String getNombreConTitulo() {
        return "Dr. " + getNombreCompleto();
    }

    public String getNombreConEspecialidad() {
        String nombreCompleto = getNombreConTitulo();
        if (especialidad != null && !especialidad.trim().isEmpty()) {
            nombreCompleto += " - " + especialidad;
        }
        return nombreCompleto;
    }

    public String getIniciales() {
        String inicialNombre = (nombre != null && !nombre.isEmpty()) ? nombre.substring(0, 1).toUpperCase() : "";
        String inicialApellido = (apellido != null && !apellido.isEmpty()) ? apellido.substring(0, 1).toUpperCase() : "";
        return inicialNombre + inicialApellido;
    }

    public boolean tieneEspecialidad() {
        return especialidad != null && !especialidad.trim().isEmpty();
    }

    public boolean tieneTelefono() {
        return telefono != null && !telefono.trim().isEmpty();
    }

    public boolean tieneEmail() {
        return email != null && !email.trim().isEmpty();
    }

    public boolean esValido() {
        return nombre != null && !nombre.trim().isEmpty() &&
                apellido != null && !apellido.trim().isEmpty() &&
                especialidad != null && !especialidad.trim().isEmpty();
    }

    @Override
    public String toString() {
        return "Doctor{" +
                "idDoctor=" + idDoctor +
                ", nombre='" + nombre + '\'' +
                ", apellido='" + apellido + '\'' +
                ", especialidad='" + especialidad + '\'' +
                ", telefono='" + telefono + '\'' +
                ", email='" + email + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        Doctor doctor = (Doctor) obj;
        return idDoctor != null && idDoctor.equals(doctor.idDoctor);
    }

    @Override
    public int hashCode() {
        return idDoctor != null ? idDoctor.hashCode() : 0;
    }
}