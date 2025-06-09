
package com.odontologia.filters;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebFilter("/*")
public class AuthenticationFilter implements Filter {
    // Páginas públicas que no requieren autenticación
    private static final List<String> PAGINAS_PUBLICAS = Arrays.asList(
            "/login.jsp",
            "/login",
            "/css/",
            "/js/",
            "/img/"
    );

    // Páginas exclusivas para el doctor
    private static final List<String> PAGINAS_DOCTOR = Arrays.asList(
            "/historia_clinica.jsp",
            "/historia_clinica"
    );

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());

        // Permitir acceso a recursos públicos
        if (esPaginaPublica(path)) {
            chain.doFilter(request, response);
            return;
        }

        HttpSession session = httpRequest.getSession(false);

        // Si no hay sesión, redirigir al login
        if (session == null || session.getAttribute("usuario") == null) {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login.jsp");
            return;
        }

        // Verificar permisos para páginas del doctor
        if (esPaginaDoctor(path)) {
            String rol = (String) session.getAttribute("rol");
            if (!"DOCTOR".equals(rol)) {
                httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN,
                        "No tiene permisos para acceder a esta página");
                return;
            }
        }

        chain.doFilter(request, response);
    }

    private boolean esPaginaPublica(String path) {
        return PAGINAS_PUBLICAS.stream().anyMatch(path::startsWith);
    }

    private boolean esPaginaDoctor(String path) {
        return PAGINAS_DOCTOR.stream().anyMatch(path::startsWith);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Inicialización del filtro si es necesario
    }

    @Override
    public void destroy() {
        // Limpieza del filtro si es necesario
    }
}