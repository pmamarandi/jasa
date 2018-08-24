<%-- 
    Document   : IngresarFactura
    Created on : 12/12/2015, 9:41:29
    Author     : Geovanny
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
      <div class="grupo formato_tabla centro"> 
          
       <%
           Integer alto=0;
             String strCedula = "";
             Integer stridCliente = 0;
             String strNombre = "";
             String strApellido = "";
             String strDireccion = "";
             
            
             
            String idcliente =(request.getParameter("idcliente") != null)?request.getParameter("idcliente") : "";
            String Cedula =(request.getParameter("cedula") != null)?request.getParameter("cedula") : "";
            String Nombre =(request.getParameter("nombre")!= null)?request.getParameter("nombre") : "";
            String Apellido =(request.getParameter("apellido")!= null)?request.getParameter("apellido") : ""; 
            String Direccion =(request.getParameter("direccion")!= null)?request.getParameter("direccion") : "";
            
            String idproducto =(request.getParameter("idproducto")!= null)?request.getParameter("idproducto") : "";
            String codigo =(request.getParameter("codigo")!= null)?request.getParameter("codigo") : "";
            String descripcion =(request.getParameter("descripcion")!= null)?request.getParameter("descripcion") : "";
            String precio =(request.getParameter("precio")!= null)?request.getParameter("precio") : "";
            String stock =(request.getParameter("stock")!= null)?request.getParameter("stock") : "";
          
             String subtotal =(request.getParameter("subtotal")!= null)?request.getParameter("subtotal") : "";
             String cantidad =(request.getParameter("cantidad")!= null)?request.getParameter("cantidad") : "";
             
             String subTotal=(request.getParameter("subtotalfactura")!=null)?request.getParameter("subtotalfactura") :"";
             
             
             String idproducto1 =(request.getParameter("codigo1")!= null)?request.getParameter("codigo1") : "";
             

             
           /*HttpSession sesionClienteFactura = request.getSession();
            
            strCedula =((String) sesionClienteFactura.getAttribute("cedula")!= null)?(String) sesionClienteFactura.getAttribute("cedula") : "";
           stridCliente=((Integer) sesionClienteFactura.getAttribute("idcliente")!= null)?(Integer) sesionClienteFactura.getAttribute("idcliente") : 0;
           strNombre = ((String) sesionClienteFactura.getAttribute("nombre")!= null)?(String) sesionClienteFactura.getAttribute("nombre") : "";
            strApellido = ((String) sesionClienteFactura.getAttribute("apellido")!= null)?(String) sesionClienteFactura.getAttribute("apellido") : "";
           strDireccion =((String) sesionClienteFactura.getAttribute("direccion")!= null)?(String) sesionClienteFactura.getAttribute("direccion") : "";*/
            

            
                                                            
        %>
       
        <div class="grupo formato_tabla centrar-contenido ">
            <h2>Emisi&oacute;n de Factura </h2>
            <div class="caja web-50 formato_tabla centrar-contenido "> 
        <FORM NAME="slibro" ACTION="" METHOD="GET">
            <h3>Cliente </h3>
            <input class="boton_verde"  <input type="button" value="Seleccionar" onClick="location.href = 'ControladorClienteFactura.jsp' "><br><br>
            <div class="caja web-45 movil-40 derecha-contenido"  id="stylized"> 
                <label>Nº Factura</label><br>
                <label>C&eacute;dula</label><br>
                <label>Nombre</label><br>
                <label>Apellido</label><br>
                <label>Direcci&oacute;n</label><br>
                <label>Fecha</label><br>
            </div>
    
            <div class="caja web-55 movil-60 izquierda-contenido"  id="stylized">    
                <input  type="text" name="codigo1" value="<%=stridCliente%>" size="3" maxlength="6" readonly='readonly'><br>
                <input  type="text" name="cedula" value="<%=strCedula%> " size="10" maxlength="6" readonly='readonly' ><br>
                <input  type="text" name="nombre" value="<%=strNombre%> " size="10" maxlength="6" readonly='readonly' ><br>
                <input  type="text" name="nombre" value="<%=strApellido%> " size="10" maxlength="6" readonly='readonly' ><br>
                <input  type="text" name="nombre" value="<%=strDireccion%> " size="10" maxlength="6" readonly='readonly' ><br>
                <input  type="text" name="fecha" id="fecha" readonly='readonly'></td>
               </div>
            
      
    </div>                
 <script>

var meses = new Array ("01","02","03","04","05","06","07","08","9","19","11","12");
var f=new Date();
fecha.value=(f.getFullYear() + "-" + meses[f.getMonth()] + "-" + f.getDate());
</script>
<div class="caja web-50 formato_tabla centrar-contenido ">  
    <h3>Producto</h3>   <input class="boton_verde"  type="button" value="Seleccionar" onClick="location.href = 'ControladorProductosFactura.jsp' "><br>
            <br><br><div class="caja web-45 movil-40 derecha-contenido"  id="stylized"> 
                <label>C&oacute;digo</label><br>
                <label>Descripci&oacute;n</label><br>
                <label>P. Unitario</label><br>
                <label>Cantidad</label><br>
            </div>
            <div class="caja web-55 movil-60 izquierda-contenido"  id="stylized">
                <input type="text" name="idproducto" value="<%=idproducto%>" size="5" readonly='readonly'><br>
                <input type="text" name="descripcion" value="<%=descripcion%> "size="30" readonly='readonly'><br>
                <input type="number" name="precio" value="<%=precio%>" size="30" readonly='readonly'><br>
                 <select name="cantidad" id='stylized'>
                <%
                 if(idproducto!="")
                 {
                     alto=Integer.parseInt(request.getParameter("stock"));                                     
                     for(int i=1;i<=alto;i++)
                    {
                      %>  
                         <option value="<%=i%>"><%=i%></option>
                   <%
                   
                     }
                 }
                 else
                 {
                     alto=0;
                 }
                    %>
                </select><br><br>
            
            </div>
        </div>
            <input class="boton_verde"  type="submit" name="Añadir" value="AñadirReal"  onClick="document.forms.slibro.action='ControladorIngresarDetalleFactura.jsp'; document.forms.slibro.submit()">
        </div>
        <%  com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
	com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
	String result = port.listarDetalleFactura("6");
        out.println(result);
                      %>
        <br>
        <div class="grupo web-100 formato_tabla centrar-contenido "> 
        Subtotal: <input type="text" name="subTotal" value="<%=subTotal%>" size="6">
        <br><br>
        <input class="boton_verde" type="submit" name="confirmar" value="Confirmar" onClick="document.forms.slibro.action='ControladorFactura.jsp'; document.forms.slibro.submit()"></tr>
        </div><br>
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