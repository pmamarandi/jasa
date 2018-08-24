<%-- 
    Document   : controlodarModificarAdministrador
    Created on : 20/01/2016, 9:41:37
    Author     : monse
--%>

<%@page import="com.Bicirepuestos.ReferenceLogicaNegocio.TelefonoPersona"%>
<%@page import="com.Bicirepuestos.ReferenceLogicaNegocio.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        try {
            Empleado oEmpleado = new Empleado();
            TelefonoPersona oTelefonoPersona = new TelefonoPersona();

            oEmpleado.setEmpleadoCedula(request.getParameter("cedula"));
            oEmpleado.setEmpleadoNombre(request.getParameter("nombre"));
            oEmpleado.setEmpleadoApellido(request.getParameter("apellido"));
            oEmpleado.setEmpleadoDireccion(request.getParameter("direccion"));
            oEmpleado.setEmpleadoIngresoFecha(request.getParameter("ingresofecha"));
            oEmpleado.setEmpleadoClave(request.getParameter("clave"));
            oEmpleado.setEmpleadoSueldo(Float.parseFloat(request.getParameter("sueldo")));

            oTelefonoPersona.setTelefonoPersonaEmpleadoId(request.getParameter("cedula"));
            oTelefonoPersona.setTelefonoPersonaTelefono(request.getParameter("telefono"));
            
            com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service service = new com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service();
            com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio port = service.getBicirepuestosLogicaNegocioPort();
            String result = port.modificarEmpleado(oEmpleado, oTelefonoPersona);
            
            if(result.equals("Empleado Modificado"))
            {
                HttpSession sesionOk = request.getSession();
                sesionOk.setAttribute("Nombre",oEmpleado.getEmpleadoNombre());
                sesionOk.setAttribute("Apellido",oEmpleado.getEmpleadoApellido());
                sesionOk.setAttribute("Cedula",oEmpleado.getEmpleadoCedula());
                response.sendRedirect("indexAdministrador.jsp");
            }
            
            
        } catch (Exception ex) {
            // TODO handle custom exceptions here
        }
    %>
    </body>
</html>
