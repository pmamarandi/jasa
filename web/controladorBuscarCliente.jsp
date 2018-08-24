<%-- 
    Document   : controladoroBuscarCliente
    Created on : 09/08/2018, 0:14:53
    Author     : Yesenia
--%>

<%@page import="com.factime.servicioweb.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String strPalabra = request.getParameter("cedula");
            Cliente cl = new Cliente();
            com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
            com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
            
            
            //java.lang.String result = port.buscarClientes(palabra);
            response.sendRedirect("RegistrarVenta.jsp?cedula="strPalabra);
        %>
    </body>
</html>
