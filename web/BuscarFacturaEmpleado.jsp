<%-- 
    Document   : BuscarFactura
    Created on : 15/12/2015, 23:37:47
    Author     : paul
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
                 <li><a href="#">Clientes
                      <ul>
                          <li><a href="ListarClientesEmpleado.jsp">Ver</a></li>
                      </ul>
                    </a>
                </li>    
                <li><a href="#">Proveedores</a></li>
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
                <h2>FACTURAS</h2>
                <form action="BuscarFactura.jsp" method="post">                                    
                Ingrese el dato a buscar:
                <input type="text" name='txtparametro' size="15" maxlength="30" onkeypress="return val(event), return ValNum(event)">                                        
                <input type="submit" name="buscar" class="boton_verde">
                </form>
             <br><br>
            <div class=" caja centro centrar-contenido web-100">
            <%
            try {                    
                        String parametro = request.getParameter("txtparametro");
                        if(parametro == null)
                        {
                            com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service service = new com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service();
                            com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio port = service.getBicirepuestosLogicaNegocioPort();
                            java.lang.String result = port.listarFactura();
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
                            com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service service = new com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service();
                            com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio port = service.getBicirepuestosLogicaNegocioPort();
                            String esTbl  = port.getFacturasVer(variableAencontrar);
                            out.println(esTbl);
                        } 
                        else 
                        {
                            Integer cero = 0;
                            response.sendRedirect("BuscarFactura.jsp");
                        }
                        if((request.getParameter("txtparametro"))== null)
                        {
                            %>
                            <h4>Datos no encontrados</h4>
                            <%
                        }
                        }
                } catch (Exception e) {

                }
        %><br><br></div>
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

