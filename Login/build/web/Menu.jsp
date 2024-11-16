<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Accesso a diseños de opcion Usuario -->
        <link rel="stylesheet" href="css/UsuarioMenucss.css" type="text/css" media="all">
    </head>
    <body>
        <div class="papasGratinadas" id="menu-horizontal">
            <a href="#">Mapa</a> |
            <a href="#">Green Company</a> |
            <a href="#">Inicio</a> |
            <a href="#">Proximamente...</a> |

            <!-- Envolver el enlace Usuario y las opciones dentro de un contenedor -->
            <span id="usuario-menu">
                <% 
                    // Obtener el valor de txtUsuario desde la sesión
                    String txtUsuario = (String) session.getAttribute("txtUsuario");

                    // Verificar si txtUsuario está vacío o nulo
                    if (txtUsuario != null && !txtUsuario.isEmpty()) {
                %>
                    <!-- Mostrar el nombre del usuario si no está vacío -->
                    <a href="#" onclick="mostrarOpciones()"><%= txtUsuario %></a>
                <% } else { %>
                    <!-- Si está vacío, mostrar ambos enlaces: uno vacío y otro con "Usuario" -->
                    <a href="#" onclick="mostrarOpciones()">${txtUsuario}</a>
                    <a href="#" onclick="mostrarOpciones()">Usuario</a>
                <% } %>
                <!-- Las opciones están dentro de este div y se despliegan justo debajo de Usuario -->
                <div id="opciones">
                    <% 
                        String nombreUsuario = (String) request.getSession().getAttribute("nombre");
                        if (nombreUsuario != null) {
                    %>
                        <!-- Si el usuario está autenticado, muestra su nombre y la opción de cerrar sesión -->
                        <a href="#" onclick="cargarPerfil()"><%=nombreUsuario%></a><br>
                        <form action="CerrarSesionServlet" method="post">
                            <input type="submit" value="Cerrar Sesión">
                        </form>
                    <% } else { %>
                        <!-- Si no está autenticado, muestra Iniciar Sesión y Registro de Usuarios -->
                        <a href="#" onclick="cargarLogin()">Iniciar Sesión</a><br>
                        <a href="#" onclick="cargarAltaUsuario()">Registro de Usuarios</a>
                        <a href="#" onclick="cargarMenu()">Registro de Usuarios</a>
                    <% } %>
                </div>
            </span>
        </div>
        
        <section class="contenidoDinamico" id="contenidoDinamico" >
        </section>
    </body>
    <!-- Funcion Ocultar y mostrar menu de usuario  -->
    <script src="jsFunciones/UsuarioMenu.js"></script>
    <script src="js/funcionesIndex.js"></script>
    <script src="js/funcionesLogin.js"></script>
    <script src="js/funcionesAltaUsuario.js"></script>
</html>
