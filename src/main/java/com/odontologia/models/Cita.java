package com.odontologia.models;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

public class Cita {
    private Integer id;
    private Integer idPaciente;
    private Integer idDoctor;
    private LocalDate fecha;
    private LocalTime hora;
    private String motivo;
    private String estado;

    // Campos adicionales para mostrar información completa
    private String nombrePaciente;
    private String apellidoPaciente;
    private String nombreDoctor;
    private String apellidoDoctor;
    private String especialidadDoctor;

    // Constructor vacío
    public Cita() {}

    // Constructor básico
    public Cita(Integer idPaciente, Integer idDoctor, LocalDate fecha, LocalTime hora, String motivo) {
        this.idPaciente = idPaciente;
        this.idDoctor = idDoctor;
        this.fecha = fecha;
        this.hora = hora;
        this.motivo = motivo;
        this.estado = "PROGRAMADA";
    }

    // Constructor completo
    public Cita(Integer id, Integer idPaciente, Integer idDoctor, LocalDate fecha, LocalTime hora, String motivo, String estado) {
        this.id = id;
        this.idPaciente = idPaciente;
        this.idDoctor = idDoctor;
        this.fecha = fecha;
        this.hora = hora;
        this.motivo = motivo;
        this.estado = estado;
    }

    // GETTERS
    public Integer getId() {
        return id;
    }

    public Integer getIdCita() {
        return id; // Alias para compatibilidad
    }

    public Integer getIdPaciente() {
        return idPaciente;
    }

    public Integer getIdDoctor() {
        return idDoctor;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public LocalTime getHora() {
        return hora;
    }

    public String getMotivo() {
        return motivo;
    }

    public String getEstado() {
        return estado;
    }

    public String getNombrePaciente() {
        return nombrePaciente;
    }

    public String getApellidoPaciente() {
        return apellidoPaciente;
    }

    public String getNombreDoctor() {
        return nombreDoctor;
    }

    public String getApellidoDoctor() {
        return apellidoDoctor;
    }

    public String getEspecialidadDoctor() {
        return especialidadDoctor;
    }

    // SETTERS
    public void setId(Integer id) {
        this.id = id;
    }

    public void setIdCita(Integer idCita) {
        this.id = idCita; // Alias para compatibilidad
    }

    public void setIdPaciente(Integer idPaciente) {
        this.idPaciente = idPaciente;
    }

    public void setIdDoctor(Integer idDoctor) {
        this.idDoctor = idDoctor;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public void setHora(LocalTime hora) {
        this.hora = hora;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public void setNombrePaciente(String nombrePaciente) {
        this.nombrePaciente = nombrePaciente;
    }

    public void setApellidoPaciente(String apellidoPaciente) {
        this.apellidoPaciente = apellidoPaciente;
    }

    public void setNombreDoctor(String nombreDoctor) {
        this.nombreDoctor = nombreDoctor;
    }

    public void setApellidoDoctor(String apellidoDoctor) {
        this.apellidoDoctor = apellidoDoctor;
    }

    public void setEspecialidadDoctor(String especialidadDoctor) {
        this.especialidadDoctor = especialidadDoctor;
    }

    // MÉTODOS DE UTILIDAD
    public String getFechaFormateada() {
        return fecha != null ? fecha.format(DateTimeFormatter.ofPattern("dd/MM/yyyy")) : "";
    }

    public String getFechaISO() {
        return fecha != null ? fecha.toString() : "";
    }

    public String getHoraFormateada() {
        return hora != null ? hora.format(DateTimeFormatter.ofPattern("HH:mm")) : "";
    }

    public String getFechaHoraFormateada() {
        String fechaStr = getFechaFormateada();
        String horaStr = getHoraFormateada();

        if (!fechaStr.isEmpty() && !horaStr.isEmpty()) {
            return fechaStr + " " + horaStr;
        } else if (!fechaStr.isEmpty()) {
            return fechaStr;
        }
        return "";
    }

    public String getNombreCompletoPaciente() {
        return (nombrePaciente != null ? nombrePaciente : "") + " " +
                (apellidoPaciente != null ? apellidoPaciente : "");
    }

    public String getNombreCompletoDoctor() {
        return "Dr. " + (nombreDoctor != null ? nombreDoctor : "") + " " +
                (apellidoDoctor != null ? apellidoDoctor : "");
    }

    public String getDoctorConEspecialidad() {
        String nombre = getNombreCompletoDoctor();
        if (especialidadDoctor != null && !especialidadDoctor.trim().isEmpty()) {
            nombre += " - " + especialidadDoctor;
        }
        return nombre;
    }

    public boolean esHoy() {
        return fecha != null && fecha.equals(LocalDate.now());
    }

    public boolean esFuturo() {
        return fecha != null && fecha.isAfter(LocalDate.now());
    }

    public boolean esPasado() {
        return fecha != null && fecha.isBefore(LocalDate.now());
    }

    public boolean estaProgramada() {
        return "PROGRAMADA".equals(estado);
    }

    public boolean estaConfirmada() {
        return "CONFIRMADA".equals(estado);
    }

    public boolean estaCompletada() {
        return "COMPLETADA".equals(estado);
    }

    public boolean estaCancelada() {
        return "CANCELADA".equals(estado);
    }

    public boolean puedeEditarse() {
        return estaProgramada() || estaConfirmada();
    }

    public boolean puedeCancelarse() {
        return estaProgramada() || estaConfirmada();
    }

    public boolean esValida() {
        return idPaciente != null && idPaciente > 0 &&
                idDoctor != null && idDoctor > 0 &&
                fecha != null;
    }

    public String getEstadoTexto() {
        if (estado == null) return "Sin estado";

        switch (estado.toUpperCase()) {
            case "PROGRAMADA": return "Programada";
            case "CONFIRMADA": return "Confirmada";
            case "EN_CURSO": return "En curso";
            case "COMPLETADA": return "Completada";
            case "CANCELADA": return "Cancelada";
            default: return estado;
        }
    }

    public String getEstadoColor() {
        if (estado == null) return "secondary";

        switch (estado.toUpperCase()) {
            case "PROGRAMADA": return "primary";
            case "CONFIRMADA": return "success";
            case "EN_CURSO": return "warning";
            case "COMPLETADA": return "info";
            case "CANCELADA": return "danger";
            default: return "secondary";
        }
    }

    @Override
    public String toString() {
        return "Cita{" +
                "id=" + id +
                ", idPaciente=" + idPaciente +
                ", idDoctor=" + idDoctor +
                ", fecha=" + fecha +
                ", hora=" + hora +
                ", motivo='" + motivo + '\'' +
                ", estado='" + estado + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        Cita cita = (Cita) obj;
        return id != null && id.equals(cita.id);
    }

    @Override
    public int hashCode() {
        return id != null ? id.hashCode() : 0;
    }
}