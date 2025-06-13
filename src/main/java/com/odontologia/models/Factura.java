package com.odontologia.models;

import java.time.LocalDate;

public class Factura {
    private Integer idFactura;
    private String numeroFactura;
    private LocalDate fecha;
    private Double montoTotal;
    private Integer idPaciente;

    // Constructor vacío
    public Factura() {}

    // Constructor completo
    public Factura(String numeroFactura, LocalDate fecha, Double montoTotal, Integer idPaciente) {
        this.numeroFactura = numeroFactura;
        this.fecha = fecha;
        this.montoTotal = montoTotal;
        this.idPaciente = idPaciente;
    }

    // Constructor con ID (para actualizar)
    public Factura(Integer idFactura, String numeroFactura, LocalDate fecha, Double montoTotal, Integer idPaciente) {
        this.idFactura = idFactura;
        this.numeroFactura = numeroFactura;
        this.fecha = fecha;
        this.montoTotal = montoTotal;
        this.idPaciente = idPaciente;
    }

    // GETTERS
    public Integer getIdFactura() { return idFactura; }
    public String getNumeroFactura() { return numeroFactura; }
    public LocalDate getFecha() { return fecha; }
    public Double getMontoTotal() { return montoTotal; }
    public Integer getIdPaciente() { return idPaciente; }

    // SETTERS
    public void setIdFactura(Integer idFactura) { this.idFactura = idFactura; }
    public void setNumeroFactura(String numeroFactura) { this.numeroFactura = numeroFactura; }
    public void setFecha(LocalDate fecha) { this.fecha = fecha; }
    public void setMontoTotal(Double montoTotal) { this.montoTotal = montoTotal; }
    public void setIdPaciente(Integer idPaciente) { this.idPaciente = idPaciente; }
}