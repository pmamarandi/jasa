<%@page import="com.factime.servicioweb.TelefonoProveedor"%>
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
        try {
            
            
            Proveedor oProveedor = new Proveedor();
            TelefonoProveedor oTelefonoProveedor= new TelefonoProveedor();
            oProveedor.setProveedorRuc(request.getParameter("ruc"));
            oProveedor.setProveedorNombre(request.getParameter("nombre"));
            oProveedor.setProveedorDireccion(request.getParameter("direccion"));
            oProveedor.setProveedorCiudad(request.getParameter("ciudad"));
            oTelefonoProveedor.setTelefonoProveedortelefono(request.getParameter("telefono"));
            
             com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
	com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
            String result = port.modificarProveedor(oProveedor,oTelefonoProveedor );
            if(result.equals("Proveedor Modificado"))
            {
                response.sendRedirect("BuscarProveedor.jsp");
            }
        
        } catch (Exception ex) {
            // TODO handle custom exceptions here
        }
    %>
    </body>
</html>

