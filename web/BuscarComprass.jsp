<%-- 
    Document   : indexAdministrador
    Created on : 02-08/2018, 12:22:08
    Author     : Yesenia
--%>

<%@page import="com.factime.servicioweb.Compra"%>
<%@page import="com.factime.servicioweb.Proveedor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.factime.servicioweb.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <title>Compras |Administrador</title>

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
                            <a class="navbar-brand" href="#">COMPRAS /Abastecimiento</a>
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
<fieldset style="height:520px; max-height:650px ;width: 100%;float: left;overflow: auto;border-radius: 10px">
                        <div class="row">

                            <div class="col-md-12">
                                <div class="card">
                                    <div class="header">
                                        <p class="category">Compras</p>
                                    </div>
                                    <div class="content table-responsive table-full-width">

                                        <div class="col-md-3 form-group-sm">
                                            <input placeholder="Buscar..." size="15" maxlength="15" type="search" class="light-table-filter form-control border-input" data-table="order-table" >

                                            <br>
                                        </div>

                                        <input type="submit" name="buscar" class="btn btn-primary btn-group"> 

                                        <a href="IngresarCompra.jsp"><input class='btn btn-info btn-fill btn-wd' name='Compra' value='Nueva Compra' type='submit'></a>

                                    </div>

                                    <div class="content table-responsive table-full-width">
                                        <%

                                            try {

                                                com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
                                                com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();

                                                ArrayList<Compra> arr;

                                                arr = (ArrayList<Compra>) port.loadCompra();
                                                Integer nES = arr.size();

                                                if (nES > 0) {
                                        %>
                                        <table class="table order-table">
                                            <tr>
                                                <th>Factura</th>
                                                <th>Fecha</th>
                                                <th>RUC</th>
                                                <th>Proveedor</th>
                                                <th>Valor Total</th>
                                                <th>Detalles</th>
                                            </tr>


                                            <%
                                                for (int i = 0; i < nES; i++) {

                                                    Proveedor p = new Proveedor();
                                                    Integer val = arr.get(i).getCompraProveedorId();

                                                    p = port.listarProveedor1(val);


                                            %>
                                            <tr>

                                                <td><%=arr.get(i).getCompraNumero()%></td>
                                                <td><%=arr.get(i).getCompraFecha()%></td>
                                                <td><%=p.getProveedorNombre()%></td>
                                                <td><%=p.getProveedorRuc()%></td>
                                                <td><%=arr.get(i).getCompraTotal()%></td>   
                                                <td><a href='DetalleCompra.jsp?fact=<%= arr.get(i).getCompraNumero()%>&idcompra=<%=arr.get(i).getCompraId()%>'><img tittle='ver detalle' alt='ver detalle' src='tema/img/detalle.png' width='30' height='30'></a></td>
                                                        </tr>
                                                        <%}

                                                        %>


                                                        </table>

                                                        <%    }
                                                            } catch (Exception ex) {
                                                            }
                                                        %>

                                                        </div>

                                                        </div>
                                                        <div class="content">

                                                            <div class="footer">

                                                                <hr>
                                                                <div class="stats">
                                                                    <i class="ti-reload"></i> Updated 3 minutes ago
                                                                </div>
                                                            </div>
                                                        </div>
                                                        </div>
                                                        </div>

                    </fieldset>
                                                        </div>


                                                        <footer class="footer">
                                                            <div class="container-fluid">
                                                                <nav class="pull-left">
                                                                    <ul>


                                                                    </ul>
                                                                </nav>
                                                                <div class="copyright pull-right">
                                                                    &copy; <script>document.write(new Date().getFullYear())</script>, made with <i class="fa fa-heart heart"></i> by <a href="http://www.creative-tim.com">MeApp developers</a>
                                                                </div>
                                                            </div>
                                                        </footer>

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

