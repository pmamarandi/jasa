<%-- 
    Document   : AnularFactura
    Created on : 21-dic-2015, 4:40:13
    Author     : JESUS
--%>
<p onclick="alert('Un mensaje de prueba')"></p>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<p onclick="alert('Un mensaje de prueba')"></p>
<%
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
        
  
      <%-- Funcion años--%>            
        
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
  <body onLoad="setAnios()">
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
                        <li><a href="">Ingresar</a></li>
                        <li><a href="#">Modificar</a></li>
                        <li><a href="#">Buscar</a></li>
                        <li><a href="#">Ver todos</a></li>
                  </ul></a></li>
              </a></li>
              <li><a href="#">Ventas
                    <ul>
                        <li><a href="listarMasFrecuentesCliente.jsp">Clientes frec. </a></li>
                        <li><a href="listarMejorCompraCliente.jsp">Mejores ventas</a></li>
                  </ul></a></li>
              </a></li>
            </ul>
      </div>
      <div class="grupo formato_tabla centro ">          
            <div class="caja web-100 centro-contenido">                 
            <font color="red">Factura Anulada</font>   
            <form action="AnularFactura.jsp">
                <input class="boton_verde" type="submit" name="listar" value="Regresar">
            </form>
        </div>
      </div>>
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