<%-- 
    Document   : ControladorVenta
    Created on : 12/08/2018, 20:45:09
    Author     : Yesenia
--%>

<%@page import="com.factime.servicioweb.Venta"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.factime.servicioweb.Factura"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.factime.servicioweb.DetalleFactura"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.factime.servicioweb.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vent</title>
    </head>
    <body>
        <%
            Date ahora = new Date();
            SimpleDateFormat formateador = new SimpleDateFormat("yyyy-MM-dd");
            
            Integer id=Integer.parseInt(request.getParameter("idproducto"));
            String fecha = formateador.format(ahora);
            Integer cantidad=Integer.parseInt(request.getParameter("cantidad"));
            Double precio=Double.parseDouble(request.getParameter("punitario"));
            String descripcion=request.getParameter("descripcion");
            
            Venta oVenta=new Venta();
            oVenta.setIdProducto(id);
            oVenta.setFechaVenta(fecha);
            oVenta.setCantidad(cantidad);
            oVenta.setPrecioUnitario(precio);
            
            Double subtotal=cantidad*precio;
            oVenta.setSubtotal(subtotal);
            
  
	com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
	com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
	 
	String Res = port.ingresarVentaSimple(oVenta);
	
   if(Res.equals("REGISTRO CORRECTO"))
        response.sendRedirect("VentaSimple.jsp");


         
       %>
    </body>
</html>
