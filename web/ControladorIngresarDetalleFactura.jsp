<%-- 
    Document   : ControladorIngresarDetalleFactura
    Created on : 13/12/2015, 17:33:25
    Author     : Geovanny
--%>

<%@page import="com.factime.servicioweb.Factura"%>
<%@page import="com.factime.servicioweb.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.factime.servicioweb.DetalleFactura"%>
<%
Integer id=1;
String cedula=request.getParameter("cedula");
String date="2015-12-12";
Integer iva=12;

Double total=12.0;

Integer idproducto =Integer.parseInt(request.getParameter("idproducto"));
Integer codigo1 =Integer.parseInt(request.getParameter("codigo1"));
//Integer codigo =Integer.parseInt(request.getParameter("codigo"));
String descripcion =request.getParameter("descripcion");
Double precio=Double.parseDouble(request.getParameter("precio"));
Integer cantidad= Integer.parseInt(request.getParameter("cantidad"));

Double subtotal= 0.0;
subtotal=precio*cantidad;
         
com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
	com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
DetalleFactura oDetalleFactura=new DetalleFactura(); 
//oDetalleFactura.setDetallefacturafacturaid(id);
oDetalleFactura.setDetallefacturaproductoid(idproducto);
oDetalleFactura.setDetallefacturaproductodescripcion(descripcion);
oDetalleFactura.setDetallefacturaproductopreciounitario(precio);
oDetalleFactura.setDetallefacturaproductocantidad(cantidad);
oDetalleFactura .setDetallefacturapreciototal(subtotal);

  Factura num = new Factura();
        num=port.numeroFactura();        
        Integer numeroFactura=num.getFacturanumero()+1; 

String result = port.ingresarDetalleFactura(numeroFactura, idproducto, descripcion, precio, cantidad, subtotal);

ArrayList<DetalleFactura> arr= (ArrayList) port.subtotalFactura(numeroFactura);
 Integer nEs = arr.size();
        Double suma;
        suma=null;
        for (int i = 0; i < nEs; i++) {
            DetalleFactura c = arr.get(i);
            suma = c.getFacturasubtotal();
        }

response.sendRedirect("IngresarFacturaEmpleado.jsp?a="+result.toString()+"&codigo1="+codigo1.toString()+"&subtotalfactura="+suma.toString()+"");


%>
   