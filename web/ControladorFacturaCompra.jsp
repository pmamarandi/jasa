<%-- 
    Document   : ControladorFacturaCompra
    Created on : 10/12/2015, 4:56:15
    Author     : Eddie-PC
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.factime.servicioweb.CompraProducto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <%-- start web service invocation --%><hr/>
    <%
    try {
        Integer numeroFactura= Integer.parseInt(request.getParameter("numeroFactura"));
        Integer idProveedor= Integer.parseInt(request.getParameter("proveedor"));
        String fecha=request.getParameter("fecha");       
        Double iva=Double.parseDouble(request.getParameter("iva"));
           
	com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
	com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
	ArrayList<CompraProducto> arr = (ArrayList) port.sumaDetalles(numeroFactura);
        Integer nEs = arr.size();
        Double suma;
        suma=null;
        for (int i = 0; i < nEs; i++) {
            CompraProducto c = arr.get(i);
            suma = c.getSubtotalFactura();
        }
        
        java.lang.String result = port.ingresarCompra(numeroFactura, idProveedor, fecha, suma, iva);
        
         HttpSession sesionClienteFactura = request.getSession();
         sesionClienteFactura.invalidate();
	
        response.sendRedirect("ListarModificarProducto.jsp?txtparametro=%27all%27?result="+result.toString()+"");
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>
    <%-- end web service invocation --%><hr/>
