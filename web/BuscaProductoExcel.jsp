
<%@page import="com.factime.servicioweb.Producto"%>
<%@ page import="jxl.*"  %> 
<%@ page import="jxl.write.*"  %> 
<%@ page import="java.io.*"  %> 
<%@ page import="java.util.*"  %> 

<%@page contentType="application/vnd.ms-excel" pageEncoding="iso-8859-1"%> 
<% response.setHeader("Content-Disposition", "attachment; filename=Reporte.xls"); %> 
<% 
     
    String variable=request.getParameter("valor");
    
    
    
      WritableWorkbook w = Workbook.createWorkbook(response.getOutputStream()); 
      WritableSheet s = w.createSheet("Productos", 0); 
       
          s.addCell(new Label(5,2,"PRODUCTOS")); 
          s.addCell(new Label(5,3,variable)); 
          
           s.addCell(new Label(3,5,"CODIGO")); 
           s.addCell(new Label(4,5,"DESCRIPCION")); 
           s.addCell(new Label(5,5,"LINEA")); 
           s.addCell(new Label(6,5,"GRUPO")); 
           s.addCell(new Label(7,5,"STOCK")); 
   
    try {
          ArrayList<Producto> arr;
          
	com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
	com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
	 arr = (ArrayList<Producto>) port.buscarProductosVariable(variable);
         
         Integer nES = arr.size();
          int l=6;
          
          int k=2;
         if(nES>0)
         {
         for(int i=0;i<nES;i++)
         {  
           k=2;
           s.addCell(new Label(k+1,l,arr.get(i).getProductoCodigo())); 
           k++;
           s.addCell(new Label(k+1,l,arr.get(i).getProductoDescripcion())); 
           k++;
            s.addCell(new Label(k+1,l,arr.get(i).getProductoProcedenciaDescripcion())); 
           
           k++;
           s.addCell(new Label(k+1,l,arr.get(i).getProductoMarcaDescripcion()));
                
           l++;          
           
          }
         }
         else
         {
             s.addCell(new Label(9,5,"Sin Datos")); 
         }
         
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }

          

       
//columna, renglon 
       s.addCell(new Label(15,15,variable)); 
       w.write(); 
       w.close(); 

%>  