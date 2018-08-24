<%@page import="com.Bicirepuestos.ReferenceLogicaNegocio.Cliente"%>
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
        oCliente.setClienteNombre(request.getParameter("nombre"));
        oCliente.setClienteApellido(request.getParameter("apellido"));
        oCliente.setClienteTelefono(request.getParameter("telefono"));
        oCliente.setClienteDireccion(request.getParameter("direccion"));
        oCliente.setClienteClave(request.getParameter("clave"));
    try {
	com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service service = new com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service();
	com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio port = service.getBicirepuestosLogicaNegocioPort();
	 // TODO initialize WS operation arguments here
	// TODO process result here
	java.lang.String result = port.ingresarCliente(oCliente);
        out.println(result);
        if(result.equals("Cliente Ingresado")){
            result = "ok";
            response.sendRedirect("autentificarse.jsp?result="+result+"");
        }
        else{
            if(result.equals("No hay conexion con la base de datos"))
            {
            result = "error";
            response.sendRedirect("RegistrarCliente.jsp?result="+result+"");
            }
        else
            {
        if(result.equals("cedula incorrecta"))
        {
            result = "cedula incorrecta";
            response.sendRedirect("RegistrarCliente.jsp?result="+result+"");
        }
        else{
        if(result.equals("si existe"))
        {
            result = "si existe";
            response.sendRedirect("RegistrarCliente.jsp?result="+result+"");
        }
        }
            
         }} } catch (Exception ex) {
	// TODO handle custom exceptions here
    }   
        %>
    </body>
</html>
   


