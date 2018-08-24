<%-- 
    Document   : controladorRegistrar
    Created on : 20/11/2015, 17:50:07
    Author     : paul
--%>

<%@page import="com.factime.servicioweb.Empleado"%>
<%@page import="com.factime.servicioweb.Gasto"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
             
            HttpSession sesion = request.getSession(true);

            String strNombreAdministrador = (String) sesion.getAttribute("Nombre");
            String strApellidoAdministrador = (String) sesion.getAttribute("Apellido");
            //String strCedulaUsuario = (String) sesion.getAttribute("Cedula");

            if ((sesion.getAttribute("empleado") == null)) {
                response.sendRedirect("index.jsp");
            }

              try {
                  
                  com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
	com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
        
         Empleado oEmpleado=port.empleadoUno();
        oEmpleado.getEmpleadoCedula();
         
        
                   Gasto oGasto = new Gasto();
        oGasto.setGastoDetalle(request.getParameter("detalle"));
        oGasto.setGastoFecha(request.getParameter("fecha"));
        oGasto.setGastoValor(Double.parseDouble(request.getParameter("total")));
        oGasto.setEmpleadoCedula(oEmpleado.getEmpleadoCedula());
        
	
        
       java.lang.Boolean result=port.ingresarGasto(oGasto);
            
           
        
       
        
    
        
        if (result==true)
        {
            response.sendRedirect("IngresarGasto.jsp");
        }
        else
        {
                 response.sendRedirect("IngresarGasto.jsp");
         }
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }   
        %>
    </body>
</html>