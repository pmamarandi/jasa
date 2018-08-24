<%-- 
    Document   : indexAdministrador
    Created on : 02-08/2018, 12:22:08
    Author     : Yesenia
--%>

<%@page import="com.factime.servicioweb.CompraProducto"%>
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

                        <div class="row">

                            <div class="col-md-8">
                                <div class="card">
                                    <div class="header">
                                        <p class="category">Detalle Compras</p>
                                    </div>
                                    <div class="content table-responsive table-full-width">

                                        <%

                                            try {
                                                ArrayList<CompraProducto> arr;

                                                Integer idcom = Integer.parseInt(request.getParameter("idcompra"));
                                                Integer numfact = Integer.parseInt(request.getParameter("fact"));

                                                com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
                                                com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
                                                arr = (ArrayList<CompraProducto>) port.facturaCompraDetalles(numfact, idcom);
                                                Integer nES = arr.size();

                                                if (nES > 0) {
                                                    int i = 1;


                                        %>

                                        <table>
                                            <tr>
                                                <th>
                                                     <label><b>Fecha Compra:</b></label> <label><%=arr.get(i).getCompraNumero()%></label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <label><b>Fecha Compra:</b></label> <label><%= arr.get(i).getFecha()%></label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <label><b>Proveedor:</b></label> <label><%= arr.get(i).getNombreproveedor()%></label>
                                                </th>
                                            </tr>
                                             <tr>
                                                <th>
                                                    <label><b>Ruc Proveedor:</b></label> <label><%= arr.get(i).getRuc()%></label>
                                                </th>
                                            </tr>
                                        </table>
                                                
                                        <table class="table order-table">
                                            <tr bgcolor="#D8D8D8">
                                                <th>CANTIDAD</th>
                                                <th>DESCRIPCION PRODUCTO</th>
                                                <th>V.UNITARIO</th>
                                                <th>V.TOTAL</th>
                                            </tr>
                                            <%
                                                for (int j = 0; j < nES; j++) {

                                            %>
                                            <tr>
                                                <td><%=arr.get(j).getCantidad()%></td>
                                                <td><%=arr.get(j).getDetallenombreproducto()%></td>
                                                <td><%=arr.get(j).getPrecioUnitario()%></td>
                                                <td><%=arr.get(j).getTotal()%></td>
                                            </tr>
                                            
                                            <%
                                                }
                                            %>

                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td><b>Subtotal:</b></td>
                                                <td><b><%=arr.get(i).getSubtotal()%></b></td>
                                            </tr><tr>
                                                <td></td>
                                                <td></td>
                                                <td><b>Iva :</b></td>
                                                <td><b><%=arr.get(i).getIva()%></b></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td><b>Total:</b></td>
                                                <td><b><%=arr.get(i).getTotalAbastece()%></b></td>
                                            </tr>
                                        </table>


                                        <%}
                                            } catch (Exception ex) {
                                                // TODO handle custom exceptions here
                                            }
                                        %>



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
