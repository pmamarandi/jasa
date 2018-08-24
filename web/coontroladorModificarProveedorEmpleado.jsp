<%@page import="com.Bicirepuestos.ReferenceLogicaNegocio.TelefonoProveedor"%>
<%@page import="com.Bicirepuestos.ReferenceLogicaNegocio.Proveedor"%>
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
            
            com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service service = new com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service();
	    com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio port = service.getBicirepuestosLogicaNegocioPort();
            String result = port.modificarProveedor(oProveedor,oTelefonoProveedor );
            if(result.equals("Proveedor Modificado"))
            {
                response.sendRedirect("buscarProveedorEmpleado.jsp");
            }
        
        } catch (Exception ex) {
            // TODO handle custom exceptions here
        }
    %>
    </body>
</html>

