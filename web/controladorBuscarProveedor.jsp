<%-- 
    Document   : controladorBuscarProveedor
    Created on : 06/01/2016, 15:31:27
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
    try {
        String palabra = request.getParameter("palabraBuscar");
	com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service service = new com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service();
	com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio port = service.getBicirepuestosLogicaNegocioPort();
	java.lang.String result = port.buscarProveedor(palabra);
	response.sendRedirect("BuscarProveedor.jsp?result="+result+"");
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>

    </body>
</html>
