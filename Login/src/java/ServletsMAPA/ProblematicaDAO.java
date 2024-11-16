package ServletsMAPA;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProblematicaDAO {

    // Obtener problemáticas paginadas
    public List<Problematica> obtenerProblematicasPaginadas(String alcaldia, int pagina, int elementosPorPagina) {
        List<Problematica> problematicas = new ArrayList<>();
        String query = "SELECT * FROM problematica WHERE alcaldia = ? LIMIT ?, ?";
        int startIndex = (pagina - 1) * elementosPorPagina;

        try (Connection con = Conexion.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, alcaldia);
            ps.setInt(2, startIndex);
            ps.setInt(3, elementosPorPagina);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Problematica p = new Problematica(
                    rs.getString("id"),
                    rs.getString("titulo"),
                    rs.getString("descripcion"),
                    rs.getString("alcaldia")
                );
                problematicas.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return problematicas;
    }

    // Obtener el número total de problemáticas
    public int obtenerTotalProblematicas(String alcaldia) {
        String query = "SELECT COUNT(*) FROM problematica WHERE alcaldia = ?";
        int total = 0;

        try (Connection con = Conexion.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, alcaldia);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }

    // Obtener una problemática por su ID
    public Problematica obtenerProblematicaPorId(String id, String alcaldia) {
        String query = "SELECT * FROM problematica WHERE id = ? AND alcaldia = ?";
        Problematica problematica = null;

        try (Connection con = Conexion.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, id);
            ps.setString(2, alcaldia);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                problematica = new Problematica(
                    rs.getString("id"),
                    rs.getString("titulo"),
                    rs.getString("descripcion"),
                    rs.getString("alcaldia")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return problematica;
    }

    // Agregar problemática
    public void agregarProblematica(Problematica problematica) {
        String query = "INSERT INTO problematica (titulo, descripcion, alcaldia) VALUES (?, ?, ?)";

        try (Connection con = Conexion.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, problematica.getTitulo());
            ps.setString(2, problematica.getDescripcion());
            ps.setString(3, problematica.getAlcaldia());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Eliminar problemática
    public void eliminarProblematica(String id, String alcaldia) {
        String query = "DELETE FROM problematica WHERE id = ? AND alcaldia = ?";

        try (Connection con = Conexion.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, id);
            ps.setString(2, alcaldia);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    // Obtener problemáticas paginadas con filtro de búsqueda
public List<Problematica> obtenerProblematicasPaginadas(String alcaldia, String busqueda, int pagina, int elementosPorPagina) {
    List<Problematica> problematicas = new ArrayList<>();
    String query = "SELECT * FROM problematica WHERE alcaldia = ? AND (titulo LIKE ? OR descripcion LIKE ?) LIMIT ?, ?";
    int startIndex = (pagina - 1) * elementosPorPagina;

    try (Connection con = Conexion.getConnection();
         PreparedStatement ps = con.prepareStatement(query)) {
        ps.setString(1, alcaldia);
        ps.setString(2, "%" + busqueda + "%");
        ps.setString(3, "%" + busqueda + "%");
        ps.setInt(4, startIndex);
        ps.setInt(5, elementosPorPagina);

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Problematica p = new Problematica(
                rs.getString("id"),
                rs.getString("titulo"),
                rs.getString("descripcion"),
                rs.getString("alcaldia")
            );
            problematicas.add(p);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return problematicas;
}

// Obtener el total de problemáticas con filtro de búsqueda
public int obtenerTotalProblematicas(String alcaldia, String busqueda) {
    String query = "SELECT COUNT(*) FROM problematica WHERE alcaldia = ? AND (titulo LIKE ? OR descripcion LIKE ?)";
    int total = 0;

    try (Connection con = Conexion.getConnection();
         PreparedStatement ps = con.prepareStatement(query)) {
        ps.setString(1, alcaldia);
        ps.setString(2, "%" + busqueda + "%");
        ps.setString(3, "%" + busqueda + "%");

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            total = rs.getInt(1);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return total;
}

}
