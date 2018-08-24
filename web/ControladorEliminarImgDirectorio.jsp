<%-- 
    Document   : ControladorModificarProducto
    Created on : 12-ene-2016, 14:41:55
    Author     : Paul Mamarandi
--%>
<%@page import="com.factime.servicioweb.Imagen"%>
<%@page import="com.factime.servicioweb.Producto"%>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.*" %>
<%@ page import="java.io.*" %>
<%
      
        String id = request.getParameter("id");
         String fileurl = request.getParameter("fileurl");
        String cod = request.getParameter("cod");
            Integer tipo = Integer.parseInt(request.getParameter("tipo"));        
    String result="null";
            
        
                /*cual sera la ruta al archivo en el servidor*/
               // File archivo_server = new File(fileurl);
                
                //File f1 = new File(?"D:\\imgiejsa\\67972-OC7XZE-798.jpg");
                File file1 = new File(fileurl);
                if(file1.exists()) {
                    file1.delete();
                    com.factime.ln.ws.FactimeLogicaNegocioDirectorio_Service service = new com.factime.ln.ws.FactimeLogicaNegocioDirectorio_Service();
                com.factime.ln.ws.FactimeLogicaNegocioDirectorio port = service.getFactimeLogicaNegocioDirectorioPort();
                Imagen img=new Imagen();
                img.setCodigoproducto(cod);
                 img.setTipo(tipo);
                // TODO process result here
                result = port.elimibarRutaImgP(img);
                if(result.equals("Imagen Eliminada"))
                {
                    result = "okDel";
                    response.sendRedirect("ModificarProductoDirectorio.jsp?id="+id+"&cod="+cod+"");
                }
                else
                {
                    result = "error";
                    response.sendRedirect("ModificarProductoDirectorio.jsp?id="+id+"&cod="+cod+"");
                }
                    
  
                /*y lo escribimos en el servido*/
                
                       //graba la direccion en la db
                
        }
    else{
          result = "error";
                    response.sendRedirect("ModificarProductoDirectorio.jsp?id="+id+"&cod="+cod+"");              
                        
                        }
                  
    

   
  

      
     

%>


