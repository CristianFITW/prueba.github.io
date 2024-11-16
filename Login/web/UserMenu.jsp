<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/USERCSS.css" type="text/css" media="all">
        
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //Borrar directivas de memoria cache y anular algoritmos predeterminados para almacenar cache 
            response.setHeader("Pragma", "no-cache");//Directivas compatibles con memorias cache 
            response.setDateHeader("Expires", 0);//Proporciona Fecha y hora para decir el tiempo de respuesta caduco 
        %>
    </head>
    <body>
        <div class="trtr">
    <div class="tarjeta">
        <ul class="lista">
          <li class="elemento">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="25"
              height="25"
              viewBox="0 0 24 24"
              fill="none"
              stroke="#7e8590"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
              class="lucide lucide-lápiz"
            >
              <path
                d="M21.174 6.812a1 1 0 0 0-3.986-3.987L3.842 16.174a2 2 0 0 0-.5.83l-1.321 4.352a.5.5 0 0 0 .623.622l4.353-1.32a2 2 0 0 0 .83-.497z"
              ></path>
              <path d="m15 5 4 4"></path>
            </svg>
            <p class="etiqueta">Renombrar</p>
          </li>
          <li class="elemento">
            <svg
              class="lucide lucide-usuario-redondo-agregar"
              stroke-linejoin="round"
              stroke-linecap="round"
              stroke-width="2"
              stroke="#7e8590"
              fill="none"
              viewBox="0 0 24 24"
              height="24"
              width="24"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path d="M2 21a8 8 0 0 1 13.292-6"></path>
              <circle r="5" cy="8" cx="10"></circle>
              <path d="M19 16v6"></path>
              <path d="M22 19h-6"></path>
            </svg>
            <p class="etiqueta">Agregar Miembro</p>
          </li>
        </ul>
        <div class="separador"></div>
        <ul class="lista">
          <li class="elemento">
            <svg
              class="lucide lucide-ajustes"
              stroke-linejoin="round"
              stroke-linecap="round"
              stroke-width="2"
              stroke="#7e8590"
              fill="none"
              viewBox="0 0 24 24"
              height="24"
              width="24"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                d="M12.22 2h-.44a2 2 0 0 0-2 2v.18a2 2 0 0 1-1 1.73l-.43.25a2 2 0 0 1-2 0l-.15-.08a2 2 0 0 0-2.73.73l-.22.38a2 2 0 0 0 .73 2.73l.15.1a2 2 0 0 1 1 1.72v.51a2 2 0 0 1-1 1.74l-.15.09a2 2 0 0 0-.73 2.73l.22.38a2 2 0 0 0 2.73.73l.15-.08a2 2 0 0 1 2 0l.43.25a2 2 0 0 1 1 1.73V20a2 2 0 0 0 2 2h.44a2 2 0 0 0 2-2v-.18a2 2 0 0 1 1-1.73l.43-.25a2 2 0 0 1 2 0l.15.08a2 2 0 0 0 2.73-.73l.22-.39a2 2 0 0 0-.73-2.73l-.15-.08a2 2 0 0 1-1-1.74v-.5a2 2 0 0 1 1-1.74l.15-.09a2 2 0 0 0 .73-2.73l-.22-.38a2 2 0 0 0-2.73-.73l-.15.08a2 2 0 0 1-2 0l-.43-.25a2 2 0 0 1-1-1.73V4a2 2 0 0 0-2-2z"
              ></path>
              <circle r="3" cy="12" cx="12"></circle>
            </svg>
            <p class="etiqueta">Configuraciones</p>
          </li>
          <li class="elemento eliminar">
            <svg
              class="lucide lucide-papelera-2"
              stroke-linejoin="round"
              stroke-linecap="round"
              stroke-width="2"
              stroke="#7e8590"
              fill="none"
              viewBox="0 0 24 24"
              height="24"
              width="24"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path d="M3 6h18"></path>
              <path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"></path>
              <path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"></path>
              <line y2="17" y1="11" x2="10" x1="10"></line>
              <line y2="17" y1="11" x2="14" x1="14"></line>
            </svg>
            <p class="etiqueta">Eliminar</p>
          </li>
        </ul>
        <div class="separador"></div>
        <ul class="lista">
          <li class="elemento">
            <svg
              class="lucide lucide-usuarios-redondo"
              stroke-linejoin="round"
              stroke-linecap="round"
              stroke-width="2"
              stroke="#7e8590"
              fill="none"
              viewBox="0 0 24 24"
              height="24"
              width="24"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path d="M18 21a8 8 0 0 0-16 0"></path>
              <circle r="5" cy="8" cx="10"></circle>
              <path d="M22 20c0-3.37-2-6.5-4-8a5 5 0 0 0-.45-8.3"></path>
            </svg>
            <p class="etiqueta">Acceso al Equipo</p>
          </li>
        </ul>
    </div></div>
    </body>
    <script src="js/funcionesLogin.js"></script>
</html>