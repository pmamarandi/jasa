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
      
        String id = request.getParameter("id2");
        String  idproducto = request.getParameter("id");
        String cod = request.getParameter("cod2");
        Integer tipo = Integer.parseInt(request.getParameter("tipo"));
                
     try
    { 
        
        /*FileItemFactory es una interfaz para crear FileItem*/
        FileItemFactory file_factory = new DiskFileItemFactory();
 
        /*ServletFileUpload esta clase convierte los input file a FileItem*/
        ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
        /*sacando los FileItem del ServletFileUpload en una lista */
        List items = servlet_up.parseRequest(request);
 
        for(int i=0;i<items.size();i++){
            /*FileItem representa un archivo en memoria que puede ser pasado al disco duro*/
            FileItem item = (FileItem) items.get(i);
            /*item.isFormField() false=input file; true=text field*/
            if (! item.isFormField()){
                /*cual sera la ruta al archivo en el servidor*/
                File archivo_server = new File("D:/imgiejsa/"+item.getName());
                /*y lo escribimos en el servido*/
                item.write(archivo_server);
                
               //graba la direccion en la db
                com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
                com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
                Imagen img=new Imagen();
                img.setNombre("http://localhost:81/"+item.getName());
                img.setRutafisica(archivo_server.toString());
                img.setCodigoproducto(cod);
                img.setIdproducto(id);
                img.setTipo(tipo);
                // TODO process result here
                String result = port.ingresarImgP(img);
                if(result.equals("Imagen Ingresada"))
                {
                    result = "okIng";
                    response.sendRedirect("ModificarProducto.jsp?id="+id+"&cod="+cod+"");
                }
                else
                {
                    result = "error";
                    response.sendRedirect("ModificarProducto.jsp?id="+id+"&cod="+cod+"");
                }
                
            }
        }
        
        
    }
    catch (Exception ex) {
	// TODO handle custom exceptions here
    }

   
    
        /*FileItemFactory es una interfaz para crear FileItem*/
        FileItemFactory file_factory = new DiskFileItemFactory();
 
        /*ServletFileUpload esta clase convierte los input file a FileItem*/
        ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
        /*sacando los FileItem del ServletFileUpload en una lista */
        List items = servlet_up.parseRequest(request);
 
        for(int i=0;i<items.size();i++){
            /*FileItem representa un archivo en memoria que puede ser pasado al disco duro*/
            FileItem item = (FileItem) items.get(i);
            /*item.isFormField() false=input file; true=text field*/
            if (! item.isFormField()){
                /*cual sera la ruta al archivo en el servidor*/
                File archivo_server = new File("D:/imgiejsa/"+item.getName());
                /*y lo escribimos en el servido*/
                item.write(archivo_server);
                out.print("Nombre --> " + item.getName() );
                out.print("<br> Tipo --> " + item.getContentType());
                out.print("<br> tamaño --> " + (item.getSize()/1240)+ "KB");
                out.print("<br>");
            }
        }
      

      
     

%>


