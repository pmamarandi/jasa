<%-- 
    Document   : BuscarProveedor
    Created on : 06/01/2016, 15:30:03
    Author     : monse
--%>

<%@page import="com.factime.ln.ws.FactimeLogicaNegocio_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title> </title>
        <meta charset="utf-8">

        <link rel="stylesheet" href="tema/css/estilos.css">
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
        <li><a href="VisionMision.jsp">Quienes Somos</a></li>
        <li><a href="ModificarAdministrador.jsp?empleadocedula=<%=strCedulaAdministrador%>">Mis Datos</a></li>
        <li>
            <a href="#">Productos
                <ul>
                    <li><a href="ListarModificarProducto.jsp?txtparametro='all'">Ver</a></li>
                    <li><a href="#">Reportes
                            <ul><li><a href="listarProductosMasVendidos.jsp">M&aacute;s vendidos</a></li></ul>
                        </a>
                    </li>
                    <li><a href="IngresarMarca.jsp">Marcas</a></li>
                    <li><a href="IngresarProcedencia.jsp">Procedencias</a></li>
                </ul>
            </a>
        </li>
        <li>
            <a href="#">Clientes
                <ul>
                    <li><a href="BuscarClientes.jsp">Ver</a></li>
                    <li><a href="#">Reportes
                        <ul><li><a href="listarMasFrecuentesCliente.jsp">Mejores clientes</a></li></ul>
                    </li>
                </ul>
            </a>
        </li>               
        <li>
            <a href="#">Empleados
                <ul>
                    <li><a href="BuscarEmpleado.jsp">Ver</a></li>
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
                <ul><li><a href="BuscarProveedor.jsp">Ver</a></li></ul>
            </a>
        </li>
        <li>
            <a href="#">Compras
                <ul>
                    <li><a href="IngresarCompra.jsp">Ingresar</a></li>
                    <li><a href="BuscarComprass.jsp">Ver</a></li>
                </ul>
            </a>
        </li>
        <li>
            <a href="#">Facturas
                <ul>
                    <li><a href="IngresarFactura.jsp">Ingresar</a></li>
                    <li><a href="BuscarFactura.jsp">Ver</a></li>
                    <li><a href="#">Reportes
                        <ul>
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
                <h2> Proveedores</h2>
            </div>
            <div class="caja web-100 centro-contenido">
                <form action="BuscarProveedor.jsp" method="post">                                    
                <p>Ingrese el dato a buscar: 
                    <input type="text" name='txtparametro' size="15" maxlength="15" onkeypress="return val(event), return ValNum(event)" required>
                    <input type="submit" title="Buscar" alt="Buscar" name="buscar" value="Buscar" class="boton_verde"></p>
            </form><br><br>
                <%
             
                    try {
                        com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
	com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
                            
                        String parametro = request.getParameter("txtparametro");
                        
                        if(request.getParameter("txtparametro")==null)
                        {
                            
                            java.lang.String result = port.listarProveedores();
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
                            String esTbl = port.buscarProveedor(variableAencontrar);
                                                     
                            out.println(esTbl);
                        
                        } else 
                        {
                            Integer cero = 0;
                            response.sendRedirect("BuscarProveedor.jsp?variableVacia=" + cero.toString() + "");  
                            
                            
                        }
                           
                        if((request.getParameter("txtparametro"))== null)
                            {
                            %>
                                    <h4>Datos no encontrados</h4>
                            <%
                            java.lang.String result = port.listarProveedores();
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
