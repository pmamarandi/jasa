<%-- 
    Document   : controladorRegistrar
    Created on : 20/11/2015, 17:50:07
    Author     : paul
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
        Cliente oCliente = new Cliente();
        oCliente.setClienteCedula(request.getParameter("cedula"));
        String cedu=request.getParameter("cedula");
        Integer l=cedu.length();
        if(l<10)
        {
            String re="La esta cedula incorrecta";
            response.sendRedirect("BuscarClientes.jsp?result="+re+"");
        }
        oCliente.setClienteNombre(request.getParameter("nombre"));
        oCliente.setClienteApellido(request.getParameter("apellido"));
        oCliente.setClienteTelefono(request.getParameter("telefono"));
        oCliente.setClienteDireccion(request.getParameter("direccion"));
        oCliente.setClienteClave(request.getParameter("clave"));
    try {
	com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
        com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
	 // TODO initialize WS operation arguments here
	// TODO process result here
	java.lang.String result = port.ingresarCliente(oCliente);
        out.println(result);
        if(result.equals("Cliente Ingresado"))
        {
            result = "Cliente ingresado";
            response.sendRedirect("BuscarClientes.jsp?result="+result+"");
        }
        else
        {
            if(result.equals("No hay conexion con la base de datos"))
            {
            result = "error";
            response.sendRedirect("BuscarClientes.jsp?result="+result+"");
            }
        else
            {
        if(result.equals("cedula incorrecta"))
        {
            result = "La esta cedula incorrecta";
            response.sendRedirect("BuscarClientes.jsp?result="+result+"");
        }
        else{
        if(result.equals("si existe"))
        {
            result = "El cliente ya se encuentra registrado";
            response.sendRedirect("BuscarClientes.jsp?result="+result+"");
        }
        }
            
         }} } catch (Exception ex) {
	// TODO handle custom exceptions here
    }   
        %>
    </body>
</html>