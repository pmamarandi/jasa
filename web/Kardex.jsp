<%-- 
    Document   : Kardex
    Created on : 23/08/2018, 12:10:26
    Author     : Yesenia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
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

        <title>JASA Kardex</title>

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
                            <a class="navbar-brand" href="#">PRODUCTOS</a>
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
                                    <div class="card">

                                        <div class="header">
                                            <p class="category">Kardex</p>
                                        </div>
                                        <div class="content table-responsive table-full-width">

                                        </div>
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

<script type="text/javascript">
                                    (function (document)
                                    {
                                        'use strict';

                                        var LightTableFilter = (function (Arr) {

                                            var _input;

                                            function _onInputEvent(e) {
                                                _input = e.target;
                                                var tables = document.getElementsByClassName(_input.getAttribute('data-table'));
                                                Arr.forEach.call(tables, function (table) {
                                                    Arr.forEach.call(table.tBodies, function (tbody) {
                                                        Arr.forEach.call(tbody.rows, _filter);
                                                    });
                                                });
                                            }

                                            function _filter(row) {
                                                var text = row.textContent.toLowerCase(), val = _input.value.toLowerCase();
                                                row.style.display = text.indexOf(val) === -1 ? 'none' : 'table-row';
                                            }

                                            return {
                                                init: function () {
                                                    var inputs = document.getElementsByClassName('light-table-filter');
                                                    Arr.forEach.call(inputs, function (input) {
                                                        input.oninput = _onInputEvent;
                                                    });
                                                }
                                            };
                                        })(Array.prototype);

                                        document.addEventListener('readystatechange', function () {
                                            if (document.readyState === 'complete') {
                                                LightTableFilter.init();
                                            }
                                        });

                                    })(document);
</script>

