<%-- 
    Document   : listarEmpleadoTiempo
    Created on : Dec 30, 2015, 5:52:43 PM
    Author     : Jessica
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
    <script language="javascript" type="text/javascript"></script>
    <script>
        
        
        
   /*function soloLetras(e) { 
tecla = (document.all) ? e.keyCode : e.which; 
if (tecla==8) return true; //Tecla de retroceso (para poder borrar) 
// dejar la lÃ­nea de patron que se necesite y borrar el resto 
patron =/[A-Za-z\sáéíóú]/; // Solo acepta letras 
//patron = /\d/; // Solo acepta nÃºmeros 
//patron = /\w/; // Acepta nÃºmeros y letras 
//patron = /\D/; // No acepta nÃºmeros 
// 
te = String.fromCharCode(tecla); 
return patron.test(te); 
} 
      
   function soloNumeros(e){
	var key = window.Event ? e.which : e.keyCode
	return (key >= 48 && key <= 57)
}*/
   
   </script>
  <body >
        <div class="grupo encabezado_paginas centro">
            <div class="caja web-100 centrar-contenido">
                <p>Bicirepuestos Alexandra</p>
            </div>
        </div>
      <div class="grupo ">
          <img src="tema/img/banner.jpg" >
      </div>
      <div class="grupo web-100">
      
        <%
         // ver mis datos adminsitardor
          String strNombreAdministrador = "";
         String strApellidoAdministrador = "";
          String strCedulaAdministrador= "";
         HttpSession sesionOk = request.getSession();
         strNombreAdministrador = (String) sesionOk.getAttribute("Nombre");
         strApellidoAdministrador = (String) sesionOk.getAttribute("Apellido");
         strCedulaAdministrador = (String) sesionOk.getAttribute("Cedula");
        %>
   <ul class="menu izquierda menu_verde">
        <li><a href="indexAdministrador.jsp">Inicio</a></li>
        <li>
                <a href="VisionMision.jsp">Quienes Somos
                    
                </a>
            </li>
        <li>
            <a href="ModificarAdministrador.jsp?empleadocedula=<%=strCedulaAdministrador%>">Mis Datos
                      
            </a>
        </li>
        <li>
            <a href="#">Productos
                <ul>
                    <li><a href="ListarModificarProducto.jsp?txtparametro='all'">Ver</a></li>
                <%--<li><a href="IngresarProducto.jsp">Ingresar</a></li>
                    <li><a href="ListarModificarProducto.jsp">Modificar</a></li>
                    <li><a href="BuscarProducto.jsp">Buscar</a></li>--%>
                    <li><a href="#">Reportes
                        <ul>
                            <%--<li><a href="ListarProductos.jsp">Todos</a></li>--%>
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
                        <%--<li><a href="RegistrarCliente.jsp">Ingreso</a></li>
                        <li><a href="#">Modificar</a></li>--%>
                        <li><a href="BuscarClientes.jsp">Ver</a></li>
                        <li><a href="#">Reportes
                            <ul>
                                <li><a href="listarMasFrecuentesCliente.jsp">Mejores clientes</a></li>
                            </ul>
                        </li>
                    </ul>
                </a>
            </li>               
        <li>
                <a href="#">Empleados
                    <ul>
                        <li><a href="#">Ver</a></li>
                        <%--<li><a href="#">Modificar</a></li>
                        <li><a href="BuscarEmpleado.jsp">Buscar</a></li> --%>
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
                <ul>
                    <li><a href="BuscarProveedor.jsp">Ver</a></li>
                    <%--<li><a href="ReguistrarProveedor.jsp">Ingresar</a></li>
                    <li><a href="ListarparaModificar.jsp">Modificar</a></li>
                    <li><a href="BuscarProveedor.jsp">Buscar</a></li>
                    <li><a href="#">Listar
                        <ul>
                            <li><a href="listarProveedores.jsp">Todos</a></li>
                        </ul>
                        </li>--%>
                </ul>
            </a>
        </li>
        <li>
            <a href="#">Compras
                <ul>
                    <li><a href="IngresarCompra.jsp">Ingresar</a></li>
                    <li><a href="BuscarComprass.jsp">Ver</a></li>
                    <%--<li><a href="AnularCompra.jsp">Anular</a></li>
                    <li><a href="#">Listar
                        <ul>
                            <li><a href="#">Todos</a></li>
                            <li><a href="ListarComprasAnuladas.jsp">Anuladas</a></li>
                        </ul>
                    </li> --%>
                </ul>
            </a>
        </li>
        <li>
            <a href="#">Facturas
                <ul>
                    <li><a href="IngresarFactura.jsp">Ingresar</a></li>
                    <li><a href="BuscarFactura.jsp">Ver</a></li>
                    <%--<li><a href="AnularFactura.jsp">Anular</a></li>--%>
                    <li><a href="#">Reportes
                          <ul>
                              <%--<li><a href="ListarFactura.jsp">Todos</a></li>
                              <li><a href="ListarFacturasAnuladas.jsp">Anuladas</a></li>--%>              
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
                <h2>Listado de Empleado por Tiempo de Trabajo</h2><br><br>
            </div>
            <div class="caja web-100 centro-contenido"> 
                
                
                <%-- start web service invocation --%>
                <%                  
                    try
                    {
                            
                    com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service service = new com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service();
                    com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio port = service.getBicirepuestosLogicaNegocioPort();
                    java.lang.String result = port.listarEmpleadoTiempo();
                    out.println(result);
                } catch (Exception ex) {
                    // TODO handle custom exceptions here
                }
                %>
                <%-- end web service invocation --%>
                
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
   
