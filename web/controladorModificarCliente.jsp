<%-- 
    Document   : controladorModificarCliente
    Created on : 23/11/2015, 0:40:16
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
        oCliente.setClienteNombre(request.getParameter("nombre"));
        oCliente.setClienteApellido(request.getParameter("apellido"));
        oCliente.setClienteDireccion(request.getParameter("direccion"));
        oCliente.setClienteClave(request.getParameter("clave"));
        oCliente.setClienteId(Integer.parseInt(request.getParameter("id")));
        oCliente.setClienteNumeroCompras(Integer.parseInt(request.getParameter("compras")));
        
        
	
	  
	com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
	com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
	

        
        java.lang.String result = port.modificarCliente(oCliente);
        
        
        
        if(result.equals("ClienteModificado"))
        {
            HttpSession sesionOk = request.getSession();
            sesionOk.setAttribute("Nombre",oCliente.getClienteNombre());
            sesionOk.setAttribute("Apellido",oCliente.getClienteApellido());
            sesionOk.setAttribute("Cedula",oCliente.getClienteCedula());
            response.sendRedirect("ModificarClientes.jsp?id="+oCliente.getClienteCedula().toString()+"&cod="+oCliente.getClienteId().toString()+"");
        }
        else
        response.sendRedirect("ModificarClientes.jsp?id="+oCliente.getClienteCedula().toString()+"&cod="+oCliente.getClienteId().toString()+"");
        %>
        
        <script>
            window.location="indexCliente.jsp";
        </script>
        
    </body>
</html>
