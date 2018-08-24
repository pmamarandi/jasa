<%-- 
    Document   : ModificarProducto
    Created on : 22-jun-2017, 16:25:04
    Author     : erick
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.factime.ln.ws.FactimeLogicaNegocio_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String IdP = request.getParameter("id");
String codImg = request.getParameter("cod");
    %>

<!DOCTYPE html><%
         HttpSession sesion = request.getSession(true);

    String strNombreAdministrador = (String) sesion.getAttribute("Nombre");
    String strApellidoAdministrador = (String) sesion.getAttribute("Apellido");
    //String strCedulaUsuario = (String) sesion.getAttribute("cedula");

   HttpSession sesionOk = request.getSession();
         sesionOk.setAttribute("Nombre",strNombreAdministrador);
                        sesionOk.setAttribute("Apellido",strApellidoAdministrador);                        
        %>
         
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>IEJSA Modificar Producto</title>

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
<script>
   function val(e) {
    tecla = (document.all) ? e.keyCode : e.which;
    if (tecla===8) return true;
    patron =/[A-Za-z]/;
    te = String.fromCharCode(tecla);
    return patron.test(te);
    }
        function ValidNum() {
        if (event.keyCode < 48 || event.keyCode > 57) {
            event.returnValue = false;
        }
        }</script>
</head>
<body>
        <%
             String vacio = (request.getParameter("variableVacia") != null) ? request.getParameter("variableVacia") : "1";
            Integer vacioInt = Integer.parseInt(vacio);
            if (vacioInt == 0) {
                vacio = "Datos no encontrados";                
            } else {
                vacio = "";
            }
        %>
         

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
                    <a class="navbar-brand" href="#">PRODUCTOS /Modificar</a>
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
                    
                    <div class="col-lg-5 col-md-4">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Editar Producto</h4>
                            </div>
                            <div class="content">
              <form action="ControladorModificarProducto.jsp" method="post">                                    
                    
                 <%                  
	com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
	com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
	String result = port.mostrarModificarP(IdP);
	out.println(result);
         %>
                </form>
                            </div>
                        </div>
                    </div>

                <div class="col-lg-7 col-md-5">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Galeria del producto</h4>
                               
                            </div>
                            <div class="content">
                                <form action="ControladorIngresarModImg.jsp?id2=<%out.print(IdP);%>&cod2=<%out.print(codImg);%>&tipo=0" enctype="MULTIPART/FORM-DATA" method="post">                                                                                
             <%                  
	com.factime.ln.ws.FactimeLogicaNegocio portimg = service.getFactimeLogicaNegocioPort();
	String resultimg = portimg.mostrarModificarImagenPrincipal(IdP,codImg,0);
	out.println(resultimg);
         %>
                </form>
                <br>
                 <form action="ControladorIngresarModImg.jsp?id2=<%out.print(IdP);%>&cod2=<%out.print(codImg);%>&tipo=1" enctype="MULTIPART/FORM-DATA" method="post">                                                                                
             <%                  	
	String resultimg2 = portimg.mostrarModificarImagenPrincipal(IdP,codImg,1);
	out.println(resultimg2);
         %>
                </form>
                <br>
                 <form action="ControladorIngresarModImg.jsp?id2=<%out.print(IdP);%>&cod2=<%out.print(codImg);%>&tipo=2" enctype="MULTIPART/FORM-DATA" method="post">                                                                                
             <%                  	
	String resultimg3 = portimg.mostrarModificarImagenPrincipal(IdP,codImg,2);
	out.println(resultimg3);
         %>
                </form>
                                
                                
                            </div>
                        </div>
                    </div>
                <div class="col-lg-7 col-md-5">
                    <form method="post" action="eliminarProducto.jsp">
                    <input class='btn btn-info btn-fill btn-wd' name='Eliminar' value='Eliminar' type='submit'>
                    </form>
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
