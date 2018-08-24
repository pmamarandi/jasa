<%-- 
    Document   : ModificarEmpleado
    Created on : 06/01/2016, 20:43:04
    Author     : monse
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String cedula = request.getParameter("empleadocedula");
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
         <%
              String strNombreEmpleado = "";
              String strApellidoEmpleado = "";
              String strCedulaEmpleado = "";
              HttpSession sesionOk = request.getSession();
              strNombreEmpleado = (String) sesionOk.getAttribute("Nombre");
              strApellidoEmpleado = (String) sesionOk.getAttribute("Apellido");
              strCedulaEmpleado = (String) sesionOk.getAttribute("Cedula");
          %>
            <ul class="menu izquierda menu_verde">
                <li><a href="indexEmpleado.jsp">Inicio</a></li>
                <li><a href="#">Quienes Somos</a></li>
                <li><a href="ModificarEmpleado.jsp?empleadocedula=<%=strCedulaEmpleado%>">Mis Datos</a></li>
                <li><a href="BuscarClientesEmpleado.jsp">Clientes</a></li>  
                <li><a href="buscarProveedorEmpleado.jsp">Proveedores</a></li>
                <li><a href="ListarModificarProductoEmpleado.jsp">Productos</a></li>        
                <li><a href="#">Ventas
                      <ul>
                          <li><a href="IngresarFacturaEmpleado.jsp">Ingresar</a></li>
                          <li><a href="BuscarFacturaEmpleado.jsp">Ver</a></li>
                      </ul>
                    </a>
                </li>        
            </ul>
      </div>
      <div class="grupo formato_tabla centrar-contenido"> 
            <form method='POST' action='controladorModificarEmpleado.jsp' name="modificarEmpleado">
              <h2>Modificar Empleado</h2>
              
                <%
                    com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service service = new com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service();
                    com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio port = service.getBicirepuestosLogicaNegocioPort();
                    String result = port.listarEmpleado(cedula);
                    out.println(result);
                %>
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
              <img src="tema/img/twitter.png" alt=""/>
          </div>
      </div>
    </footer>
  </body>
</html>
