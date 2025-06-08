package Service;

import Model.Usuario;
import Repository.UsuarioRepository;
import util.PasswordUtil;

public class UsuarioService {
    private final UsuarioRepository repo = new UsuarioRepository();

    public Usuario autenticar(String username, String password) {
        Usuario usuario = repo.buscarPorUsername(username);
        if (usuario != null && usuario.getPassword().equals(PasswordUtil.hashPassword(password))) {
            return usuario;
        }
        return null;
    }
}