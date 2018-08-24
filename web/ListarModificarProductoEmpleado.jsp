<%-- 
    Document   : BuscarProductos
    Created on : 30/11/2015, 16:12:24
    Author     : Eddie-PC
--%>


<%@page import="com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String b = "todos"; %>
<!DOCTYPE html>
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
                <li><a href="ListarModificarProductoEmpleado.jsp?txtparametro='all'">Productos</a></li>        
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
            <div class="caja web-100 centro-contenido">  
                <h2>PRODUCTOS</h2>
            </div>
          <div class="caja web-100 centro-contenido">
              <form action="ListarModificarProductoEmpleado.jsp" method="post">                                    
                    <tr><td>Ingrese el dato a buscar: </td>
                        <td><input type="text" name='txtparametro' size="15" maxlength="15" onkeypress="return val(event), return ValNum(event)" required></td>                                         
                        <td colspan="2" align="center"><input type="submit" name="buscar" class="boton_verde"></td>
                </form>
                <br>
                <%
                    try {
                        
                        String parametro = request.getParameter("txtparametro");                   
                        String delimitadores= "[ .,;?!¡¿\'\"\\[\\]]+";
                        String[] palabrasSeparadas = parametro.split(delimitadores);
                        String variableAencontrar=palabrasSeparadas[0];
                        Integer longitud = parametro.length();
                   if (longitud > 0) 
                        {
                            com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service service = new com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service();
                            com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio port = service.getBicirepuestosLogicaNegocioPort();
                            String esTbl = port.productosBuscar(variableAencontrar);                                                  
                            out.println(esTbl);
                        
                        } else 
                        {
                            
                          Integer cero = 0;
                            response.sendRedirect("ListarModificarProductoEmpleado.jsp?variableVacia=" + cero.toString() + "");  
                            
                        }
                        if((request.getParameter("txtparametro"))== null)
                            {
                            %>
                                    <h4>Datos no encontrados</h4>
                            <%
                            }
                        
                    } catch (Exception e) {

                    }

                %>
            </div><br>
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