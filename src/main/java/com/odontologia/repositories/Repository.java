package com.odontologia.repositories;

import java.sql.SQLException;
import java.util.List;

/**
 * Repository genérico para operaciones CRUD básicas
 * @param <T> Tipo de entidad
 */
public interface Repository<T> {

    List<T> listar() throws SQLException;
    T porId(Integer id) throws SQLException;
    void guardar(T entity) throws SQLException;
    void eliminar(Integer id) throws SQLException;

    // Métodos adicionales útiles
    int contar() throws SQLException;
    boolean existe(Integer id) throws SQLException;
}