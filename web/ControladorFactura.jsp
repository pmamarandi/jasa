<%-- 
    Document   : ControladorFactura
    Created on : 16/12/2015, 21:19:28
    Author     : Eddie-PC
--%>

<%@page import="com.factime.servicioweb.Factura"%>
<%@page import="com.factime.servicioweb.DetalleFactura"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
String date=request.getParameter("fecha");
Double iva=0.12;
Double total=12.0;

        String cedula =request.getParameter("cedula");

       Double precio=Double.parseDouble(request.getParameter("subTotal"));
         
      com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
	com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();

 String result = port.ingresarFactura(cedula,date, precio, iva, total);
 HttpSession sesionClienteFactura = request.getSession();
 sesionClienteFactura.invalidate();

 Factura num = new Factura();
        num=port.numeroFactura();        
        Integer numeroFactura=num.getFacturanumero(); 
response.sendRedirect("MostrarFactura.jsp?numero="+numeroFactura.toString()+"");

%>
   