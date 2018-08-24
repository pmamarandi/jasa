<%-- 
    Document   : MostrarFactura
    Created on : 06/01/2016, 23:21:41
    Author     : monse
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        <li><a href="ListarProductos.jsp">Ver todos</a></li>
                        <li><a href="listarProductosMasVendidos.jsp">M&aacute;s vendidos</a></li>
                        <li><a href="#">Marcas
                            <ul>
                                <li><a href="IngresarMarca.jsp">Ingresar marca</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Procedencias
                                <ul>
                                    <li><a href="IngresarProcedencia.jsp">Ingresar procede</a></li>
                                </ul>
                        </li>
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
              <li><a href="#">Facturas
                    <ul>
                        <li><a href="IngresarFactura.jsp">Ingresar</a></li>
                        <li><a href="BuscarFactura.jsp">Buscar</a></li>
                        <li><a href="ListarFacturasAnuladas.jsp">Listar Anuladas</a></li>
                        <li><a href="listarMasFrecuentesCliente.jsp">N. compras</a></li>
                        <li><a href="listarMejorCompraCliente.jsp">Mejores ventas</a></li>
                        <li><a href="listarFacturasporFecha.jsp">Listar por Fecha</a></li>
                  </ul></a></li>
              </a></li>
            </ul>
      </div>
        <div class="grupo formato_tabla centrar-contenido"> 
            <h2> Factura Electr&oacute;nica</h2>
                
             <br><br>
             
             <FORM NAME="slibro" ACTION="" METHOD="GET">
            <div class=" caja centro centrar-contenido web-100">
            <%
                String facturaNumero = request.getParameter("numero");
                if(facturaNumero != null)
                        {
                                 com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
	com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
                            java.lang.String result = port.getFacturaId(facturaNumero);
                            out.println(result);
                        }
                else{
                    try {
                        String parametro = request.getParameter("txtparametro");
                        
                        String delimitadores= "[ .,;?!¡¿\'\"\\[\\]]+";
                        String[] palabrasSeparadas = parametro.split(delimitadores);
                        String variableAencontrar=palabrasSeparadas[0];
                        Integer longitud = parametro.length();
                        
                                if (longitud > 0) 
                                {
                                          com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
	com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();;
                                    String esTbl  = port.getFacturas(variableAencontrar);
                                    out.println(esTbl);
                                } 
                                else 
                                {

                                  Integer cero = 0;
                                    response.sendRedirect("BuscarFactura.jsp?variableVacia=" + cero.toString() + "");  

                                }
                                if((request.getParameter("txtparametro"))== null)
                                    {
                                    %>
                                            <h4>Datos no encontrados</h4>
                                    <%
                                    }
                    } catch (Exception e) {

                    }
}
                %><br><br>
                <input type="submit" class="boton_verde" name="imprimir" value="Aceptar" onClick="document.forms.slibro.action='ControladorImprimir.jsp'; document.forms.slibro.submit()"><br><br>
   
            </div>
        </div>
     </form>
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

