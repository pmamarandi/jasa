<%-- 
    Document   : ControladorRegistrarProveedor
    Created on : 13/01/2016, 12:05:23
    Author     : monse
--%>

<%@page import="com.factime.servicioweb.Proveedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        Proveedor oProveedor = new Proveedor();
        oProveedor.setProveedorRuc(request.getParameter("ruc"));
        oProveedor.setProveedorNombre(request.getParameter("nombre"));
        oProveedor.setProveedorDireccion(request.getParameter("direccion"));
        oProveedor.setTelefonoProveedor(request.getParameter("telefono"));
        oProveedor.setProveedorCiudad(request.getParameter("ciudad"));
      
    try {
	 com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
	com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
	 // TODO initialize WS operation arguments here
	// TODO process result here
	java.lang.String result = port.ingresarProveedor(oProveedor);
        if(result.equals("Proveedor Ingresado")){
            result = "ok";
            response.sendRedirect("BuscarProveedor.jsp?result="+result+"");
        }
        else{
            if(result.equals("No hay conexion con la base de datos"))
            {
            result = "error";
            response.sendRedirect("BuscarProvedor.jsp?result="+result+"");
            }
        else
            {
        if(result.equals("Ruc Incorrecta"))
        {
            result = "Ruc Incorrecta";
            response.sendRedirect("BuscarProvedor.jsp?result="+result+"");
        }
        else{
        if(result.equals("si existe"))
        {
            result = "si existe";
            response.sendRedirect("BuscarProvedor.jsp?result="+result+"");
        }
        }
            
         }} } catch (Exception ex) {
	// TODO handle custom exceptions here
    }   
        %>
    </body>
</html>
