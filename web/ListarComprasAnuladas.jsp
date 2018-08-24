<%-- 
    Document   : ListarComprasAnuladas
    Created on : 30-dic-2015, 21:08:48
    Author     : valea
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        
  function setAnios(){
var valores = new Array(2014,2015, 2016, 2017,2018,2019,2020,2021,
                        2022,2023,2024,2025);
                        
for (var i=0; i < valores.length; i++) {
    
document.forma.anios.options[i]=new Option(valores[i], valores[i]);
        }
}
         
        
        
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
                        <li><a href="ListarProductos.jsp">Ver todos</a></li>
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
                        <li><a href="IngresarFactura.jsp">Ingresar</a></li>
                        <li><a href="BuscarFactura.jsp">Buscar</a></li>
                        <li><a href="ListarFacturasAnuladas.jsp">Listar Anuladas</a></li>
                        <li><a href="listarMasFrecuentesCliente.jsp">N. compras</a></li>
                        <li><a href="listarMejorCompraCliente.jsp">Mejores ventas</a></li>
                        <li><a href="listarFacturasporFecha.jsp">Listar por Fecha</a></li>
                  </ul></a></li>
              </a></li>
            </ul>
      </div>
     <div class="grupo formato_tabla centrar-contenido"> 
            <div class="caja web-100 centro-contenido"> 
                <h2>Listado de Compras Anuladas</h2>
            </div>
            <div class="caja web-100 centro-contenido"> 
                <form action="ListarComprasAnuladas.jsp" method="post" name="forma"> 
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
                    </select>
                    <input type="submit" title="Buscar" alt="Buscar" name="buscar" value="Buscar" class="boton_verde"></p>
                </form><br>
                                
                <%-- start web service invocation --%>
                <%
                try {
                    Integer mes=Integer.parseInt(request.getParameter("mes"));
                    Integer anio=Integer.parseInt(request.getParameter("anios"));

                    com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service service = new com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service();
                    com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio port = service.getBicirepuestosLogicaNegocioPort();

                    String esTbl = port.listarComprasAnuladas(mes,anio);

                    out.println(esTbl);

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
