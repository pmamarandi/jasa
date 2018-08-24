<%-- 
    Document   : ControladorAnularFacturaAbastece
    Created on : 11-ene-2016, 22:43:24
    Author     : Jesus
--%>

 <%
    try {
        Integer IdFactura=Integer.parseInt(request.getParameter("idFactura"));
        
com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
                    com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
        //Cambia el estado de la factura
        port.cambiarEstadoFacturaAbastece(IdFactura);                
	
       response.sendRedirect("ControladorAnularFacturaAbastece1.jsp");
       
  
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>
    
