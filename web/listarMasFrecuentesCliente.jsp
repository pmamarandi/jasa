<%-- 
    Document   : listarMasFrecuentesCliente
    Created on : 25-nov-2015, 12:50:51
    Author     : valea
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="es">
<head>
<title> </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximun-scale=1">
    <link rel="stylesheet" href="tema/css/estilos.css">
    <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
    <script src="tema/js/scripts.js"></script>
    <script language="javascript"  type="text/javascript" >
        function val(e) {
        tecla = (document.all) ? e.keyCode : e.which;
        if (tecla===8) return true;
            patron =/[A-Za-z]/;
            te = String.fromCharCode(tecla);
            return patron.test(te);
        }
        function ValNum(){
            if (event.keyCode < 48 || event.keyCode > 57) {
            event.returnValue = false;
        }
        }
    </script>
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
                        <li><a href="">Ingresar</a></li>
                        <li><a href="#">Modificar</a></li>
                        <li><a href="#">Buscar</a></li>
                        <li><a href="#">Ver todos</a></li>
                  </ul></a></li>
              </a></li>
              <li><a href="#">Proveedores
                    <ul>
                        <li><a href="">Ingresar</a></li>
                        <li><a href="#">Modificar</a></li>
                        <li><a href="#">Buscar</a></li>
                        <li><a href="#">Ver todos</a></li>
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
      <div class="grupo formato_tabla centrar-contenido"> 
            <div class="caja web-100 centro-contenido"> 
                <h2>Listado de clientes por número de compras</h2>
            </div>
            <div class="caja web-100 centro-contenido"> 
            <form action="listarMasFrecuentesCliente.jsp" method="post"> 
                <p>Ingrese el número de compra mínima: 
                    <input type="number" name='txtparametro' min="0" max="1000" required>
                    <input type="submit" title="Buscar" alt="Buscar" name="buscar" value="Buscar" class="boton_verde"></p>
            </form><br>
            <%
                String parametro=request.getParameter("txtparametro");
                try {
                   com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
                    com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort(); 
                    java.lang.String result = port.listarMasFrecuentesCliente(parametro);
                    out.println(result);
                } catch (Exception ex) {
                    // TODO handle custom exceptions here
                }
            %>
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
                    <img src="tema/img/twitter.png">
                </div>
            </div>
        </footer>
    </body>
</html>