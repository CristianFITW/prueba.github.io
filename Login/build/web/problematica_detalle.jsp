<%@ page import="ServletsMAPA.Problematica" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Problematica problematica = (Problematica) request.getAttribute("problematica");
    String nombreAlcaldia = (String) request.getAttribute("nombreAlcaldia");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Detalle de Problemática - <%= nombreAlcaldia %></title>
</head>
<body>
    <h1>Detalle de la Problemática</h1>
    <h2>Alcaldía: <%= nombreAlcaldia %></h2>

    <p><strong>Titulo:</strong> <%= problematica.getTitulo() %></p>
    <p><strong>Descripción:</strong></p>
    <p><%= problematica.getDescripcion() %></p>

    <a href="ProblematicaServlet?nombre=<%= nombreAlcaldia %>">Volver a la lista de problemáticas</a>
</body>
</html>
