<%-- 
    Document   : listarProductosMasVendidos
    Created on : 09/12/2015, 21:22:53
    Author     : monse
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="es">
<head>
<title> </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximun-scale=1">
    <link rel="stylesheet" href="tema/css/estilos.css">
    <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
    <script src="tema/js/scripts.js"></script>
    <script language="javascript"  type="text/javascript" >
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
    <script>
    function setAnios(){
var valores = new Array(2014,2015, 2016, 2017,2018,2019,2020,2021,
                        2022,2023,2024,2025);
                        
for (var i=0; i < valores.length; i++) {
    
document.forma.anios.options[i]=new Option(valores[i], valores[i]);
        }
}
   </script> 
</head>
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
        <%
         // ver mis datos adminsitardor
          String strNombreAdministrador = "Sara";
         String strApellidoAdministrador = "Tixi";
          String strCedulaAdministrador= "0602633968";
         HttpSession sesionOk = request.getSession();
         sesionOk.setAttribute("Nombre","Sara");
                        sesionOk.setAttribute("Apellido","Tixi");
                        sesionOk.setAttribute("Cedula","0602633968");
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
      <div class="grupo formato_tabla centro centrar-contenido"> 
          <div class="caja web-100 centro-contenido"> 
                <h2>Productos m&aacutes vendidos</h2>
            </div>
            <div class="caja web-100 centro centrar-contenido"> 
                 <form action="listarProductosMasVendidos.jsp" method="post" name="forma"> 
                <p>Ingresa la fecha: 
                        <select name="mes" required>
                         <option value="1"><label>Enero</option>
                         <span class="small">Elija el mes</span></label><br>
                         <option value="2">Febrero</option>
                         <option value="3">Marzo</option>
                         <option value="4">Abril</option>
                         <option value="5">Mayo</option>
                         <option value="6">Junio</option>
                         <option value="7">Julio</option>
                         <option value="8">Agosto</option>
                         <option value="9">Septiembre</option>
                         <option value="10">Octubre</option>
                         <option value="11">Noviembre</option>
                         <option value="12">Diciembre</option>
                      </select>
                                         
                    <select name="anios">
                    </select><br><br>
                    N&uacutemero de productos a mostrar:
                   <input type="number" name="limite" min="1" max="20"><br><br>
                   <input type="submit" title="Buscar" alt="Buscar" name="buscar" value="Buscar" class="boton_verde"></p>
                </form><br>
                                
                <%-- start web service invocation --%>
                <%
                    
                    String limite=request.getParameter("limite");
                    String mes=request.getParameter("mes");
                    String anio=request.getParameter("anios");
                    try {
                        com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
                        com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
                        java.lang.String result = port.listarProductosMasVendidos(mes, anio, limite);
                        out.println(result);
                    } catch (Exception ex) {
                        // TODO handle custom exceptions here
                    }
                %>
                <%-- end web service invocation --%>

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