package ServletsMAPA;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class ProblematicaDetalleServlet extends HttpServlet {
    private ProblematicaDAO dao = new ProblematicaDAO();

    // Mostrar el detalle completo de una problemática
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener el ID de la problemática y el nombre de la alcaldía desde la solicitud
        String id = request.getParameter("id");
        String nombreAlcaldia = request.getParameter("nombre");

        // Buscar la problemática por ID en el DAO
        Problematica problematica = dao.obtenerProblematicaPorId(id, nombreAlcaldia);

        // Si se encuentra la problemática, la pasamos al JSP
        if (problematica != null) {
            request.setAttribute("problematica", problematica);
            request.setAttribute("nombreAlcaldia", nombreAlcaldia);

            // Redirigir a la vista JSP de detalle
            RequestDispatcher dispatcher = request.getRequestDispatcher("problematica_detalle.jsp");
            dispatcher.forward(request, response);
        } else {
            // Si no se encuentra la problemática, se devuelve un error 404
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Problematica no encontrada");
        }
    }
}
