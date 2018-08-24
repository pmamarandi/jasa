<%-- 
    Document   : ListarProductos
    Created on : 08-dic-2015, 19:46:28
    Author     : valea
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <div class="grupo encabezado_paginas centro">
            <div class="caja web-100 centrar-contenido">
                <p>Bicirepuestos Alexandra</p>
            </div>
        </div>
      <div class="grupo ">
          <img src="tema/img/banner.jpg" >
      </div>
      <div class="grupo web-100">
        <ul class="menu izquierda menu_verde">
        <li><a href="indexAdministrador.jsp">Inicio</a></li>
        <li>
                <a href="#">Quienes Somos
                    <ul>
                        <li><a href="#">Misi&oacute;n</a></li>
                        <li><a href="#">Visi&oacute;n</a></li>
                    </ul>
                </a>
            </li>
        <li>
            <a href="#">Mis Datos
                <ul>
                    <li><a href="#">Ver mis datos</a></li>
                    <li><a href="#">Modificar datos</a></li>
                </ul>       
            </a>
        </li>
        <li>
            <a href="#">Productos
                <ul>
                    <li><a href="IngresarProducto.jsp">Ingresar</a></li>
                    <li><a href="ListarModificarProducto.jsp">Modificar</a></li>
                    <li><a href="BuscarProducto.jsp">Buscar</a></li>
                    <li><a href="#">Listar
                        <ul>
                            <li><a href="ListarProductos.jsp">Todos</a></li>
                            <li><a href="listarProductosMasVendidos.jsp">M&aacute;s vendidos</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Marcas
                        <ul>
                            <li><a href="IngresarMarca.jsp">Ingresar</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Procedencias
                            <ul>
                                <li><a href="IngresarProcedencia.jsp">Ingresar</a></li>
                            </ul>
                    </li>
                </ul>
            </a>
        </li>
        <li>
                <a href="#">Clientes
                    <ul>
                        <li><a href="RegistrarCliente.jsp">Ingreso</a></li>
                        <li><a href="#">Modificar</a></li>
                        <li><a href="BuscarClientes.jsp">Buscar</a></li>
                        <li><a href="#">Listar
                            <ul>
                                <li><a href="#">Todos</a></li>
                            </ul>
                        </li>
                    </ul>
                </a>
            </li>               
        <li>
                <a href="#">Empleados
                    <ul>
                        <li><a href="#">Ingresar</a></li>
                        <li><a href="#">Modificar</a></li>
                        <li><a href="BuscarEmpleado.jsp">Buscar</a></li>
                        <li><a href="#">Listar
                            <ul>
                                <li><a href="#">Todos</a></li>
                                <li><a href="ListarEmpleadosporSueldo.jsp">Por Sueldo</a></li>
                                <li><a href="ListarEmpledoTiempo.jsp">D&iacute;as laborados</a></li>
                            </ul>
                        </li>
                    </ul>
                </a>
            </li>
        <li>
            <a href="#">Proveedores
                <ul>
                    <li><a href="ReguistrarProveedor.jsp">Ingresar</a></li>
                    <li><a href="ListarparaModificar.jsp">Modificar</a></li>
                    <li><a href="BuscarProveedor.jsp">Buscar</a></li>
                    <li><a href="#">Listar
                        <ul>
                            <li><a href="listarProveedores.jsp">Todos</a></li>
                        </ul>
                    </li>
                </ul>
            </a>
        </li>
        <li>
            <a href="#">Compras
                <ul>
                    <li><a href="#">Ingresar</a></li>
                    <li><a href="BuscarComprass.jsp">Buscar</a></li>
                    <li><a href="AnularCompra.jsp">Anular</a></li>
                     <li><a href="#">Listar
                        <ul>
                            <li><a href="#">Todos</a></li>
                            <li><a href="ListarComprasAnuladas.jsp">Anuladas</a></li>
                        </ul>
                    </li>
                </ul>
            </a>
        </li>
        <li>
            <a href="#">Facturas
                <ul>
                    <li><a href="IngresarFactura.jsp">Ingresar</a></li>
                    <li><a href="BuscarFactura.jsp">Buscar</a></li>
                    <li><a href="AnularFactura.jsp">Anular</a></li>
                    <li><a href="#">Listar
                          <ul>
                              <li><a href="ListarFactura.jsp">Todos</a></li>
                              <li><a href="ListarFacturasAnuladas.jsp">Anuladas</a></li>
                              <li><a href="listarMasFrecuentesCliente.jsp">Mejores clientes</a></li>
                              <li><a href="listarMejorCompraCliente.jsp">Mejores ventas</a></li>
                              <li><a href="listarFacturasporFecha.jsp">Por Fecha</a></li>
                          </ul>
                      </li>
                  </ul>
              </a>
        </li>
      </ul>
    </div>
      <div class="grupo formato_tabla centrar-contenido"> 
            <div class="caja web-100 centro-contenido"> 
                <h2>Listado de productos</h2>
                <form method="post" action="reportesProductos.jsp" name="reporteProductosPDF">
                    <input type="submit" value="Reporte PDF" class="boton_verde"/>
                </form>
            </div>
            <div class="caja web-100 centro-contenido"> 
            </div>
             <%
                try 
                {
                    com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service service = new com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service();
                    com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio port = service.getBicirepuestosLogicaNegocioPort();
                    // TODO process result here
                    String result = port.listarProductos();
                    out.println(result);
                } 
                catch (Exception ex) 
                {
                    // TODO handle custom exceptions here
                }
    %>
                <br>
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
                    <img src="tema/img/twitter.png">
                </div>
            </div>
        </footer>
    </body>
</html>