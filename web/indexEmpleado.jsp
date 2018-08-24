<%-- 
    Document   : indexEmpleado
    Created on : 01-dic-2015, 20:03:32
    Author     : valea
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if(request.getParameter("result") != null)
    {
        if(request.getParameter("result").equals("ok"))
        {
        %>
            <script>alert('Cliente ingresado correctamente');
                    window.redirected = 'index.jsp';
            </script>
        <%
        }
        else
        {
            if(request.getParameter("result").equals("okP"))
            {
        %>
            <script>alert('Producto ingresado correctamente');
                    window.redirected = 'index.jsp';
            </script>
        <%
            }
            else
            {
                if(request.getParameter("result").equals("okM"))
                {
                %>
                    <script>alert('Marca registrada correctamente');
                            window.redirected = 'index.jsp';
                    </script>
                <%

                }
                else
                {
                    if(request.getParameter("result").equals("okM"))
                    {
                    %>
                        <script>alert('Procedencia registrada correctamente');
                            window.redirected = 'index.jsp';
                        </script>
                    <%
                    
                    }
                }
            }
        }
    }
    %>
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
              String strNombreEmpleado = "";
              String strApellidoEmpleado = "";
              String strCedulaEmpleado = "";
              HttpSession sesionOk = request.getSession();
              strNombreEmpleado = (String) sesionOk.getAttribute("Nombre");
              strApellidoEmpleado = (String) sesionOk.getAttribute("Apellido");
              strCedulaEmpleado = (String) sesionOk.getAttribute("Cedula");
          %>
            <ul class="menu izquierda menu_verde">
                <li><a href="indexEmpleado.jsp">Inicio</a></li>
                <li><a href="#">Quienes Somos</a></li>
                <li><a href="ModificarEmpleado.jsp?empleadocedula=<%=strCedulaEmpleado%>">Mis Datos</a></li>
                <li><a href="BuscarClientesEmpleado.jsp">Clientes</a></li>  
                <li><a href="buscarProveedorEmpleado.jsp">Proveedores</a></li>
                <li><a href="ListarModificarProductoEmpleado.jsp?txtparametro='all'">Productos</a></li>        
                <li><a href="#">Ventas
                      <ul>
                          <li><a href="IngresarFacturaEmpleado.jsp">Ingresar</a></li>
                          <li><a href="BuscarFacturaEmpleado.jsp">Ver</a></li>
                      </ul>
                    </a>
                </li>        
            </ul>
    </div>
      <div class="grupo"> 
            <div class="grupo fondo_index"> 
                <div class="caja fondo_login izquierda web-60 "></div>
                    <div class="caja web-40 derecha " >         
                        <div class="caja contenido_login centrar-contenido">
                            
                            <p>
                                <h2>Bienvenido al sistema</h2>
                                <h3><%out.print(strNombreEmpleado + " " + strApellidoEmpleado);%></h3>
                                <h4><br>Area de trabajo del empleado<br></h4>
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
