<%-- 
    Document   : BuscarProveedor
    Created on : 06/01/2016, 15:30:03
    Author     : monse
--%>

<%@page import="com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service"%>
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
                <h2> PROVEEDORES</h2>
            </div>
            <div class="caja web-100 centro-contenido">
                <form action="buscarProveedorEmpleado.jsp" method="post">                                    
                <p>Ingrese el dato a buscar: 
                    <input type="text" name='txtparametro' size="15" maxlength="15" onkeypress="return val(event), return ValNum(event)" required>
                    <input type="submit" title="Buscar" alt="Buscar" name="buscar" value="Buscar" class="boton_verde"></p>
            </form><br><br>
                <%
             
                    try {
                        com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service service = new com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service();
                         com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio port = service.getBicirepuestosLogicaNegocioPort();
                            
                        String parametro = request.getParameter("txtparametro");
                        
                        if(request.getParameter("txtparametro")==null)
                        {
                            
                            java.lang.String result = port.listarProveedoresEmpleado();
                            out.println(result);
                        }
                        else
                        {
                        
                            String delimitadores= "[ .,;?!¡¿\'\"\\[\\]]+";
                            String[] palabrasSeparadas = parametro.split(delimitadores);
                            String variableAencontrar=palabrasSeparadas[0];
                            Integer longitud = parametro.length();
                        if (longitud > 0) 
                        {
                            //com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service service = new com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service();
                            //com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio port = service.getBicirepuestosLogicaNegocioPort();
                            String esTbl = port.buscarProveedorEmpleado(variableAencontrar);
                                                     
                            out.println(esTbl);
                        
                        } else 
                        {
                            Integer cero = 0;
                            response.sendRedirect("buscarProveedorEmpleado.jsp?variableVacia=" + cero.toString() + "");  
                            
                            
                        }
                           
                        if((request.getParameter("txtparametro"))== null)
                            {
                            %>
                                    <h4>Datos no encontrados</h4>
                            <%
                            java.lang.String result = port.listarProveedoresEmpleado();
                            out.println(result);
                            
                            
                        }
                        }
                    } catch (Exception e) {

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

