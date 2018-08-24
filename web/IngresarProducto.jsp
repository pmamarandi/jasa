<%-- 
    Document   : IngresarProducto
    Created on : 23-nov-2015, 20:23:09
    Author     : valea
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html><%
    if(request.getParameter("result") != null){
    if(request.getParameter("result").equals("error")){
    %>
        <script>alert('Producto no Registrado');</script>
    <%
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
    <script language="javascript" type="text/javascript"></script>
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
              <li><a href="#">Quienes Somos
                      <ul>
                    <li><a href="#">Misi&oacute;n</a></li>
                    <li><a href="#">Visi&oacute;n</a></li>
                  </ul></a></li>
              <li><a href="#">Mis Datos
                    <ul>
                        <li><a href="#">Ver mis datos</a></li>
                        <li><a href="#">Modificar datos</a></li>
                  </ul></a></li>
              </a></li>
              <li><a href="#">Productos
                    <ul>
                        <li><a href="IngresarProducto.jsp">Ingresar</a></li>
                        <li><a href="#">Modificar</a></li>
                        <li><a href="BuscarProducto.jsp">Buscar</a></li>
                        <li><a href="#">Ver todos</a></li>
                        <li><a href="listarProductosMasVendidos.jsp">M&aacute;s vendidos</a></li>
                        <li><a href="#">Marcas
                                <ul>
                                    <li><a href="IngresarMarca.jsp">Ingresar marca</a></li>
                                </ul>
                        </a></li>
                        <li><a href="#">Procedencias
                                <ul>
                                    <li><a href="IngresarProcedencia.jsp">Ingresar procede</a></li>
                                </ul>
                        </a></li>
                  </ul></a></li>
              </a></li>
              <li><a href="#">Clientes
                    <ul>
                        <li><a href="RegistrarCliente.jsp">Ingreso</a></li>
                        <li><a href="#">Modificar</a></li>
                        <li><a href="BuscarClientes.jsp">Buscar</a></li>
                        <li><a href="#">Listar Clientes</a></li>
                  </ul></a></li>
              </a></li>
              <li><a href="#">Empleados
                    <ul>
                        <li><a href="#">Ingresar</a></li>
                        <li><a href="#">Modificar</a></li>
                        <li><a href="#">Buscar</a></li>
                        <li><a href="#">Listar todos</a></li>
                  </ul></a></li>
              </a></li>
              <li><a href="#">Proveedores
                    <ul>
                        <li><a href="">Ingresar</a></li>
                        <li><a href="#">Modificar</a></li>
                        <li><a href="#">Buscar</a></li>
                        <li><a href="#">Listar todos</a></li>
                  </ul></a></li>
              </a></li>
              <li><a href="#">Compras
                    <ul>
                        <li><a href="#">Ingresar</a></li>
                        <li><a href="#">Modificar</a></li>
                        <li><a href="BuscarComprass.jsp">Buscar</a></li>
                        <li><a href="AnularCompra.jsp">Anular</a></li>
                        <li><a href="ListarComprasAnuladas.jsp">Listar anuladas</a></li>
                  </ul></a></li>
              <li><a href="#">Ventas
                    <ul>
                        <li><a href="#">Ingresar Factura</a></li>
                        <li><a href="#">Buscar Factura</a></li>
                        <li><a href="#">Listar Facturas</a></li>
                        <li><a href="listarMasFrecuentesCliente.jsp">Clientes frec. </a></li>
                        <li><a href="listarMejorCompraCliente.jsp">Mejores ventas</a></li>
                  </ul></a></li>
              </a></li>
            </ul>
      </div>
      
      <div class="grupo formato_tabla centrar-contenido "> 
            <form method="post" action="controladorIngresarProducto.jsp" name="registrar">
                <h2>Ingreso de Productos</h2><br>
                <div class="caja web-45 derecha-contenido"  id="stylized">
                    <label>C&oacute;digo</label><br>
                    <label>Descripci&oacute;n</label><br>
                    <label>Marca</label><br>
                    <label>Procedencia</label><br>
                    <label>Precio Unitario</label><br>
                    <label>Stock</label><br>
                </div>              
                <div class="caja web-55 izquierda-contenido"  id="stylized">
                    <input type="text" name="codigo"  size="30" maxlength="6" required><br>
                    <input type="text" name="descripcion"  size="30" maxlength="50" required ><br>
                    <%
                    try
                    {
                        com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
                        com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
                        
                        String marcas = port.listarMarcas();
                        out.println(marcas);
                    }
                    catch(Exception ex) 
                    {
                                
                    }
                %><br>
                    <%
                    try
                    {
                        com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
                        com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();                        
                        String procedencias = port.listarProcedencias();
                        out.println(procedencias);
                    }
                    catch(Exception ex) 
                    {
                                
                    }
                %><br>
                    <input type="number" name="precio"  min="0" max="500" step="0.01"  required><br>
                    <input type="number" name="stock"  min="0" max="100" step="1"  required><br><br>
                </div>
                <input class="boton_verde" type="submit" name="registrar" value="Ingresar">
            </form><br>
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


