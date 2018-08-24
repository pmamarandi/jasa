<%-- 
    Document   : controladorIngresarProcedencia
    Created on : 24-nov-2015, 20:40:45
    Author     : valea
--%>

    <%@page import="com.factime.servicioweb.Procedencia"%>
<%-- start web service invocation --%><hr/>
    <%
        Procedencia oProcedencia = new Procedencia();
        oProcedencia.setProductoProcedenciaDescripcion(request.getParameter("descripcion"));
        
    try 
    {
	com.factime.ln.ws.FactimeLogicaNegocioDirectorio_Service service = new com.factime.ln.ws.FactimeLogicaNegocioDirectorio_Service();
	com.factime.ln.ws.FactimeLogicaNegocioDirectorio port = service.getFactimeLogicaNegocioDirectorioPort();
	// TODO process result here
	java.lang.String result = port.ingresarProcedencia(oProcedencia);
	if(result.equals("Categoría Registrada"))
        {
            result = "okPr";
            response.sendRedirect("IngresarProcedenciaDirectorio.jsp?result="+result+"");
        }
	else
        {
            result = "error";
            response.sendRedirect("IngresarProcedenciaDirectorio.jsp?result="+result+"");
        }
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>
    <%-- end web service invocation --%><hr/>