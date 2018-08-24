<%-- 
    Document   : ControladorProductosFactura
    Created on : 13/12/2015, 15:03:27
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
<%@page import="com.factime.servicioweb.Producto"%>

<div class="grupo formato_tabla centrar-contenido"> 
                <h2>Listado de productos</h2>
                <br>
            <div class=" caja centro centrar-contenido web-100">   
              <form action="ControladorProductosFactura.jsp" method="post">                                    
                Ingrese el dato a buscar:
                <input type="text" name='txtparametro1' size="15" maxlength="15" onkeypress="return val(event), return ValNum(event)">                                         
                <input type="submit" name="buscar" class="boton_verde">
                </form>
                <br>
                <%
                     String id =request.getParameter("productoid");
                     try {
                        
                        String parametro = request.getParameter("txtparametro1");                   
                        String delimitadores= "[ .,;?!¡¿\'\"\\[\\]]+";
                        String[] palabrasSeparadas = parametro.split(delimitadores);
                        String variableAencontrar=palabrasSeparadas[0];
                        Integer longitud = parametro.length();
                   if (longitud > 0) 
                        {
                            com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
                            com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
                            String esTbl = port.getProductosFactura(variableAencontrar);                                                  
                            out.println(esTbl); 
                            
                            Integer idd=Integer.parseInt(id);
                            Producto oProducto=new Producto();        
                            oProducto = port.listarProductoFactura(idd);
                            Integer idproducto=oProducto.getProductoId();
                            String codigo=oProducto.getProductoCodigo();
                            String descripcion=oProducto.getProductoDescripcion();
                            Double precio=oProducto.getProductoPrecioUnitario();
                            Integer stock=oProducto.getProductoStock();      
                            response.sendRedirect("IngresarFactura.jsp?idproducto="+idproducto.toString()+"&descripcion="+descripcion.toString()+"&precio="+precio.toString()+"&stock="+stock.toString()+"");
   
                        } 
                        if((request.getParameter("txtparametro"))== null)
                            {
                            %>
                                    <h4>Datos no encontrados</h4>                               
    
                            <%
                                com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
                                com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
	 
                                String result = port.listarProductosFactura();
                                out.println(result);
                            }
                        
                    } catch (Exception e) {

                    }

                %><br><br>
    </div>      

<%
if(request.getParameter("txtparametro1")==null)
{
if(id==null){
com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
	com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
	String result = port.listarProductosFactura();
	out.println(result);
    
}
else{

    com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
	com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
	Integer idd=Integer.parseInt(id);
        Producto oProducto=new Producto();
          
	oProducto = port.listarProductoFactura(idd);
        
        Integer idproducto=oProducto.getProductoId();
        String codigo=oProducto.getProductoCodigo();
        String descripcion=oProducto.getProductoDescripcion();
        Double precio=oProducto.getProductoPrecioUnitario();
        Integer stock=oProducto.getProductoStock();   
        
      response.sendRedirect("IngresarFacturaEmpleado.jsp?codigo="+codigo.toString()+"&idproducto="+idproducto.toString()+"&descripcion="+descripcion.toString()+"&precio="+precio.toString()+"&stock="+stock.toString()+"");
}
} 
    %><br><br>
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