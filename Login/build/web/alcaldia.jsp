<%@page import="java.util.List"%>
<%@ page import="ServletsMAPA.Problematica" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String nombreAlcaldia = (String) request.getAttribute("nombreAlcaldia");
    List<Problematica> problematicas = (List<Problematica>) request.getAttribute("problematicas");

    Integer pagina = (Integer) request.getAttribute("pagina");
    Integer totalPaginas = (Integer) request.getAttribute("totalPaginas");

    if (pagina == null || totalPaginas == null) {
        pagina = 1;  // Valor predeterminado si es nulo
        totalPaginas = 1;  // Valor predeterminado si es nulo
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <link rel="stylesheet" href="css/alcaldia.css" type="text/css" media="all">
    <meta charset="UTF-8">
    <title><%= nombreAlcaldia %> - Problemáticas</title>
</head>
<body>
    <div class="albondigas"></div>j
    <h1>Problemáticas en <%= nombreAlcaldia %></h1>

    <!-- Formulario de Registro de Problemática -->
    <form action="ProblematicaServlet" method="post">
        <input type="hidden" name="nombreAlcaldia" value="<%= nombreAlcaldia %>">
        <label>Título de tu problemática</label>
        <input type="text" name="titulo" required><br><br>
        <label>Descripcón</label>
        <textarea name="problematica" required></textarea><br><br>
        <button type="submit" name="action" value="alta">Enviar</button>
    </form>

<!-- Tabla de Problemáticas -->
<h2>Lista de Problemáticas</h2>
<table border="1">
    <tr>
        <th>Titulo</th>
        <th>Problemática</th>
        <th>Acciones</th>
    </tr>
    <% for (Problematica p : problematicas) { %>
        <tr>
            <td><%= p.getTitulo().length() > 45 ? p.getTitulo().substring(0, 45) : p.getTitulo() %></td>
            <td>
                <%= p.getDescripcion().length() > 15 ? p.getDescripcion().substring(0, 15) + "..." : p.getDescripcion() %>
            </td>
            <td>
                <form action="ProblematicaServlet" method="post">
                    <input type="hidden" name="action" value="eliminar">
                    <input type="hidden" name="id" value="<%= p.getId() %>">
                    <input type="hidden" name="nombreAlcaldia" value="<%= nombreAlcaldia %>">
                    <button type="submit">Eliminar</button>
                </form>
                <a href="ProblematicaDetalleServlet?id=<%= p.getId() %>&nombre=<%= nombreAlcaldia %>">Ver completo</a>
            </td>
        </tr>
    <% } %>
</table>

<!-- Paginación -->
<div>
    <button <% if (pagina == 1) out.print("disabled"); %> onclick="location.href='ProblematicaServlet?nombre=<%= nombreAlcaldia %>&pagina=<%= pagina - 1 %>'">Anterior</button>
    <button <% if (pagina == totalPaginas) out.print("disabled"); %> onclick="location.href='ProblematicaServlet?nombre=<%= nombreAlcaldia %>&pagina=<%= pagina + 1 %>'">Siguiente</button>
</div>
<div>
    Página <%= pagina %> de <%= totalPaginas %>
</div>
<!-- Formulario de Búsqueda -->
<form action="AlcaldiaServlet" method="get">
    <input type="hidden" name="nombre" value="<%= nombreAlcaldia %>">
    <label>Buscar problemática:</label>
    <input type="text" name="busqueda" placeholder="Título o Descripción">
    <button type="submit">Buscar</button>
</form>
</body>
</html>
