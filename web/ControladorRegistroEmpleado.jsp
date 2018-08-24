<%-- 
    Document   : ControladorRegistroEmpleado
    Created on : 27/01/2016, 10:23:43
    Author     : Eddie-PC
--%>

<%@page import="com.Bicirepuestos.ReferenceLogicaNegocio.Empleado"%>
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
        
        String cedula=request.getParameter("cedula");
        String c = request.getParameter("cedula");
        Integer l = c.length();
        if(l<10)
        {
            String rst = "Cedula Incorrecta";
            response.sendRedirect("BuscarEmpleado.jsp?result="+rst+"");
        }
        String nombre=request.getParameter("nombre");
        String apellido=request.getParameter("apellido");
        String direccion=request.getParameter("direccion");
        String fecha=request.getParameter("fecha");
     
        Float sueldo=Float.parseFloat(request.getParameter("sueldo"));        

        String telefono=request.getParameter("telefono");
    try {
	  com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
                com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
	 // TODO initialize WS operation arguments here
	// TODO process result here
	java.lang.String result = port.ingresarEmpleado(cedula, nombre, apellido, direccion, fecha, sueldo, telefono);
        out.println(result);
        if(result.equals("Empleado Ingresado")){
            result = "ok";
            response.sendRedirect("BuscarEmpleado.jsp?result="+result+"");
        }
        else{
            if(result.equals("No hay conexion con la base de datos"))
            {
            result = "error";
            response.sendRedirect("BuscarEmpleado.jsp?result="+result+"");
            }
        else
            {
        if(result.equals("cedula incorrecta"))
        {
            result = "Cedula Incorrecta";
            response.sendRedirect("BuscarEmpleado.jsp?result="+result+"");
        }
        else{
        if(result.equals("si existe"))
        {
            result = "si existe";
            response.sendRedirect("BuscarEmpleado.jsp?result="+result+"");
        }
        }
            
         }} } catch (Exception ex) {
	// TODO handle custom exceptions here
    }   
        %>
    </body>
</html>
Fin de la conversación
