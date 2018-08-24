<%-- 
    Document   : indexCliente
    Created on : 18/11/2015, 14:26:39
    Author     : paul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
  <head>
    <title> </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximun-scale=1">
    <link rel="stylesheet" href="tema/css/estilos.css">
    <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
    <script src="tema/js/scripts.js"></script>
  </head>
  <body>
        <div class="grupo encabezado centro">
            <div class="caja web-100 centrar-contenido">
                <p>Bicirepuestos Alexandra</p>
            </div>
        </div>
      <div class="grupo web-100">
            <%
                String strNombreCliente = "";
                String strApellidoCliente = "";
                String strCedulaCliente = "";
                HttpSession sesionOk = request.getSession();
                     strCedulaCliente = (String) sesionOk.getAttribute("Cedula");
                strNombreCliente = (String) sesionOk.getAttribute("Nombre");
                strApellidoCliente = (String) sesionOk.getAttribute("Apellido");
           
            %>
            <ul class="menu izquierda menu_verde">
              <li><a href="indexCliente.jsp">Inicio</a></li>
              <li><a href="#">Quienes Somos</a></li>
              <li><a href="ModificarClientes.jsp?clientecedula='<%=strCedulaCliente%>'">Mis Datos</a></li>
              <li><a href="BuscarProductoCliente.jsp?txtparametro='all'">Productos</a></li>
              <li><a href="listarfacturasCliente.jsp?clientecedula='<%=strCedulaCliente%>'">Mis facturas</a></li>
            </ul>
      </div>
      <div class="grupo"> 
            <div class="grupo fondo_index"> 
                <div class="caja fondo_login izquierda web-60 "></div>
                    <div class="caja web-40 derecha " >         
                        <div class="caja contenido_login centrar-contenido">
                            
                            <p>
                                <h2>Bienvenid@ a nuestro servicio online</h2>
                                <h3><%out.print(strNombreCliente + " " + strApellidoCliente);%></h3>
                                <h4><br>Es un placer atenderlo<br></h4><br>
                                <a href="cerrarsesion.jsp"><input class="boton_verde" type="button" value="Cerrar Sesión"/><br></p></a>
                            </p><br>
                        </div> 
            <div class="caja fuente_slogan" >
                <p>Nuestra <b>experiencia</b> en la venta<br> y repaci&oacute;n de <b>bicicletas</b><br> Nos respalda...</p><br><br><br>
            </div>
          </div>
      </div>
    <footer>
      <div class="grupo pie centro">
        <div class="caja web-70 centrar-contenido">
          <p>Dirección: Venezuela 22-07 y Espejo <br>Riobamba-Ecuador<br>© Bicirepuestos "Alexandra" - 2015</p>
        </div>
          <div class="caja web-10 redes">
              <img src="tema/img/facebook.png">
          </div>
          <div class="caja web-10 redes">
              <img src="tema/img/images.png">
          </div>
          <div class="caja web-10 redes">
              <img src="tema/img/twitter.png" alt=""/>
          </div>
      </div>
    </footer>
  </body>
</html>