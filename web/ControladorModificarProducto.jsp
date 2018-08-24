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
        Integer marca = Integer.parseInt(request.getParameter("marca"));
        Integer procedencia = Integer.parseInt(request.getParameter("procedencia"));
        Double precio  = Double.parseDouble(request.getParameter("precio"));
        Integer stock = Integer.parseInt(request.getParameter("stock"));
        String tipo = request.getParameter("tipo");
        String texto = request.getParameter("destxt");

      try
    {  
        com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
	com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
	// TODO process result here
	String result = port.modificarProducto(id,codigo,descripcion, marca, procedencia, precio, stock,tipo,texto);
        if(result.equals("Producto Modificado"))
        {
            result = "okMo";
            response.sendRedirect("ListarModificarProducto.jsp?txtparametro='all'");
        }
	else
        {
            result = "error";
            response.sendRedirect("ListarModificarProducto.jsp?result="+result+"");
        }
        
    }
    catch (Exception ex) {
	// TODO handle custom exceptions here
    }

   
      

      
     

%>


