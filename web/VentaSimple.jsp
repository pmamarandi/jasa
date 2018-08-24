<%@page import="com.factime.servicioweb.Venta"%>
<%@page import="com.factime.InterfazUsuariosValidacion.ClaseValidacion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.factime.servicioweb.Producto"%>
<%@page import="com.factime.ln.ws.FactimeLogicaNegocio_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.factime.servicioweb.Cliente"%>

<!DOCTYPE html>
<%
    if (request.getParameter("result") != null) {
        if (request.getParameter("result").equals("La esta cedula incorrecta")) {
%>
<script>alert('Cedula incorrecta');
    window.redirected = 'BuscarClientes.jsp';
</script>
<%
} else if (request.getParameter("result").equals("Cliente ingresado")) {
%>
<script>alert('Cliente ingresado correctamente');
    window.redirected = 'BucarClientes.jsp';
</script>
<%
} else if (request.getParameter("result").equals("error")) {
%>
<script>alert('Sin conexion a la base de datos');
    window.redirected = 'index.jsp';
</script>
<%
} else if (request.getParameter("result").equals("El cliente ya se encuentra registrado")) {
%>
<script>alert('El cliente ya se encuentra registrado');
    window.redirected = 'index.jsp';
</script>
<%
        }
    }
%>
<script>
    function soloLetras(e) {
        tecla = (document.all) ? e.keyCode : e.which;
        if (tecla == 8)
            return true; //Tecla de retroceso (para poder borrar) 
// dejar la lÃ­nea de patron que se necesite y borrar el resto 
        patron = /[A-Za-z\sáéíóú]/; // Solo acepta letras 
//patron = /\d/; // Solo acepta nÃºmeros 
//patron = /\w/; // Acepta nÃºmeros y letras 
//patron = /\D/; // No acepta nÃºmeros 
// 
        te = String.fromCharCode(tecla);
        return patron.test(te);
    }

    function soloNumeros(e) {
        var key = window.Event ? e.which : e.keyCode
        return (key >= 48 && key <= 57)
    }

    function val(e) {
        tecla = (document.all) ? e.keyCode : e.which;
        if (tecla === 8)
            return true;
        patron = /[A-Za-z]/;
        te = String.fromCharCode(tecla);
        return patron.test(te);
    }
    function ValNum() {
        if (event.keyCode < 48 || event.keyCode > 57) {
            event.returnValue = false;
        }
    }
</script>
<script>
    // This is called with the results from from FB.getLoginStatus().
    function statusChangeCallback(response) {
        console.log('statusChangeCallback');
        console.log(response);
        // The response object is returned with a status field that lets the
        // app know the current login status of the person.
        // Full docs on the response object can be found in the documentation
        // for FB.getLoginStatus().
        if (response.status === 'connected') {
            // Logged into your app and Facebook.
            html = "<p>Hola " + fb.user.name + "</p>";
            testAPI();
        } else {
            // The person is not logged into your app or we are unable to tell.
            document.getElementById('status').innerHTML = 'Please log ' +
                    'into this app.';
        }
    }

    // This function is called when someone finishes with the Login
    // Button.  See the onlogin handler attached to it in the sample
    // code below.
    function checkLoginState() {
        FB.getLoginStatus(function (response) {
            statusChangeCallback(response);
        });
    }

    window.fbAsyncInit = function () {
        FB.init({
            appId: '887364638101961',
            cookie: true, // enable cookies to allow the server to access 
            // the session
            xfbml: true, // parse social plugins on this page
            version: 'v2.12' // use graph api version 2.8
        });

        // Now that we've initialized the JavaScript SDK, we call 
        // FB.getLoginStatus().  This function gets the state of the
        // person visiting this page and can return one of three states to
        // the callback you provide.  They can be:
        //
        // 1. Logged into your app ('connected')
        // 2. Logged into Facebook, but not your app ('not_authorized')
        // 3. Not logged into Facebook and can't tell if they are logged into
        //    your app or not.
        //
        // These three cases are handled in the callback function.

        FB.getLoginStatus(function (response) {
            statusChangeCallback(response);
        });

    };

    // Load the SDK asynchronously
    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id))
            return;
        js = d.createElement(s);
        js.id = id;
        js.src = "https://connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    // Here we run a very simple test of the Graph API after login is
    // successful.  See statusChangeCallback() for when this call is made.
    function testAPI() {
        console.log('Welcome!  Fetching your information.... ');
        FB.api('/me', function (response) {
            console.log('Successful login for: ' + response.name);
            document.getElementById('status').innerHTML =
                    'Thanks for logging in, ' + response.name + '!';
        });
    }



</script>

<script>
// If user clicks anywhere outside of the modal, Modal will close

    var modal = document.getElementById('ing');
    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>
<script>
// If user clicks anywhere outside of the modal, Modal will close

    var modal = document.getElementById('reg');
    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }

    }
</script>

<style>
    *{margin:0px; padding:0px; font-family:Helvetica, Arial, sans-serif;}

    /* Full-width input fields */
    input[type=text], input[type=password] {
        width: 90%;
        padding: 12px 20px;
        margin: 8px 26px;
        display: inline-block;
        border: 1px solid #ccc;
        box-sizing: border-box;
        font-size:16px;
    }

    /* Set a style for all buttons */
    button {
        background-color: #848484;
        color: white;
        padding: 14px 20px;
        margin: 8px 26px;
        border: none;
        cursor: pointer;
        width: 90%;
        font-size:20px;
    }
    button:hover {
        opacity: 0.8;
    }

    /* Center the image and position the close button */
    .imgcontainer {
        text-align: center;
        margin: 24px 0 12px 0;
        position: relative;
    }
    .avatar {
        width: 200px;
        height:200px;
        border-radius: 50%;
    }

    /* The Modal (background) */
    .modal {

        top: 50px;
        display:none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0,0,0,0.4);
    }

    /* Modal Content Box */
    .modal-content {
        background-color: #fefefe;
        margin: 8% auto 15% auto;
        border: 1px solid #888;
        width: 20%; 
        padding-bottom: 30px;
    }

    /* The Close Button (x) */
    .close {
        position: absolute;
        right: 25px;
        top: 0;
        color: #000;
        font-size: 35px;
        font-weight: bold;
    }
    .close:hover,.close:focus {
        color: red;
        cursor: pointer;
    }

    /* Add Zoom Animation */
    .animate {
        animation: zoom 0.6s
    }
    @keyframes zoom {
        from {transform: scale(0)} 
        to {transform: scale(1)}
    }
</style>

</head>
<style type="text/css">
    #chistes
    {
        position: relative;
    }

    .sobre 
    {
        position:absolute;
        top:0px;
        left:0px;
        border:none;
    }
</style>   

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<html lang="es">
    <head>
        <%
            HttpSession sesion = request.getSession(true);

            String strNombreAdministrador = (String) sesion.getAttribute("Nombre");
            String strApellidoAdministrador = (String) sesion.getAttribute("Apellido");
            // String strCedulaUsuario = (String) sesion.getAttribute("cedula");

            if ((sesion.getAttribute("empleado") == null)) {
                response.sendRedirect("index.jsp");
            }

        %>



        <meta charset="utf-8" />
        <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
        <link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

        <title>Factime |Venta Administrador</title>

        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />


        <!-- Bootstrap core CSS     -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

        <!-- Animation library for notifications   -->
        <link href="assets/css/animate.min.css" rel="stylesheet"/>

        <!--  Paper Dashboard core CSS    -->
        <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>


        <!--  CSS for Demo Purpose, don't include it in your project     -->
        <link href="assets/css/demo.css" rel="stylesheet" />


        <!--  Fonts and icons     -->
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
        <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
        <link href="assets/css/themify-icons.css" rel="stylesheet">

    </head>
    <body>
        <%         String vacio = (request.getParameter("variableVacia") != null) ? request.getParameter("variableVacia") : "1";
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
                            <a class="navbar-brand" href="#">VENTAS /Cloud software</a>
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

                            <!-- FACTURAS-->
                            <div class="col-lg-5 col-md-5">
                                <div class="card">


                                    <div class="header">
                                        <h4 class="title">Productos</h4>
                                    </div>

                                    <div class="content table-responsive table-full-width">

                                        <form action="" method="post">                                                                                                                               
                                            <div class="col-md-5 form-group-sm">

                                                <input name="codigo" placeholder="Codigo Producto" size="15"  type="search" class="form-control border-input" required="">

                                            </div>
                                            <input type="submit" name="buscar" class="btn btn-primary btn-group">
                                        </form>

                                        <%
                                            com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
                                            com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();

                                            try {

                                                String codigo = request.getParameter("codigo");

                                                Producto oProducto = new Producto();
                                                oProducto = port.productoCodigoNombre(codigo);
                                                Integer stock = oProducto.getProductoStock();
                                                if (oProducto != null) {


                                        %>
                                        <BR>
                                        <div class="container-fluid"  id="stylized"> 
                                            <form NAME="slibro" ACTION="" METHOD="post">
                                                <label>Codigo:</label><input class="form-control border-input" type="text" name="codigo" value="<%= oProducto.getProductoCodigo()%>" readonly>
                                                <label>Descripcion:</label><input class="form-control border-input" type="text" name="descripcion" value="<%= oProducto.getProductoDescripcion()%>"   size="30" maxlength="50"  readonly>
                                                <label>Precio Unitario:</label><input class="form-control border-input" type="number" id="valor1" name="punitario" value="<%= oProducto.getProductoPrecioUnitario()%>" onkeypress="return soloDecimales(event)"  min="0.01" max="500" step="0.01">
                                                <label>Stock: <%= stock%></label><input class="form-control border-input" type="number" name="cantidad" min="1" max="<%= stock%>" step="1" onkeypress="return soloNumeros(event)">
                                                <input type="hidden" name="idproducto" value="<%= oProducto.getProductoId()%>">

                                                <br>
                                                <center>
                                                    <% if (stock == 0) {
                                                    %>
                                                    <input class="btn btn-info btn-fill btn-wd" type="submit" name="AÑADIR" value="Añadir" onClick="document.forms.slibro.action = 'ControladorVentaSimple.jsp'; document.forms.slibro.submit()" disabled="true"><br>

                                                    <%
                                                    } else {
                                                    %>
                                                    <input class="btn btn-info btn-fill btn-wd" type="submit" name="AÑADIR" value="Añadir" onClick="document.forms.slibro.action = 'ControladorVentaSimple.jsp'; document.forms.slibro.submit()"><br>
                                                    <%
                                                            }

                                                        }
                                                    %>
                                                </center> 

                                            </form>
                                        </div>




                                        <%
                                            } catch (Exception ex) {
                                                // TODO handle custom exceptions here
                                            }

                                        %>






                                    </div>
                                </div>

                            </div>
                            <div class="col-lg-7 col-md7">
                                <fieldset style="height:520px; max-height:650px ;width: 100%;float: left;overflow: auto;border-radius: 10px">
                                    <div class="card">
                                        <div class="header">
                                            <h4 class="title">Detalle</h4>
                                        </div>

                                        <div class="content table-responsive table-full-width">
                                            <table class="table order-table" align="center">
                                                <tr bgcolor="#D8D8D8">
                                                    <td align="center">CODIGO</td>
                                                    <td align="center">CANTIDAD    </td>
                                                    <td align="center">DETALLE    </td>
                                                    <td align="right">V.UNITARIO    </td>
                                                    <td align="right">V.TOTAL    </td>
                                                </tr>
                                                <%                                                try {
                                                        ArrayList<Venta> arr;
                                                        arr = (ArrayList<Venta>) port.loadVentaSimple();

                                                        Integer nES = arr.size();

                                                        if (nES > 0) {
                                                            for (int i = 0; i < nES; i++) {
                                                %>
                                                <tr>
                                                    <td align="center"> <%= arr.get(i).getCodigoProducto()%> </td>
                                                    <td align="center"> <%= arr.get(i).getCantidad()%> </td>
                                                    <td align="center"> <%= arr.get(i).getDescripcion()%> </td>
                                                    <td align="right"> <%= arr.get(i).getPrecioUnitario()%> </td>
                                                    <td align="right"> <%= arr.get(i).getSubtotal()%> </td>
                                                </tr>
                                                <%
                                                    }
                                                %>
                                                     
                                            </table>
                                            <br>
                                            <%
                                                }
                                                if (nES != 0) {
                                            %><a href='ControladorFacturaVentaSimple.jsp'><img src='estilos/Login_v2/images/factura.png' width='50' height='50'></a>
                                                <%
                                                    }
                                                %>







                                            <%
                                                } catch (Exception ex) {
                                                }%>



                                        </div>


                                    </div>
                                </fieldset>
                            </div>
                        </div>


                    </div>
                </div>




                </body>

                <!--   Core JS Files   -->
                <script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>
                <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

                <!--  Checkbox, Radio & Switch Plugins -->
                <script src="assets/js/bootstrap-checkbox-radio.js"></script>

                <!--  Charts Plugin -->
                <script src="assets/js/chartist.min.js"></script>

                <!--  Notifications Plugin    -->
                <script src="assets/js/bootstrap-notify.js"></script>

                <!--  Google Maps Plugin    -->
                <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>

                <!-- Paper Dashboard Core javascript and methods for Demo purpose -->
                <script src="assets/js/paper-dashboard.js"></script>

                <!-- Paper Dashboard DEMO methods, don't include it in your project! -->
                <script src="assets/js/demo.js"></script>

                <script type="text/javascript">
                                                        $(document).ready(function () {

                                                            demo.initChartist();

                                                            $.notify({
                                                                icon: 'ti-heart',
                                                                message: "Welcome to <b>IEJSA </b> - Portal de Administración."

                                                            }, {
                                                                type: 'success',
                                                                timer: 4000
                                                            });

                                                        });
                </script>

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

                    var lista = document.getElementById("cantidad");

                    var mostrarValor = function (x) {
                        document.getElementById('valoreninput').value = x;

                    };
                </script>
                <script>
                    function soloLetras(e) {
                        tecla = (document.all) ? e.keyCode : e.which;
                        if (tecla == 8)
                            return true; //Tecla de retroceso (para poder borrar) 
                        // dejar la lÃ­nea de patron que se necesite y borrar el resto 
                        patron = /[A-Za-z\sáéíóú]/; // Solo acepta letras 
                        //patron = /\d/; // Solo acepta nÃºmeros 
                        //patron = /\w/; // Acepta nÃºmeros y letras 
                        //patron = /\D/; // No acepta nÃºmeros 
                        // 
                        te = String.fromCharCode(tecla);
                        return patron.test(te);
                    }

                    function soloNumeros(e) {
                        var key = window.Event ? e.which : e.keyCode
                        return (key >= 48 && key <= 57)
                    }

                    function val(e) {
                        tecla = (document.all) ? e.keyCode : e.which;
                        if (tecla === 8)
                            return true;
                        patron = /[A-Za-z]/;
                        te = String.fromCharCode(tecla);
                        return patron.test(te);
                    }
                    function ValNum() {
                        if (event.keyCode < 48 || event.keyCode > 57) {
                            event.returnValue = false;
                        }
                    }
                </script>

