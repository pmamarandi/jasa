<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title> </title>
        <meta charset="utf-8">

        <link rel="stylesheet" href="tema/css/estilos.css">
        <script>
        function val(e) {
        tecla = (document.all) ? e.keyCode : e.which;
        if (tecla===8) return true;
            patron =/[A-Za-z]/;
            te = String.fromCharCode(tecla);
            return patron.test(te);
        }
        function ValNum(){
            if (event.keyCode < 48 || event.keyCode > 57) {
            event.returnValue = false;
        }
        }
    </script>

    </head>
  
 <body>
        <div class="grupo encabezado_paginas centro">
            <div class="caja web-100 centrar-contenido">
                <p>Bicirepuestos Alexandra</p>
            </div>
        </div>
      <div class="grupo web-100">
            <%
                String strNombreCliente = "";
                String strApellidoCliente = "";
                String strCedulaCliente = "";
                HttpSession sesionOk = request.getSession();
                strNombreCliente = (String) sesionOk.getAttribute("Nombre");
                strApellidoCliente = (String) sesionOk.getAttribute("Apellido");
                strCedulaCliente = (String) sesionOk.getAttribute("Cedula");
            %>
            <ul class="menu izquierda menu_verde">
              <li><a href="indexCliente.jsp">Inicio</a></li>
              <li><a href="#">Quienes Somos</a></li>
              <li><a href="ModificarClientes.jsp?clientecedula='<%=strCedulaCliente%>'">Mis Datos</a></li>
              <li><a href="BuscarProductoCliente.jsp?txtparametro='all'">Productos</a></li>
              <li><a href="listarfacturasCliente.jsp?clientecedula='<%=strCedulaCliente%>'">Mis facturas</a></li>
            </ul>
      </div>
      <div class="grupo formato_tabla centrar-contenido"> 
            <div class="caja web-100 centro-contenido">  
                <h2>Mis Compras</h2>
            </div>
          <div class="caja web-100 centro-contenido">
       
               <%
    
        String FacturaId = request.getParameter("id");
                if(FacturaId != null)
                   {
                    com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service service = new com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service();
                    com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio port = service.getBicirepuestosLogicaNegocioPort();
	           java.lang.String result = port.getFacturaIdVer(FacturaId);
                    out.println(result);
                   }
                else
                {
                     try {
                            com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service service = new com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service();
                            com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio port = service.getBicirepuestosLogicaNegocioPort();
                            java.lang.String result = port.listarFactura();
                            out.println(result);
                    } catch (Exception ex) {
                            // TODO handle custom exceptions here
                    }
            }%>
            <br><br>
            </div>
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
              <img src="tema/img/twitter.png" alt=""/>
          </div>
      </div>
    </footer>
  </body>
</html>