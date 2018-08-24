<%-- 
    Document   : ControladorVenta
    Created on : 12/08/2018, 16:17:06
    Author     : Yesenia
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.factime.servicioweb.Factura"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.factime.servicioweb.DetalleFactura"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.factime.servicioweb.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vent</title>
    </head>
    <body>
        <%
            String cii="0999999999";
        String cedula=request.getParameter("cliente");
       String NombreCampo = null; 
    String valor = null; 
    Double TotalP=0.0;
      Double IVA=0.0;
      Double Subtotal=0.0;
      
    
    ArrayList<DetalleFactura> LstDetalle= new ArrayList<DetalleFactura>();
    DetalleFactura ObjDetalle=new DetalleFactura();
    
   for(Enumeration e = request.getParameterNames();e.hasMoreElements();) 
    { 
        NombreCampo = (String) e.nextElement(); 
        valor = request.getParameter(NombreCampo); 
        
        if((NombreCampo.substring(NombreCampo.length()-1,NombreCampo.length())).equals("1"))
        {
            ObjDetalle.setDetallefacturaproductoid(Integer.valueOf(valor)); //id del producto      
        }
       
        if((NombreCampo.substring(NombreCampo.length()-1,NombreCampo.length())).equals("3"))
        {
            ObjDetalle.setDetallefacturaproductocantidad(Integer.valueOf(valor)); //cantidad
        }
        
        if((NombreCampo.substring(NombreCampo.length()-1,NombreCampo.length())).equals("4"))
        {
            ObjDetalle.setDetallefacturaproductopreciounitario(Double.valueOf(valor.substring(1,valor.length()))); //toal 
        }
        
        if((NombreCampo.substring(NombreCampo.length()-1,NombreCampo.length())).equals("5"))
        {
            ObjDetalle.setDetallefacturapreciototal(Double.valueOf(valor.substring(1,valor.length()))); //toal
            LstDetalle.add(ObjDetalle);
            ObjDetalle = new DetalleFactura();
        }
        
        if(NombreCampo.equals("total"))
        {
             Subtotal=Double.valueOf(valor.substring(1,valor.length())); //subtotal
        }
        
        if(NombreCampo.equals("iva"))
        {
            IVA=Double.valueOf(valor.substring(1,valor.length())); //iva
        }
        
        if(NombreCampo.equals("totalventa"))
        {
            TotalP=Double.valueOf(valor.substring(1,valor.length()));//totalventa
           
        }
        
    }   
        Date ahora = new Date();
        SimpleDateFormat formateador = new SimpleDateFormat("yyyy-MM-dd");
        String strDate = formateador.format(ahora);
        
    Factura ObjFactura= new  Factura();
  
    ObjFactura.setFacturaclientecedula((request.getParameter("cliente")!= null)? request.getParameter("cliente"): cii);  //cliente   
    ObjFactura.setFacturasubtotal(Subtotal); //subtotal
    ObjFactura.setFacturaiva(IVA);       //iva
    ObjFactura.setFacturatotal(TotalP); //total
    ObjFactura.setFacturafechacompra(strDate);
 
    
        Integer band=0;
        com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
	com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
        
        String Result=port.guardarVenta(LstDetalle, ObjFactura,band);

       if(Result.equals("REGISTRO CORRECTO"))
        response.sendRedirect("RegistrarVenta.jsp");
         
       %>
    </body>
</html>
