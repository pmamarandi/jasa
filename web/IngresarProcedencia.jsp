<%-- 
    Document   : IngresarProcedencia
    Created on : 21-jun-2017, 16:12:15
    Author     : erick
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html><%
         HttpSession sesion = request.getSession(true);

    String strNombreAdministrador = (String) sesion.getAttribute("Nombre");
    String strApellidoAdministrador = (String) sesion.getAttribute("Apellido");
    //String strCedulaUsuario = (String) sesion.getAttribute("cedula");

   HttpSession sesionOk = request.getSession();
         sesionOk.setAttribute("Nombre",strNombreAdministrador);
                        sesionOk.setAttribute("Apellido",strApellidoAdministrador);                        
        %>
         <%
    if(request.getParameter("result") != null){
    if(request.getParameter("result").equals("error")){
    %>
        <script>alert('Categoría no registrada');</script>
    <%
    }
%>
                    <script>alert('Categoría registrada correctamente');
                            window.redirected = 'index.jsp';
                    </script>
    <%}
    %>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>iejsa Ingreso Lineas</title>

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
                    <a class="navbar-brand" href="#">PRODUCTOS /Categorías</a>
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
                                <h4 class="title">Nueva Categoría</h4>
                            </div>
                            <div class="content">
                                <form id="form1" method="post" action="controladorIngresarProcedencia.jsp" name="registrar">
                                    <div class="row">                                        
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Descripción</label>
                                                <input type="text" name="descripcion" class="form-control border-input">                                                
                                            </div>                                            
                                        </div>                                        
                                        <div class="col-md-3">
                                            <label><label></label></label>
                                        <div class="text-center">                                                
                                            <button type="submit" class="btn btn-info btn-fill btn-wd">Guardar</button>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>    
                                    </div>                                    
                                    
                                </form>
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
