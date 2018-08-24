<%-- 
    Document   : ReguistrarProveedor
    Created on : 13/01/2016, 12:01:03
    Author     : monse
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html><%
    if(request.getParameter("result") != null){
    if(request.getParameter("result").equals("error")){
    %>
        <script>alert('Proveedor no registrado');</script>
    <%
    }
else
{
    if(request.getParameter("result").equals("Ruc Incorrecta")){
    %>
        <script>alert('Ruc Incorrecta');</script>
    <%
    }
else
{
    if(request.getParameter("result").equals("No hay conexion con la base de datos")){
    %>
        <script>alert('No hay conexion con la base de datos');</script>
    <%
    }
    else
    {
      if(request.getParameter("result").equals("si existe")){
    %>
        <script>alert('El Proveedor ya existe');</script>
    <%
    }  
        
    }}
    
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
    <script>
   function soloLetras(e) { 
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
}
   
   </script>
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
      <div class="grupo formato_tabla centrar-contenido "> 
            <form method="post" action="ControladorRegistrarProveedor.jsp" name="registrar">
                <h2>Ingresar Proveedor</h2><br>
                <div class="caja web-45 movil-40 derecha-contenido"  id="stylized">
                    <label>Ruc</label><br>
                    <label>Nombre</label><br>
                    <label>Direcci&oacute;n</label><br>
                    <label>Tel&eacute;fono</label><br>
                    <label>Ciudad</label><br>
                    
                </div>              
                <div class="caja web-55 izquierda-contenido"  id="stylized">
                    <input type="text" name="ruc"  size="30" maxlength="13" onkeypress="return soloNumeros(event)" placeholder="ejm 0603990078001" required><br>
                    <input type="text" name="nombre"  size="30" maxlength="30" onkeypress="return soloLetras(event)" required><br>
                    <input type="text" name="direccion"  size="30" maxlength="30" required><br>
                    <input type="text" name="telefono"  size="30" maxlength="10" onkeypress="return soloNumeros(event)" placeholder="ejm 0987654321" required><br> 
                    <input type="text" name="ciudad" size="30"  maxlength="50" onkeypress="return soloLetras(event)" required><br><br>           
                </div>
                 <input class="boton_verde" type="submit" name="registrar" value="Registrar">
            </form><br>
        </div>
   <footer>
            <div class="grupo pie centro" >
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
Fin de la conversación

</html>
