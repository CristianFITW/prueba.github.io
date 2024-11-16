<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Usuarios</title>
        <link rel="stylesheet" href="css/estilosLogin.css" type="text/css" media="all">
        
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
        %>
    </head>
    <body>
        <div class="paddingss">
        <div class="card"> <!-- Cambié el div a .card -->
            <div class="card2">
                <form class="form" id="formularioAlta" method="post" action="GuardarServlet">
                    <h1 id="heading">Registro de Usuarios</h1> <!-- Cambié el título para que sea parte del estilo -->
                    
                    <div class="field">
                        <label>CURP:</label>
                        <input type="text" class="input-field" id="txtCurp" required="" name="txtCurp">
                    </div>
                    
                    <div class="field">
                        <label>Nombre:</label>
                        <input type="text" class="input-field" id="txtNombre" required="" onkeyup="usuarioGeneradoAutomaticamente()" name="txtNombre">
                    </div>
                    
                    <div class="field">
                        <label>Apellidos:</label>
                        <input type="text" class="input-field" id="txtApellidos" required="" onkeyup="usuarioGeneradoAutomaticamente()" name="txtApellidos">
                    </div>
                    
                    <div class="field">
                        <label>Contraseña:</label>
                        <input type="password" class="input-field" id="txtContrasena" required="" onkeyup="coincidirContrasena()">
                    </div>
                    
                    <div class="field">
                        <label>Repita la Contraseña:</label>
                        <input type="password" class="input-field" id="txtRepetirContrasena" required="" onkeyup="coincidirContrasena()" name="txtContrasena">
                    </div>
                    
                    <label class="avisoContrasena" id="avisoContrasena"> ------- </label>
                    
                    <div class="field">
                        <label>Usuario Generado Automáticamente:</label>
                        <input type="text" class="input-field" id="txtUsuarioGeneradoAutomaticamente" required="" readonly="" name="txtUsuarioGeneradoAutomaticamente">
                    </div>
                    
                    <div class="btn">
                        <input type="submit" value="Enviar Datos" class="button1" id="btnEnviarDatos" disabled="">
                        <input type="button" value="Borrar Datos" class="button2" id="btnBorrar" onclick="resetearFormulario()">
                    </div>
                </form>
            </div>
        </div>
        </div>
    </body>
    <script src="jsFunciones/CURP.js"></script>
    <script src="js/funcionesAltaUsuario.js"></script>
</html>
