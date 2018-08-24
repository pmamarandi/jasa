<%-- 
    Document   : ControladorBuscarEmpleado
    Created on : 06/01/2016, 17:47:02
    Author     : monse
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
 
        <%
        String strPalabra = request.getParameter("palabraBuscar");
        
        com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service service = new com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service();
	com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio port = service.getBicirepuestosLogicaNegocioPort();
	java.lang.String result = port.getEmpleados(strPalabra);
        
        
        //java.lang.String result = port.buscarClientes(palabra);
        
        response.sendRedirect("BuscarEmpleado.jsp?result="+result+"");
        %>
    </body>
</html>
