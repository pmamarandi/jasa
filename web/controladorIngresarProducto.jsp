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
        oProducto.setProductoMarcaId(Integer.parseInt(request.getParameter("marca")));
        oProducto.setProductoProcedenciaId(Integer.parseInt(request.getParameter("procedencia")));
        oProducto.setProductoPrecioUnitario(Double.parseDouble(request.getParameter("precio")));
        oProducto.setProductoStock(Integer.parseInt(request.getParameter("stock")));
        oProducto.setTipo(request.getParameter("tipo"));

      try
    {  
        com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
	com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
	// TODO process result here
	java.lang.String result = port.ingresarProducto(oProducto);
        if(result.equals("Producto Ingresado"))
        {
            result = "okP";
            response.sendRedirect("ListarModificarProducto.jsp?txtparametro='all'");
        }
	else
        {
            result = "error";
            response.sendRedirect("ListarModificarProducto.jsp?txtparametro='all'");
        }
        
    }
    catch (Exception ex) {
	// TODO handle custom exceptions here
    }

%>


