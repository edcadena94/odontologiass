package com.odontologia.services;

import com.odontologia.models.Factura;

import java.util.List;

public interface FacturaService {
    boolean guardar(Factura factura);
    boolean actualizar(Factura factura);
    boolean eliminar(int idFactura);
    Factura buscarPorId(int idFactura);
    List<Factura> listarTodas();
}