package ServletsMAPA;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ProblematicaServlet extends HttpServlet {
    private ProblematicaDAO dao = new ProblematicaDAO();

    // Mostrar la página de problemáticas de la alcaldía
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombreAlcaldia = request.getParameter("nombre");
        int pagina = 1;  // Página por defecto
        int elementosPorPagina = 10;  // Número de elementos por página

        // Obtener el número de la página desde la solicitud (si está presente)
        String paginaParam = request.getParameter("pagina");
        if (paginaParam != null) {
            try {
                pagina = Integer.parseInt(paginaParam);
            } catch (NumberFormatException e) {
                pagina = 1; // Si el parámetro 'pagina' no es válido, la página será 1
            }
        }
// En el método doPost, asegúrate de recibir y asignar correctamente el valor de "titulo"
String titulo = request.getParameter("titulo");
String descripcion = request.getParameter("problematica");
Problematica nuevaProblematica = new Problematica(null, titulo, descripcion, nombreAlcaldia);
dao.agregarProblematica(nuevaProblematica);

        // Obtener las problemáticas para la página actual
        List<Problematica> problematicas = dao.obtenerProblematicasPaginadas(nombreAlcaldia, pagina, elementosPorPagina);

        // Calcular el número total de problemáticas
        int totalProblematicas = dao.obtenerTotalProblematicas(nombreAlcaldia);
        int totalPaginas = (int) Math.ceil((double) totalProblematicas / elementosPorPagina);

        // Establecer los atributos en la solicitud para pasarlos al JSP
        request.setAttribute("nombreAlcaldia", nombreAlcaldia);
        request.setAttribute("problematicas", problematicas);
        request.setAttribute("pagina", pagina);
        request.setAttribute("totalPaginas", totalPaginas);

        // Redirigir a la vista JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("alcaldia.jsp");
        dispatcher.forward(request, response);
    }

    // Eliminar problemática (POST)
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String action = request.getParameter("action");
    String nombreAlcaldia = request.getParameter("nombreAlcaldia");

    if ("alta".equals(action)) {
        String titulo = request.getParameter("titulo");
        String descripcion = request.getParameter("problematica");

        Problematica nuevaProblematica = new Problematica(null, titulo, descripcion, nombreAlcaldia);
        dao.agregarProblematica(nuevaProblematica);
    } else if ("eliminar".equals(action)) {
        String id = request.getParameter("id");
        dao.eliminarProblematica(id, nombreAlcaldia);
    }

    response.sendRedirect("ProblematicaServlet?nombre=" + nombreAlcaldia);
}

}
