<%-- 
    Document   : ControladorAnularFactura
    Created on : 21-dic-2015, 10:02:38
    Author     : Jesus
--%>

 <%
    try {
        Integer IdFactura=Integer.parseInt(request.getParameter("factura"));
       
                    com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
                    com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
        //Cambia el estado de la factura
        String result = port.cambiarEstadoFactura(IdFactura);                
	/* out .println("Result = "+result);
         
        String esTbl = port.listarFacturasNoAnuladas(12,2015);
                                                     
        out.println(esTbl);*/
        //out.println("Factura Anulada");
       response.sendRedirect("FacturasAnuladas.jsp");
       
  
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>
    <%-- start web service invocation --%><hr/>
    <%
    try {
	
	
	 // TODO initialize WS operation arguments here
	java.lang.Integer arg0 = Integer.valueOf(0);
	// TODO process result here
	
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>
    <%-- end web service invocation --%><hr/>
