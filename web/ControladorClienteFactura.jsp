<%-- 
    Document   : ControladorClienteFactura
    Created on : 12/12/2015, 11:57:44
    Author     : Geovanny
--%>

<%@page import="com.factime.servicioweb.Factura"%>
<%@page import="com.factime.servicioweb.Cliente"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
   
<html lang="es">
  <head>
    <title> </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximun-scale=1">
    <link rel="stylesheet" href="tema/css/estilos.css">
    <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
    <script src="tema/js/scripts.js"></script>
    <script language="javascript" type="text/javascript"></script>
 
  </head>
  <body>
        <div class="grupo encabezado_paginas centro">
            <div class="caja web-100 centrar-contenido">
                <p>Bicirepuestos Alexandra</p>
            </div>
        </div>
      <div class="grupo ">
          <img src="tema/img/banner.jpg" >
      </div>
<%@page import="com.factime.servicioweb.Producto"%>

<div class="grupo formato_tabla centrar-contenido"> 
                <h2>Listado de clientes</h2>
                <br>
            <div class=" caja centro centrar-contenido web-100"> 
              <form action="ControladorClienteFactura.jsp" method="post">                                    
                    <tr><td>Ingrese el dato a buscar: </td>
                        <td><input type="text" name='txtparametro1' size="15" maxlength="15" onkeypress="return val(event), return ValNum(event)"></td>                                         
                        <td colspan="2" align="center"><input type="submit" name="buscar" class="boton_verde"></td>
                </form>
       <br>
                       <%
                    String id=request.getParameter("clienteid");
                    
                     try {
                        
                        String parametro = request.getParameter("txtparametro1");                   
                        String delimitadores= "[ .,;?!¡¿\'\"\\[\\]]+";
                        String[] palabrasSeparadas = parametro.split(delimitadores);
                        String variableAencontrar=palabrasSeparadas[0];
                        Integer longitud = parametro.length();
                   if (longitud > 0) 
                        {
                            com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
                            com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
                            String esTbl = port.getClientesFactura(variableAencontrar);
                            out.println(esTbl);
                            
                            Cliente c = new Cliente();
                            Integer idd =Integer.parseInt(id);
                            c = port.aa(idd);
        
                            Integer idcliente=c.getClienteId();
                            String Cedula=c.getClienteCedula();
                            String Nombre= c.getClienteNombre();
                            String Apellido=c.getClienteApellido();
                            String Direccion=c.getClienteDireccion();
        
                            Factura num = new Factura();
                            num=port.numeroFactura();
        
                            Integer numeroFactura=num.getFacturanumero()+1;      

                            HttpSession sesionClienteFactura = request.getSession();
                            sesionClienteFactura.setAttribute("idcliente",numeroFactura);
                            sesionClienteFactura.setAttribute("cedula",Cedula);
                            sesionClienteFactura.setAttribute("nombre",Nombre);
                            sesionClienteFactura.setAttribute("apellido",Apellido);
                            sesionClienteFactura.setAttribute("direccion",Direccion);
 
                            response.sendRedirect("IngresarFactura.jsp?cedula="+Cedula.toString()+"&idcliente="+numeroFactura.toString()+"&nombre="+Nombre.toString()+"&apellido="+Apellido.toString()+"&direccion="+Direccion.toString()+"");

                        } 
                        if((request.getParameter("txtparametro"))== null)
                            {
                            %>
                                    <h4>Datos no encontrados</h4>                               
    
                            <%
                                com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
                                com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
	
                                String result = port.listarClientesFactura();
                                out.println(result);
                            }
                        
                    } catch (Exception e) {

                    }

                %>
        <br><br>
    </div>          
<%
 if(request.getParameter("txtparametro1")==null)
{
 if(id==null){

    com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
	com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
	
	String result = port.listarClientesFactura();
	out.println(result);
}
else{
com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
	com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
	Cliente c = new Cliente(); 
        Integer idd =Integer.parseInt(id);
	c = port.aa(idd);
        
        Integer idcliente=c.getClienteId();
        String Cedula=c.getClienteCedula();
        String Nombre= c.getClienteNombre();
        String Apellido=c.getClienteApellido();
        String Direccion=c.getClienteDireccion();
        
        Factura num = new Factura();
        num=port.numeroFactura();
        
        Integer numeroFactura=num.getFacturanumero()+1;      

        HttpSession sesionClienteFactura = request.getSession();
        sesionClienteFactura.setAttribute("idcliente",numeroFactura);
        sesionClienteFactura.setAttribute("cedula",Cedula);
        sesionClienteFactura.setAttribute("nombre",Nombre);
        sesionClienteFactura.setAttribute("apellido",Apellido);
        sesionClienteFactura.setAttribute("direccion",Direccion);
        
        
        response.sendRedirect("IngresarFactura.jsp?cedula="+Cedula.toString()+"&idcliente="+numeroFactura.toString()+"&nombre="+Nombre.toString()+"&apellido="+Apellido.toString()+"&direccion="+Direccion.toString()+"");

 }
}%>
        <br><br>
    </div>        
 <footer>
      <div class="grupo pie centro">
        <div class="caja web-70 centrar-contenido">
          <p>Dirección: Venezuela 22-07 y Espejo <br>Riobamba-Ecuador<br>© Bicirepuestos "Alexandra" - 2015</p>
        </div>
          <div class="caja web-10 redes">
              <img src="tema/img/facebook.png">
          </div>
          <div class="caja web-10 redes">
              <img src="tema/img/images.png">
          </div>
          <div class="caja web-10 redes">
              <img src="tema/img/twitter.png">
          </div>
      </div>
    </footer>
  </body>
</html>