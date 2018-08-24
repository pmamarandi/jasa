<%-- 
    Document   : controladorAutenticacionCliente
    Created on : 18/11/2015, 14:08:46
    Author     : paul
--%>

<%@page import="com.factime.servicioweb.Empleado"%>
<%@page import="com.factime.InterfazUsuariosValidacion.ClaseValidacion"%>
<%@page import="com.factime.servicioweb.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
          String ci = request.getParameter("ci");
          String clave = request.getParameter("clave");
          
          ClaseValidacion oValidacion = new ClaseValidacion();
          Boolean ok = oValidacion.validacionCedula(ci);
          if(ok == true)
          {
            Empleado oEmpleado = new Empleado();
            oEmpleado.setEmpleadoCedula(ci);
            oEmpleado.setEmpleadoClave(clave);
            
            com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
            com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
            
            
             HttpSession sesion = request.getSession();
             com.factime.servicioweb.Empleado result = port.autenticacionEmpleado(oEmpleado);
                       
            if(result != null){
                //EMPLEADO NORMAL
                if(result.getEmpleadoTipo() == 0)
                  {
                        
                        sesion.setAttribute("empleado", "EMPLEADO");
                        sesion.setAttribute("Nombre",result.getEmpleadoNombre());
                        sesion.setAttribute("Apellido",result.getEmpleadoApellido());
                        sesion.setAttribute("Cedula",result.getEmpleadoCedula());
                        response.sendRedirect("indexAdministrador.jsp");
                  }
                //ADMINISTRADOR
                  if(result.getEmpleadoTipo() == 1){
                        sesion.setAttribute("empleado", "ADMINISTRADOR");
                        sesion.setAttribute("Nombre",result.getEmpleadoNombre());
                        sesion.setAttribute("Apellido",result.getEmpleadoApellido());
                        sesion.setAttribute("Cedula",result.getEmpleadoCedula());
                        response.sendRedirect("indexAdministrador.jsp");
                  }
            }
            else{
                
            com.factime.ln.ws.FactimeLogicaNegocio_Service service2 = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
            com.factime.ln.ws.FactimeLogicaNegocio port2 = service2.getFactimeLogicaNegocioPort();
                Cliente oCliente = new Cliente();
                oCliente.setClienteCedula(ci);
                oCliente.setClienteClave(clave);
                com.factime.servicioweb.Cliente result2 = port2.autenticacionCliente(oCliente);
                if (result2 != null) {
                      HttpSession sesionOk = request.getSession();
                      sesionOk.setAttribute("Nombre",result2.getClienteNombre());
                      sesionOk.setAttribute("Apellido",result2.getClienteApellido());
                      sesionOk.setAttribute("Cedula",result2.getClienteCedula());
                      response.sendRedirect("indexCliente.jsp");
                  }
                else
                {
                    String errorDatos = "Noexiste";
                    response.sendRedirect("index.jsp?errorDatos='"+errorDatos+"'");
                }
            }
          
          }
          else
          {              
              String error = "cedulaMal";
              response.sendRedirect("index.jsp?error='"+error+"'");
          }
    %>
    </body>
</html>