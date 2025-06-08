package Model;

public class Paciente {
    private String nombre;
    private String sexo;
    private String fechaNacimiento;
    private String direccion;             // Agregado
    private String telefono;
    private String email;                 // Cambié nombre a email para mantener consistencia
    private String motivoConsulta;
    private String antecedentes;
    private String tratamientosPrevios;
    private String examenClinico;
    private String diagnostico;
    private String planTratamiento;

    // Constructor vacío
    public Paciente() {
    }

    // Getters y Setters

    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getSexo() {
        return sexo;
    }
    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }
    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getDireccion() {
        return direccion;
    }
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return email;
    }
    public void setCorreo(String correo) {
        this.email = correo;
    }

    public String getMotivoConsulta() {
        return motivoConsulta;
    }
    public void setMotivoConsulta(String motivoConsulta) {
        this.motivoConsulta = motivoConsulta;
    }

    public String getAntecedentes() {
        return antecedentes;
    }
    public void setAntecedentes(String antecedentes) {
        this.antecedentes = antecedentes;
    }

    public String getTratamientosPrevios() {
        return tratamientosPrevios;
    }
    public void setTratamientosPrevios(String tratamientosPrevios) {
        this.tratamientosPrevios = tratamientosPrevios;
    }

    public String getExamenClinico() {
        return examenClinico;
    }
    public void setExamenClinico(String examenClinico) {
        this.examenClinico = examenClinico;
    }

    public String getDiagnostico() {
        return diagnostico;
    }
    public void setDiagnostico(String diagnostico) {
        this.diagnostico = diagnostico;
    }

    public String getPlanTratamiento() {
        return planTratamiento;
    }
    public void setPlanTratamiento(String planTratamiento) {
        this.planTratamiento = planTratamiento;
    }

    public void setEmail(String email) {
    }
}
