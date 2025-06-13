package com.odontologia.services;

import com.odontologia.models.Factura;
import com.odontologia.repositories.FacturaRepository;

import java.sql.Connection;
import java.util.List;

public class FacturaServiceJdbcImplement implements FacturaService {
    private final FacturaRepository facturaRepository;

    public FacturaServiceJdbcImplement(Connection conn) {
        this.facturaRepository = new FacturaRepository(conn);
    }

    @Override
    public boolean guardar(Factura factura) {
        // Validaciones básicas
        if (factura == null ||
                factura.getNumeroFactura() == null || factura.getNumeroFactura().trim().isEmpty() ||
                factura.getFecha() == null ||
                factura.getMontoTotal() == null ||
                factura.getIdPaciente() == null) {
            return false;
        }
        return facturaRepository.guardar(factura);
    }

    @Override
    public boolean actualizar(Factura factura) {
        if (factura == null || factura.getIdFactura() == null || factura.getIdFactura() <= 0) {
            return false;
        }
        return facturaRepository.actualizar(factura);
    }

    @Override
    public boolean eliminar(int idFactura) {
        if (idFactura <= 0) return false;
        return facturaRepository.eliminar(idFactura);
    }

    @Override
    public Factura buscarPorId(int idFactura) {
        if (idFactura <= 0) return null;
        return facturaRepository.buscarPorId(idFactura);
    }

    @Override
    public List<Factura> listarTodas() {
        return facturaRepository.obtenerTodas();
    }
}