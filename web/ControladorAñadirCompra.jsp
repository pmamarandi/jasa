<%-- 
    Document   : ControladorAñadirCompra
    Created on : 10/12/2015, 4:27:50
    Author     : Eddie-PC
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.factime.servicioweb.CompraProducto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <%-- start web service invocation --%><hr/>
    <%
        Integer numeroFactura= Integer.parseInt(request.getParameter("numeroFactura"));        
        String Fecha=request.getParameter("fecha");
        String Proveedor=request.getParameter("proveedor");
        Double Iva=Double.parseDouble(request.getParameter("iva"));                
        Integer idProducto= Integer.parseInt(request.getParameter("producto"));
        Double precio =Double.parseDouble(request.getParameter("precio"));
        Integer cantidad= Integer.parseInt(request.getParameter("cantidad"));
        
	com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
	com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
	
        port.ingresarDetalleCompra(numeroFactura, idProducto, precio, cantidad);
       
        HttpSession sesionFacturaCompra = request.getSession();
        sesionFacturaCompra.setAttribute("numeroFactura",numeroFactura);
        sesionFacturaCompra.setAttribute("Fecha",Fecha);
        sesionFacturaCompra.setAttribute("Proveedor",Proveedor);
        sesionFacturaCompra.setAttribute("Iva",Iva);
       
        response.sendRedirect("IngresarCompra.jsp?numero="+numeroFactura.toString()+"");

    %>
    <%-- end web service invocation --%><hr/>
