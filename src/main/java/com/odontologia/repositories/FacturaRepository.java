package com.odontologia.repositories;

import com.odontologia.models.Factura;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class FacturaRepository {
    private final Connection conn;

    public FacturaRepository(Connection conn) {
        this.conn = conn;
    }

    public boolean guardar(Factura factura) {
        String sql;
        boolean esNuevo = factura.getIdFactura() == null || factura.getIdFactura() == 0;

        if (esNuevo) {
            sql = "INSERT INTO facturas (numero_factura, fecha, monto_total, id_paciente) VALUES (?, ?, ?, ?)";
        } else {
            sql = "UPDATE facturas SET numero_factura = ?, fecha = ?, monto_total = ?, id_paciente = ? WHERE id_factura = ?";
        }

        try (PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, factura.getNumeroFactura());
            stmt.setDate(2, Date.valueOf(factura.getFecha()));
            stmt.setDouble(3, factura.getMontoTotal());
            stmt.setInt(4, factura.getIdPaciente());

            if (!esNuevo) {
                stmt.setInt(5, factura.getIdFactura());
            }

            int affectedRows = stmt.executeUpdate();
            if (esNuevo && affectedRows > 0) {
                ResultSet rs = stmt.getGeneratedKeys();
                if (rs.next()) factura.setIdFactura(rs.getInt(1));
            }
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean actualizar(Factura factura) {
        return guardar(factura);
    }

    public boolean eliminar(int id) {
        String sql = "DELETE FROM facturas WHERE id_factura = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Factura buscarPorId(int id) {
        String sql = "SELECT * FROM facturas WHERE id_factura = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) return mapearFactura(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Factura> obtenerTodas() {
        List<Factura> facturas = new ArrayList<>();
        String sql = "SELECT * FROM facturas ORDER BY fecha DESC";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) facturas.add(mapearFactura(rs));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facturas;
    }

    // Util
    private Factura mapearFactura(ResultSet rs) throws SQLException {
        Factura factura = new Factura();
        factura.setIdFactura(rs.getInt("id_factura"));
        factura.setNumeroFactura(rs.getString("numero_factura"));
        factura.setFecha(rs.getDate("fecha").toLocalDate());
        factura.setMontoTotal(rs.getDouble("monto_total"));
        factura.setIdPaciente(rs.getInt("id_paciente"));
        return factura;
    }
}