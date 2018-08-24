<%-- 
    Document   : ReporteFacturaFecha
    Created on : 16/08/2018, 18:15:24
    Author     : Yesenia
--%>

<%@page import="java.util.Map"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Properties"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Connection cnn = null;
    Boolean result = false;
     String var=request.getParameter("dato");
  Map parametro=new HashMap();
  parametro.put("parameter1", var);
      try
    {
        
      Class.forName("org.postgresql.Driver");
            
            cnn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/JASA", "postgres","postgres");
           
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        File reportFile = new File(application.getRealPath("ReporteFacturaId.jasper"));

      byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath (),parametro,cnn);

    response.setContentType("application/pdf");
    response.setContentLength(bytes.length);
    ServletOutputStream ouputStream = response.getOutputStream();
    ouputStream.write(bytes, 0, bytes.length);
    ouputStream.flush();
    ouputStream.close();

    %>