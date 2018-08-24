<%-- 
    Document   : IngresarCompra
    Created on : 08/12/2015, 16:42:59
    Author     : Eddie-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
  <head>
     <title> Ingresar Compra </title>
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
 function soloDecimales(e){
	var key = window.Event ? e.which : e.keyCode
	return (key >= 46 && key <= 57)
}

   
   </script>
   
   
   
   <script type="text/javascript"> 
window.onload = function () {
// Variable global por estar declarada sin hacer uso de var
elementosEnForm = document.forms['formulario'].elements;
for (var i=0; i< elementosEnForm.length; i++) {
                if (elementosEnForm[i].name != 'Añadir') {                    
                    elementosEnForm[i].disabled = false;
       
                }
           else {
                    elementosEnForm[i].addEventListener('click', activarElementos);
                    
                
                }
        }
}
 
function activarElementos() { 
    for (var i=0; i<elementosEnForm.length; i++) {
        
            elementosEnForm[i].disabled=false;
        }
    
    }
</script>
   
   
   
  </head>
  <body >
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
      <div class="grupo formato_tabla centro"> 
          <div class="caja web-30 derecha"> 
          </div>
          <div class=""> 
          <ul>
              <%
             Integer strNumeroFactura = 0;
             String strFecha = "";
             String strProveedor= null;
             Double strIva = 0.0;
  
             HttpSession sesionFacturaCompra = request.getSession();
           
            strNumeroFactura =(Integer) sesionFacturaCompra.getAttribute("numeroFactura");
            strFecha = (String) sesionFacturaCompra.getAttribute("Fecha");
            strProveedor = (String) sesionFacturaCompra.getAttribute("Proveedor");           
            strIva = (Double) sesionFacturaCompra.getAttribute("Iva");
            
                  
                  %>
            <div class="grupo formato_tabla centrar-contenido ">
            <h2>FACTURA ABASTECIMIENTO</h2>
            <div class="caja web-50 formato_tabla centrar-contenido "> 
                <h3>Datos generales</h3>
            <FORM NAME="slibro" ACTION="" METHOD="GET">
                <div class="caja web-45 movil-40 derecha-contenido"  id="stylized"> 
                    <label>N&uacute;mero de Factura:</label><br>
                    <label>Fecha de Compra</label><br>
                    <label>Proveedor</label><br>
                    <label>IVA</label><br>
                    
                </div>              
                <div class="caja web-55 movil-60 izquierda-contenido"  id="stylized"> 
                    <input type="number" value="<%=strNumeroFactura%>" name="numeroFactura" onkeypress="return soloNumeros(event)" size="20" maxlength="30" required><br>
                    <input type="date" value="<%=strFecha%>" name="fecha"  size="30" maxlength="50"  required><br>
                    <%
                    try
                    {
                        com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
                        com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
                    
                        String proveedor = port.listarProveedoresCompra(strProveedor);
                        out.println(proveedor);
   
                     
                    }
                    catch(Exception ex) 
                    {
                                
                    }
                %>
                    <input type="number" name="iva"  min="0" max="30" value="<%=strIva%>" step="1" onkeypress="return soloNumeros(event)" required><br>
                  </div>
              </div>
    <div class="caja web-50 formato_tabla centrar-contenido ">  
    <h3>Producto</h3>
    <br><div class="caja web-45 movil-40 derecha-contenido"  id="stylized"> 
                    <label>Producto</label><br>
                    <label>Precio</label><br>
                    <label>Cantidad</label><br>
                    </div>
            <div class="caja web-55 movil-60 izquierda-contenido"  id="stylized">
                <%
                    try
                    {
                       com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
                com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
                        
                        String producto= port.listarProductosCompra();
                        out.println(producto);
                    }
                    catch(Exception ex) 
                    {
                                
                    }
                %>
                    <br>
                    <input type="number" id="valor1" name="precio" onkeypress="return soloDecimales(event)"  min="0.01" max="500" step="0.01"><br>
                    <input type="number" name="cantidad"  min="1" max="100" step="1" onkeypress="return soloNumeros(event)">
                
            </div>
                <input class="boton_verde" type="submit" name="Añadir" value="Añadir" onClick="document.forms.slibro.action='ControladorAñadirCompra.jsp'; document.forms.slibro.submit()">
           </div>
                        </div>      <br>
           


    <%

 // TODO initialize WS operation arguments here
	              try {
                    
                          Integer parametro = Integer.parseInt(request.getParameter("numero"));                        
                          com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
                            com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
                           
                            String esTbl = port.getComprasDetalles(parametro);
                            out.println(esTbl);
        
                        if((request.getParameter("numero"))== null)
                            {
                            %>
                                    <h4>Datos no encontrados</h4>
                            <%
                            }

                    } catch (Exception e) {

                    }

                %>

    <%
    try {
        
       
        Integer parametro = Integer.parseInt(request.getParameter("numero"));
	com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
	com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
	 // TODO initialize WS operation arguments here
	java.lang.Integer arg0 = Integer.valueOf(0);

        String esTbl = port.getSumaDetalles(parametro);
        out.println(esTbl);
       
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    
    %>
     <br>
     <center><input class="boton_verde" type="submit" name="factura" value="Confirmar" onClick="document.forms.slibro.action='ControladorFacturaCompra.jsp'; document.forms.slibro.submit()"></td>  </ul>
            </form>
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
