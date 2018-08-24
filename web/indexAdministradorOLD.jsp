<%-- 
    Document   : indexAdministrador
    Created on : 26-nov-2015, 8:04:27
    Author     : valea
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
         // ver mis datos adminsitardor
          String strNombreAdministrador = "Sara";
         String strApellidoAdministrador = "Tixi";
          String strCedulaAdministrador= "0602633968";
         HttpSession sesionOk = request.getSession();
         sesionOk.setAttribute("Nombre","Sara");
                        sesionOk.setAttribute("Apellido","Tixi");
                        sesionOk.setAttribute("Cedula","0602633968");
        %>
        <ul class="menu izquierda menu_verde">
        <li><a href="indexAdministrador.jsp">Inicio</a></li>
        <li><a href="VisionMision.jsp">Quienes Somos</a></li>
        <li><a href="ModificarAdministrador.jsp?empleadocedula=<%=strCedulaAdministrador%>">Mis Datos</a></li>
        <li>
            <a href="#">Productos
                <ul>
                    <li><a href="ListarModificarProducto.jsp?txtparametro='all'">Ver</a></li>
                    <li><a href="#">Reportes
                            <ul><li><a href="listarProductosMasVendidos.jsp">M&aacute;s vendidos</a></li></ul>
                        </a>
                    </li>
                    <li><a href="IngresarMarca.jsp">Marcas</a></li>
                    <li><a href="IngresarProcedencia.jsp">Procedencias</a></li>
                </ul>
            </a>
        </li>
        <li>
            <a href="#">Clientes
                <ul>
                    <li><a href="BuscarClientes.jsp">Ver</a></li>
                    <li><a href="#">Reportes
                        <ul><li><a href="listarMasFrecuentesCliente.jsp">Mejores clientes</a></li></ul>
                    </li>
                </ul>
            </a>
        </li>               
        <li>
            <a href="#">Empleados
                <ul>
                    <li><a href="BuscarEmpleado.jsp">Ver</a></li>
                    <li><a href="#">Reportes
                        <ul>
                            <li><a href="ListarEmpleadosporSueldo.jsp">Por Sueldo</a></li>
                            <li><a href="ListarEmpledoTiempo.jsp">D&iacute;as laborados</a></li>
                        </ul>
                    </li>
                </ul>
            </a>
        </li>
        <li>
            <a href="#">Proveedores
                <ul><li><a href="BuscarProveedor.jsp">Ver</a></li></ul>
            </a>
        </li>
        <li>
            <a href="#">Compras
                <ul>
                    <li><a href="IngresarCompra.jsp">Ingresar</a></li>
                    <li><a href="BuscarComprass.jsp">Ver</a></li>
                </ul>
            </a>
        </li>
        <li>
            <a href="#">Facturas
                <ul>
                    <li><a href="IngresarFactura.jsp">Ingresar</a></li>
                    <li><a href="BuscarFactura.jsp">Ver</a></li>
                    <li><a href="#">Reportes
                        <ul>
                            <li><a href="listarMejorCompraCliente.jsp">Mejores ventas</a></li>
                            <li><a href="listarFacturasporFecha.jsp">Por Fecha</a></li>
                        </ul>
                   </li>
                </ul>
            </a>
        </li>
      </ul>
    </div>
      <div class="grupo"> 
            <div class="grupo fondo_index"> 
                <div class="caja fondo_login izquierda web-60 "></div>
                    <div class="caja web-40 derecha centrar-contenido " >         
                        <div class="caja contenido_login centrar-contenido">
                            
                            <p>
                                <h2>Bienvenido al sistema</h2>
                                <h3><%out.print(strNombreAdministrador + " " + strApellidoAdministrador);%></h3>
                                <h4><br>Esta es su area de trabajo</h4>
                                </p></a>
                            </p>
                             <br><a href="cerrarsesion.jsp"><input class="boton_verde" type="button" value="Cerrar Sesión"/></a><br>
                        </div> 
            <div class="caja fuente_slogan" >
                <p><br>Nuestra <b>experiencia</b> en la venta<br> y repaci&oacute;n de <b>bicicletas</b><br> Nos respalda...<br><br></p>
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