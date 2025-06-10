package com.odontologia.models;

public class Medicamentos {

    private long idMedicamento;

    private String nombre;

    private String descripcion;

    private long stock;

    public Medicamentos() {

    }

    public Medicamentos(long idMedicamento, String nombre, String descripcion, long stock) {
        this.idMedicamento = idMedicamento;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.stock = stock;
    }

    public long getIdMedicamento() {
        return idMedicamento;
    }

    public void setIdMedicamento(long idMedicamento) {
        this.idMedicamento = idMedicamento;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public long getStock() {
        return stock;
    }

    public void setStock(long stock) {
        this.stock = stock;
    }
}

