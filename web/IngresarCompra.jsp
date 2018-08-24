<%-- 
    Document   : ListarModificarProducto
    Created on : 2018
    Author     : Paul Mamarandi
--%>
<%@page import="com.factime.ln.ws.FactimeLogicaNegocio_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%
         HttpSession sesion = request.getSession(true);

    String strNombreAdministrador = (String) sesion.getAttribute("Nombre");
    String strApellidoAdministrador = (String) sesion.getAttribute("Apellido");
   // String strCedulaUsuario = (String) sesion.getAttribute("cedula");

    if ((sesion.getAttribute("empleado") == null)) {
        response.sendRedirect("index.jsp");
    }

        %>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="estilos/paper-dashboard-free-v1.1.2/assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="estilos/paper-dashboard-free-v1.1.2/assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>IEJSA Productos</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="estilos/paper-dashboard-free-v1.1.2/assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="estilos/paper-dashboard-free-v1.1.2/assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Paper Dashboard core CSS    -->
    <link href="estilos/paper-dashboard-free-v1.1.2/assets/css/paper-dashboard.css" rel="stylesheet"/>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="estilos/paper-dashboard-free-v1.1.2/assets/css/demo.css" rel="stylesheet" />

    <!--  Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="estilos/paper-dashboard-free-v1.1.2/assets/css/themify-icons.css" rel="stylesheet">

</head>
<body>

<div class="wrapper">
	<div class="sidebar" data-background-color="white" data-active-color="danger">

    <!--
		Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
		Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
	-->

    	 <%@ include file="menumaster.jsp" %>
    </div>

    <div class="main-panel">
	<nav class="navbar navbar-default">
             <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar bar1"></span>
                        <span class="icon-bar bar2"></span>
                        <span class="icon-bar bar3"></span>
                    </button>
                    <a class="navbar-brand" href="#">COMPRAS DE ABASTECIMIENTO</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="ti-user"></i>
								<p> <%out.print(strNombreAdministrador + " " + strApellidoAdministrador);%></p>
                               <b class="caret"></b>                                                                   
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Salir</a></li>
                                </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>


         <div class="content">
                      <div class="content">
                  <%
             Integer strNumeroFactura = 0;
             String strFecha = "";
             String strProveedor= null;
             Double strIva = 0.0;
  
             HttpSession sesionFacturaCompra = request.getSession();
           
            strNumeroFactura =(Integer) sesionFacturaCompra.getAttribute("numeroFactura");
            strFecha = (String) sesionFacturaCompra.getAttribute("Fecha");
            strProveedor = (String) sesionFacturaCompra.getAttribute("Proveedor");           
            strIva = (Double) sesionFacturaCompra.getAttribute("Iva");
            
                  
                  %>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-4 ">
                        <div class="card card-user">
                             <div class="header">
                                <h4 class="title">Datos Factura</h4>
                            </div>                               
                              
                                   
               
            <form NAME="slibro" ACTION="" METHOD="GET">
                     
                <div class="container-fluid"  id="stylized"> 
                   <label>N&uacute;mero de Factura:</label><input class="form-control border-input"  type="number" value="<%=strNumeroFactura%>" name="numeroFactura" onkeypress="return soloNumeros(event)" size="20" maxlength="30" required>
                    <label>Fecha de Compra</label><input class="form-control border-input" type="date" value="<%=strFecha%>" name="fecha"  size="30" maxlength="50"  required>
                      <label>Proveedor</label><%
                    try
                    {
                        com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
                        com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
                    
                        String proveedor = port.listarProveedoresCompra(strProveedor);
                        out.println(proveedor);
   
                     
                    }
                    catch(Exception ex) 
                    {
                                
                    }
                %>
                      <label>IVA</label><input class="form-control border-input"  type="number" name="iva"  min="0" max="30" value="<%=strIva%>" step="1" onkeypress="return soloNumeros(event)" required>    
                      <br>
                </div>
                           
                        </div>
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Datos Producto</h4>
                            </div>  
                            <div class="container-fluid">
                      
            <div class="caja web-55 movil-60 izquierda-contenido"  id="stylized">
               <label>Detalle</label> <%
                    try
                    {
                       com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
                com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
                        
                        String producto= port.listarProductosCompra();
                        out.println(producto);
                    }
                    catch(Exception ex) 
                    {
                                
                    }
                %>
                    
                    <label>Precio</label><input class="form-control border-input" type="number" id="valor1" name="precio" onkeypress="return soloDecimales(event)"  min="0.01" max="500" step="0.01">
                     <label>Cantidad</label><input class="form-control border-input"type="number" name="cantidad"  min="1" max="100" step="1" onkeypress="return soloNumeros(event)">
                
            </div><br>
             <center>
                <input class="btn btn-info btn-fill btn-wd" type="submit" name="AÑADIR" value="Añadir" onClick="document.forms.slibro.action='ControladorAñadirCompra.jsp'; document.forms.slibro.submit()"><br>
             </center>   <br>      
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-7">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Detalle de Productos</h4>
                            </div>
                             <div class="content table-responsive table-full-width">
                            <%

 // TODO initialize WS operation arguments here
	              try {
                    
                          Integer parametro = Integer.parseInt(request.getParameter("numero"));                        
                          com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
                            com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
                           
                            String esTbl = port.getComprasDetalles(parametro);
                            out.println(esTbl);
        
                        if((request.getParameter("numero"))== null)
                            {
                            %>
                                    <h4>Datos no encontrados</h4>
                            <%
                            }

                    } catch (Exception e) {

                    }

                %>

    <%
    try {
        
       
        Integer parametro = Integer.parseInt(request.getParameter("numero"));
	com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
	com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
	 // TODO initialize WS operation arguments here
	java.lang.Integer arg0 = Integer.valueOf(0);

        String esTbl = port.getSumaDetalles(parametro);
        out.println(esTbl);
       
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    
    %> </div>
     <br>
     <center><input class="btn btn-info btn-fill btn-wd" type="submit" name="factura" value="Confirmar" onClick="document.forms.slibro.action='ControladorFacturaCompra.jsp'; document.forms.slibro.submit()"></td>  </ul>
            
     </center><br></form>
                        </div>
                    </div>


                </div>
            </div>
        </div>
             
             
             
             
             

        <footer class="footer">
            <div class="container-fluid">
             
				<div class="copyright pull-right">
                    <script>document.write(new Date().getFullYear())</script>,Todos los derechos reservados <i class=""></i><a href="">©IEJSA</a>
                </div>
            </div>
        </footer>


    </div>



</body>

    <!--   Core JS Files   -->
    <script src="estilos/paper-dashboard-free-v1.1.2/assets/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="estilos/paper-dashboard-free-v1.1.2/assets/js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="estilos/paper-dashboard-free-v1.1.2/assets/js/bootstrap-checkbox-radio.js"></script>

	<!--  Charts Plugin -->
	<script src="estilos/paper-dashboard-free-v1.1.2/assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="estilos/paper-dashboard-free-v1.1.2/assets/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>

    <!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="estilos/paper-dashboard-free-v1.1.2/assets/js/paper-dashboard.js"></script>

	<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
	<script src="estilos/paper-dashboard-free-v1.1.2/assets/js/demo.js"></script>


</html>
