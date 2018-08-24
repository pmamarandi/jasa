<%-- 
    Document   : ControladorFacturaVentaSimple
    Created on : 13/08/2018, 19:08:12
    Author     : Yesenia
--%>

<%@page import="com.factime.servicioweb.Factura"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.factime.servicioweb.Venta"%>
<%@page import="com.factime.servicioweb.Venta"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.factime.servicioweb.DetalleFactura"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String cii = "0999999999";
            String cedula = request.getParameter("cliente");
            String NombreCampo = null;
            String valor = null;
            Double val=0.0;
            Double TotalP = 0.0;
            Double IVA = 0.0;
            Double Subtotal = 0.0;

            com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
            com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();

            ArrayList<Venta> arr;
            arr = (ArrayList<Venta>) port.loadVentaSimple();
              Integer nES = arr.size();
              
            ArrayList<DetalleFactura> LstDetalle = new ArrayList<DetalleFactura>();
            DetalleFactura ObjDetalle = new DetalleFactura();

            for(int i=0;i<nES;i++)
            {
                ObjDetalle.setDetallefacturaproductoid(arr.get(i).getIdProducto());              
                ObjDetalle.setDetallefacturaproductocantidad(arr.get(i).getCantidad());
                ObjDetalle.setDetallefacturaproductopreciounitario(arr.get(i).getPrecioUnitario());
                ObjDetalle.setDetallefacturapreciototal(arr.get(i).getSubtotal());                
                String estado=port.cambiarEstadoVenta(arr.get(i).getIdVenta());
                val=arr.get(i).getSubtotal(); 
                if(estado.equals("Exitoso"))
                {
                LstDetalle.add(ObjDetalle);
                ObjDetalle = new DetalleFactura();
                Subtotal=Subtotal+val;
                }
            }
                       
            
            Date ahora = new Date();
            SimpleDateFormat formateador = new SimpleDateFormat("yyyy-MM-dd");
            String strDate = formateador.format(ahora);

            Factura ObjFactura = new Factura();

            ObjFactura.setFacturaclientecedula((request.getParameter("cliente") != null) ? request.getParameter("cliente") : cii);  //cliente   
            ObjFactura.setFacturasubtotal(Subtotal); //subtotal
            ObjFactura.setFacturaiva(IVA);       //iva
            ObjFactura.setFacturatotal(TotalP); //total
            ObjFactura.setFacturafechacompra(strDate);
            
            Integer op=1;

            String Result = port.guardarVenta(LstDetalle, ObjFactura, op);

            if (Result.equals("REGISTRO CORRECTO")) {
                response.sendRedirect("VentaSimple.jsp");
            }

        %>
    </body>
</html>
