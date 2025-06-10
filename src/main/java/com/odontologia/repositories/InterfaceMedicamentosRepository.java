package com.odontologia.repositories;

import com.odontologia.models.Medicamentos;

import java.util.List;

public interface InterfaceMedicamentosRepository {

    //implementamos un metodo para "listar" los cursos
    List<Medicamentos> listar();
    Medicamentos porId(Long id);
    void guardar(Medicamentos articulo);
    void eliminar(Long id);

}
