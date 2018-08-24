<%-- 
    Document   : cerrarsesion
    Created on : 19/11/2015, 0:05:31
    Author     : paul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HttpSession sessionOut = request.getSession();
            sessionOut.invalidate();
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>
