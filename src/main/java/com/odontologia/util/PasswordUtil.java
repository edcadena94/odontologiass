package com.odontologia.util;

import org.mindrot.jbcrypt.BCrypt;

import java.security.SecureRandom;
import java.util.regex.Pattern;

public class PasswordUtil {

    // Configuración de seguridad
    private static final int BCRYPT_LOG_ROUNDS = 12; // Coste computacional (12 es un buen balance)
    private static final String PASSWORD_REGEX = "^(?=.*[A-Z])(?=.*\\d).{8,}$"; // 8 chars, 1 mayúscula, 1 número
    private static final Pattern PASSWORD_PATTERN = Pattern.compile(PASSWORD_REGEX);

    /**
     * Genera un hash seguro de la contraseña usando BCrypt.
     * @param plainPassword Contraseña en texto plano.
     * @return Hash seguro de la contraseña.
     * @throws IllegalArgumentException Si la contraseña está vacía.
     */
    public static String hashPassword(String plainPassword) {
        if (plainPassword == null || plainPassword.trim().isEmpty()) {
            throw new IllegalArgumentException("La contraseña no puede estar vacía");
        }
        return BCrypt.hashpw(plainPassword, BCrypt.gensalt(BCRYPT_LOG_ROUNDS));
    }

    /**
     * Verifica si una contraseña coincide con un hash BCrypt.
     * @param plainPassword Contraseña en texto plano a verificar.
     * @param hashedPassword Hash almacenado para comparación.
     * @return true si coinciden, false en caso contrario.
     */
    public static boolean checkPassword(String plainPassword, String hashedPassword) {
        if (plainPassword == null || hashedPassword == null) {
            return false;
        }
        return BCrypt.checkpw(plainPassword, hashedPassword);
    }

    /**
     * Valida la fortaleza de una contraseña según políticas de seguridad.
     * @param password Contraseña a validar.
     * @return true si cumple con los requisitos de seguridad.
     */
    public static boolean isPasswordStrong(String password) {
        return password != null && PASSWORD_PATTERN.matcher(password).matches();
    }

    /**
     * Genera una contraseña aleatoria segura (útil para reseteos).
     * @return Contraseña aleatoria de 12 caracteres.
     */
    public static String generateRandomPassword() {
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()";
        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder(12);
        for (int i = 0; i < 12; i++) {
            sb.append(chars.charAt(random.nextInt(chars.length())));
        }
        return sb.toString();
    }
}