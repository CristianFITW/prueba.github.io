package ServletsMAPA;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class AlcaldiaServlet extends HttpServlet {
    private ProblematicaDAO dao = new ProblematicaDAO();

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String nombreAlcaldia = request.getParameter("nombre");
    String busqueda = request.getParameter("busqueda"); // Nueva variable para la búsqueda
    int pagina = 1;
    int elementosPorPagina = 10;

    String paginaParam = request.getParameter("pagina");
    if (paginaParam != null) {
        try {
            pagina = Integer.parseInt(paginaParam);
        } catch (NumberFormatException e) {
            pagina = 1;
        }
    }

    List<Problematica> problematicas = dao.obtenerProblematicasPaginadas(nombreAlcaldia, busqueda, pagina, elementosPorPagina);
    int totalProblematicas = dao.obtenerTotalProblematicas(nombreAlcaldia, busqueda);
    int totalPaginas = (int) Math.ceil((double) totalProblematicas / elementosPorPagina);

    request.setAttribute("nombreAlcaldia", nombreAlcaldia);
    request.setAttribute("problematicas", problematicas);
    request.setAttribute("pagina", pagina);
    request.setAttribute("totalPaginas", totalPaginas);
    request.setAttribute("busqueda", busqueda); // Pasamos el término de búsqueda

    RequestDispatcher dispatcher = request.getRequestDispatcher("alcaldia.jsp");
    dispatcher.forward(request, response);
}

}
