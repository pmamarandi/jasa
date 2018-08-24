<%-- 
    Document   : controladorIngresarProducto
    Created on : 23-nov-2015, 20:28:19
    Author     : valea
--%>

<%@page import="com.factime.servicioweb.Producto"%>
<%
   
        Producto oProducto = new Producto();
        oProducto.setProductoCodigo(request.getParameter("codigo"));
        oProducto.setProductoDescripcion(request.getParameter("descripcion"));
        oProducto.setProductoMarcaId(1);
        oProducto.setProductoProcedenciaId(Integer.parseInt(request.getParameter("procedencia")));
        oProducto.setProductoPrecioUnitario(0.0);
        oProducto.setProductoStock(0);
        oProducto.setTipo("ORIGINAL");

      try
    {  
        com.factime.ln.ws.FactimeLogicaNegocioDirectorio_Service service = new com.factime.ln.ws.FactimeLogicaNegocioDirectorio_Service();
	com.factime.ln.ws.FactimeLogicaNegocioDirectorio port = service.getFactimeLogicaNegocioDirectorioPort();
	// TODO process result here
	java.lang.String result = port.ingresarProducto(oProducto);
        if(result.equals("Producto Ingresado"))
        {
            result = "okP";
            response.sendRedirect("ListarModificarProductoDirectorio.jsp?txtparametro='all'");
        }
	else
        {
            result = "error";
            response.sendRedirect("ListarModificarProductoDirectorio.jsp?txtparametro='all'");
        }
        
    }
    catch (Exception ex) {
	// TODO handle custom exceptions here
    }

%>


