<%-- 
    Document   : ControladorModificarEmpleadoAdministrador
    Created on : 02-feb-2016, 2:19:22
    Author     : Cristina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        String ecedula = request.getParameter("ecedula");
        Double esueldo  = Double.parseDouble(request.getParameter("esueldo"));
        Integer etipo = Integer.parseInt(request.getParameter("etipo"));

      try
    {  
        com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service service = new com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service();
	com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio port = service.getBicirepuestosLogicaNegocioPort();
	// TODO process result here
	String result = port.modificarEmpleadoB(ecedula,esueldo,etipo);
        if(result.equals("Empleado Modificado"))
        {
            result = "okMo";
            response.sendRedirect("BuscarEmpleado.jsp?txtparametro='all'");
        }
	else
        {
            result = "error";
            response.sendRedirect("BuscarEmpleado.jsp?result="+result+"");
        }
        
    }
    catch (Exception ex) {
	// TODO handle custom exceptions here
    }

   
      

      
     

%>



