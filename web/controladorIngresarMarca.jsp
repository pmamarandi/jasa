<%-- 
    Document   : controladorIngresarMarca
    Created on : 24-nov-2015, 18:15:47
    Author     : valea
--%>

<%@page import="com.factime.servicioweb.Marca"%>

    <%-- start web service invocation --%><hr/>
    <%
        Marca oMarca = new Marca();
        
        oMarca.setProductoMarcaDescripcion(request.getParameter("descripcion"));
    try 
    {
        com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
	com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
	// TODO process result here
	java.lang.String result = port.ingresarMarca(oMarca);
	 if(result.equals("División Registrada"))
        {
            result = "okM";
            response.sendRedirect("IngresarMarca.jsp?result="+result+"");
        }
	else
        {
            result = "error";
            response.sendRedirect("IngresarMarca.jsp?result="+result+"");
        }
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>
    <%-- end web service invocation --%><hr/>
