
<%-- 
    Document   : indexAdministrador
    Created on : 26-nov-2015, 8:04:27
    Author     : valea
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if(request.getParameter("result") != null)
    {
        if(request.getParameter("result").equals("ok"))
        {
        %>
            <script>alert('Cliente ingresado correctamente');
                    window.redirected = 'index.jsp';
            </script>
        <%
        }
        else
        {
            if(request.getParameter("result").equals("okP"))
            {
        %>
            <script>alert('Producto ingresado correctamente');
                    window.redirected = 'index.jsp';
            </script>
        <%
            }
            else
            {
                if(request.getParameter("result").equals("okM"))
                {
                %>
                    <script>alert('Marca registrada correctamente');
                            window.redirected = 'index.jsp';
                    </script>
                <%

                }
                else
                {
                    if(request.getParameter("result").equals("okM"))
                    {
                    %>
                        <script>alert('Procedencia registrada correctamente');
                            window.redirected = 'index.jsp';
                        </script>
                    <%
                    
                    }
                }
            }
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
                <a href="MisionVision.jsp">Quienes Somos
                    
                </a>
            </li>
        <li>
            <a href="ModificarAdministrador.jsp?empleadocedula=<%=strCedulaAdministrador%>">Mis Datos
                     
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
            
        <div class="grupo formato_tabla centrar-contenido"> 
            <div class="caja web-100 derecha " >
                <div class="caja fuente_slogan contenido_login">
                        <p Aling="justify"><b>MISION<br></b>
                        Somos una empresa confiable que ofrece repuestos y accesorios de bicicletas de calidad 
                        y un servicio completo para todas las marcas que circulan en el mercado Ecuatoriano,
                        con la mejor capacidad para satisfacer esa demanda.<br>
                        Creamos empleos dignos de oportunidades de realización profesional y personal, contribuyendo así
                        al desarrollo sostenible, económico y social del país.</p><br>
                        <p Aling="justify"><b>VISION<br></b>
                        Ser la empresa líder en la venta de  repuestos y  accesorios  de bicicletas a nivel local y
                        nacional,creando redes de alianzas estratégicas que nos permitan cumplir con nuestra misión.
                        </p>
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
              <img src="tema/img/twitter.png" alt=""/>
          </div>
      </div>
    </footer>
  </body>
</html>