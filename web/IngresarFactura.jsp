<%-- 
    Document   : IngresarFactura
    Created on : 23-jun-2017, 16:11:44
    Author     : erick
--%>

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

	<title>Factime Facturas</title>

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

    	<div class="sidebar-wrapper">
             <div class="logo">
                <a href="#" class="simple-text">
                    FACTIME
                </a>
            </div>

            <ul class="nav">
                <li>
                    <a href="indexAdministrador.jsp">
                        <i class="ti-panel"></i>
                        <p>PANEL</p>
                    </a>
                </li>
                 <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="ti-user"></i>
                        <p>CLIENTES</p>
                    </a>
                    <ul class="dropdown-menu">
                      <li><a href="BuscarClientes.jsp">Ver</a></li>
                      <li><a href="listarMasFrecuentesCliente.jsp">Mejores Clientes</a></li>
                    </ul>
                </li>                                  
                <li class="dropdown active">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="ti-clipboard"></i>
                        <p>FACTURAS</p>
                    </a>
                    <ul class="dropdown-menu">
                      <li><a href="IngresarFactura.jsp">Ingresar</a></li>
                      <li><a href="BuscarFactura.jsp">Ver</a></li>
                      <li><a href="Anuladas.jsp">Anuladas</a></li>
                      <li><a href="listarMasFrecuentesCliente.jsp">Mejores Ventas</a></li>
                      <li><a href="listarFacturasporFecha.jsp">Ventas por fecha</a></li>
                      <li><a href="listarMasFrecuentesCliente.jsp">Compras</a></li>
                    </ul>
                </li>  
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="ti-wallet"></i>
                        <p>PRODUCTOS</p>
                    </a>
                    <ul class="dropdown-menu">
                      <li><a href="ListarModificarProducto.jsp?txtparametro=%27all%27">Ver</a></li>                      
                      <li><a href="IngresarProcedencia.jsp">Categoria</a></li>
                      <li><a href="IngresarMarca.jsp">Division</a></li>
                      <li><a href="listarProductosMasVendidos.jsp">Mas vendidos</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="ti-shopping-cart-full"></i>
                        <p>COMPRAS</p>
                    </a>
                    <ul class="dropdown-menu">
                      <li><a href="IngresarCompra.jsp">Ingresar</a></li>
                      <li><a href="BuscarComprass.jsp">Ver</a></li>                      
                      <li><a href="listarMasFrecuentesCliente.jsp">Lista Compras</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="ti-gallery"></i>
                        <p>CATALOGO</p>
                    </a>
                    <ul class="dropdown-menu">
                      <li><a href="IngresarCacatalogo.jsp">Ingresar</a></li>
                      <li><a href="VerCatalogo.jsp">Ver</a></li>                      
                      </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="ti-star"></i>
                        <p>PROVEEDORES</p>
                    </a>
                    <ul class="dropdown-menu">
                      <li><a href="BuscarProveedor.jsp">Ingresar</a></li>                      
                    </ul>
                </li>
               
	       <li class="active-pro">
                    <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="ti-settings"></i>
                        <p>CONFIGURACIONES</p>
                    </a>
                    <ul class="dropdown-menu">
                      <li><a href="#">Perfil</a></li>                      
                    </ul>
                </li>
                 </li>
            </ul>
    	</div>
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
                    <a class="navbar-brand" href="#">FACTURAS</a>
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
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">                   

                    <div class="col-md-12">
                        <div class="card card-plain">                            
                            <div class="header">
                                <h3 class="title">Facturas</h3>                                                                          
                                <form action="BuscarFactura.jsp" method="post">                                                                                                                               
                                 <div class="col-md-3 form-group-sm">
                                   <input class="form-control border-input" type="text" name='txtparametro' placeholder="Buscar..." size="15" maxlength="15" onkeypress="return val(event), return ValNum(event)" required>                                   <br>
                                 </div>
                                   <input type="submit" name="buscar" class="btn btn-primary btn-group">
                                </form><br>
                            <br> 
                            </div>
                            <div class="content table-responsive table-full-width">
                                <%
                                try {                    
                        String parametro = request.getParameter("txtparametro");
                        if(parametro == null)
                        {
                            com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
                            com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
                            java.lang.String result = port.listarFactura();
                            out.println(result);
                        }
                        else
                        {
                        String delimitadores= "[ .,;?!¡¿\'\"\\[\\]]+";
                        String[] palabrasSeparadas = parametro.split(delimitadores);
                        String variableAencontrar=palabrasSeparadas[0];
                        Integer longitud = parametro.length();

                        if (longitud > 0) 
                        {
                            com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
                            com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
                            String esTbl  = port.getFacturasVer(variableAencontrar);
                            out.println(esTbl);
                        } 
                        else 
                        {
                            Integer cero = 0;
                            response.sendRedirect("BuscarFactura.jsp");
                        }
                        if((request.getParameter("txtparametro"))== null)
                        {
                            %>
                            <h4>Datos no encontrados</h4>
                            <%
                        }
                        }
                } catch (Exception e) {

                }

                %>
                                                                
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>

        <footer class="footer">
            <div class="container-fluid">
                <nav class="pull-left">
                    <ul>

                        <li>
                            <a href="http://www.creative-tim.com">
                                Creative Tim
                            </a>
                        </li>
                        <li>
                            <a href="http://blog.creative-tim.com">
                               Blog
                            </a>
                        </li>
                        <li>
                            <a href="http://www.creative-tim.com/license">
                                Licenses
                            </a>
                        </li>
                    </ul>
                </nav>
				<div class="copyright pull-right">
                    &copy; <script>document.write(new Date().getFullYear())</script>, made with <i class="fa fa-heart heart"></i> by <a href="http://www.creative-tim.com">Creative Tim</a>
                </div>
            </div>
        </footer>


    </div>
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