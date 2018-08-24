<%-- 
    Document   : controladorBuscarClientes
    Created on : 22/11/2015, 21:02:04
    Author     : paul
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
        String palabra = request.getParameter("palabraBuscar");
        
        com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service service = new com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service();
	com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio port = service.getBicirepuestosLogicaNegocioPort();
    	java.lang.String result = port.buscarClientes(palabra);
        
        response.sendRedirect("BuscarClientes.jsp?result="+result+"");
        %>
    </body>
</html>
