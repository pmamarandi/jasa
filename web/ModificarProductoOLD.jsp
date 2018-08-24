<%-- 
    Document   : ModificarProducto
    Created on : 13/01/2016, 15:43:35
    Author     : monse
--%>

<%@page import="com.factime.ln.ws.FactimeLogicaNegocio_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String IdP = request.getParameter("id");
    %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title> </title>
        <meta charset="utf-8">

        <link rel="stylesheet" href="tema/css/estilos.css">
        <script>
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
        <%
             String vacio = (request.getParameter("variableVacia") != null) ? request.getParameter("variableVacia") : "1";
            Integer vacioInt = Integer.parseInt(vacio);
            if (vacioInt == 0) {
                vacio = "Datos no encontrados";                
            } else {
                vacio = "";
            }
        %>
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
                        <li><a href="">Ingresar</a></li>
                        <li><a href="#">Modificar</a></li>
                        <li><a href="#">Buscar</a></li>
                        <li><a href="ListarComprasAnuladas.jsp">Listar anuladas</a></li>
                  </ul></a></li>
              </a></li>
              <li><a href="#">Ventas
                    <ul>
                        <li><a href="#">Ingresar Factura</a></li>
                        <li><a href="BuscarFactura">Buscar Factura</a></li>
                        <li><a href="#">Listar Facturas</a></li>
                        <li><a href="listarMasFrecuentesCliente.jsp">Clientes frec. </a></li>
                        <li><a href="listarMejorCompraCliente.jsp">Mejores ventas</a></li>
                  </ul></a></li>
              </a></li>
            </ul>
      </div>
      <div class="grupo formato_tabla centrar-contenido"> 
            <div class="caja web-100 centro-contenido">  
                <h2> Producto a Modificar</h2>
            </div>
          <div class="caja web-100 centro-contenido">
          <div class="row">
          <div class="form-group">
          <div class="col-md-5">
              
              <form action="ControladorModificarProducto.jsp" method="post">                                    
                    
                 <%                  
	com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
	com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
	String result = port.mostrarModificarP(IdP);
	out.println(result);
         %>
                </form>
             
            </div>
                <br>
        </div>
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







