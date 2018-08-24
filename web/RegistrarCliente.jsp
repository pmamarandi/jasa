<%-- 
    Document   : RegistrarCliente
    Created on : 20/11/2015, 17:37:16
    Author     : paul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html><%
    if(request.getParameter("result") != null){
    if(request.getParameter("result").equals("error")){
    %>
        <script>alert('Cliente no registrado');</script>
    <%
    }
else
{
    if(request.getParameter("result").equals("cedula incorrecta")){
    %>
        <script>alert('Cedula Incorrecta');</script>
    <%
    }
else
{
    if(request.getParameter("result").equals("No hay conexion con la base de datos")){
    %>
        <script>alert('No hay conexion con el servidor');</script>
    <%
    }
    else
    {
      if(request.getParameter("result").equals("si existe")){
    %>
        <script>alert('el cliente ya existe');</script>
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
                        </li>
                        <li><a href="#">Procedencias
                                <ul>
                                    <li><a href="IngresarProcedencia.jsp">Ingresar procede</a></li>
                                </ul>
                        </li>
                  </ul></li>
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
              <li><a href="#">Facturas
                    <ul>
                        <li><a href="#">Ingresar</a></li>
                        <li><a href="#">Buscar</a></li>
                        <li><a href="ListarFacturasAnuladas.jsp">Listar Anuladas</a></li>
                        <li><a href="listarMasFrecuentesCliente.jsp">N. compras</a></li>
                        <li><a href="listarMejorCompraCliente.jsp">Mejores ventas</a></li>
                  </ul></a></li>
              </a></li>
            </ul>
      </div>
      <div class="grupo formato_tabla centrar-contenido "> 
            <form method="post" action="controladorRegistrar.jsp" name="registrar">
                <h2>Ingreso de Clientes</h2><br>
                <div class="caja web-45 movil-40 derecha-contenido"  id="stylized">
                    <label>C&eacute;dula</label><br>
                    <label>Nombres</label><br>
                    <label>Apellidos</label><br>
                    <label>Tel&eacute;fono</label><br>
                    <label>Direcci&oacute;n</label><br>
                    <label>Contrase&ntilde;a</label><br>
                </div>              
                <div class="caja web-55 movil-60 izquierda-contenido"  id="stylized">
                    <input type="text" name="cedula"  size="30" maxlength="10" onkeypress="return soloNumeros(event)" placeholder="ejm 0603990078" required><br>
                    <input type="text" name="nombre"  size="30" maxlength="30" onkeypress="return soloLetras(event)" required><br>
                    <input type="text" name="apellido"  size="30" maxlength="30" onkeypress="return soloLetras(event)" required><br>
                    <input type="text" name="telefono"  size="30" maxlength="10" onkeypress="return soloNumeros(event)" placeholder="ejm 0987654321" required><br> 
                    <input type="text" name="direccion" size="30"  maxlength="50" required><br>
                    <input type="password" name="clave"  size="30" maxlength="10"  required><br><br>
                </div>
                <input class="boton_verde" type="submit" name="registrar" value="Registrar">
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