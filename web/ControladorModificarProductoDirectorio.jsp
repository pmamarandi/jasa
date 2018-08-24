<%-- 
    Document   : ControladorModificarProducto
    Created on : 12-ene-2016, 14:41:55
    Author     : Paul Mamarandi
--%>
<%@page import="com.factime.servicioweb.Producto"%>
<%
        Integer id = Integer.parseInt(request.getParameter("id"));
        String codigo = request.getParameter("codigo");
        String descripcion = request.getParameter("descripcion");
        Integer marca = 1;
        Integer procedencia = Integer.parseInt(request.getParameter("procedencia"));
        Double precio  = 0.0;
        Integer stock = 1;
        String tipo = "ORIGINAL";
        String texto = request.getParameter("destxt");

      try
    {  
        com.factime.ln.ws.FactimeLogicaNegocioDirectorio_Service service = new com.factime.ln.ws.FactimeLogicaNegocioDirectorio_Service();
	com.factime.ln.ws.FactimeLogicaNegocioDirectorio port = service.getFactimeLogicaNegocioDirectorioPort();
	// TODO process result here
	String result = port.modificarProducto(id,codigo,descripcion, marca, procedencia, precio, stock,tipo,texto);
        if(result.equals("Producto Modificado"))
        {
            result = "okMo";
            response.sendRedirect("ListarModificarProductoDirectorio.jsp?txtparametro='all'");
        }
	else
        {
            result = "error";
            response.sendRedirect("ListarModificarProductoDirectorio.jsp?result="+result+"");
        }
        
    }
    catch (Exception ex) {
	// TODO handle custom exceptions here
    }

   
      

      
     

%>


