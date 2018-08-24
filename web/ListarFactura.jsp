<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.factime.servicioweb.Factura"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession(true);

    String strNombreAdministrador = (String) sesion.getAttribute("Nombre");
    String strApellidoAdministrador = (String) sesion.getAttribute("Apellido");
    //String strCedulaUsuario = (String) sesion.getAttribute("cedula");

    HttpSession sesionOk = request.getSession();
    sesionOk.setAttribute("Nombre", strNombreAdministrador);
    sesionOk.setAttribute("Apellido", strApellidoAdministrador);
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
                            <a class="navbar-brand" href="#">FACTURAS/ Detalle</a>
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


                        <div class="col-lg-7 col-md-7">
                            <div class="card">
                                <div class="header">
                                    <h4 class="title">FACTURA</h4>
                                </div>

                                <%
                                    try {

                                        DecimalFormat formato = new DecimalFormat("# 0.00");

                                        Integer num = 0;
                                        String fecha = "";
                                        String telefono = "";
                                        String nombre = "";
                                        String apellido = "";
                                        String cedula = "";
                                        String direccion = "";
                                        Double subtotal=0.0;
                                        Double iva=0.0;
                                        Double total=0.0;
                                        
                                        Integer numfact = Integer.parseInt(request.getParameter("id"));
                                        Integer val = Integer.parseInt(request.getParameter("val"));
                                        com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
                                        com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();

                                        ArrayList<Factura> arr;

                                        arr = (ArrayList<Factura>) port.obtenerFactura(numfact);
                                        Integer nES = arr.size();

                                        if (nES > 0) {

                                            for (int i = 0; i < nES; i++) {
                                                num = Integer.parseInt(arr.get(i).getFacturanumero().toString());
                                                fecha = arr.get(i).getFacturafechacompra();
                                                telefono = arr.get(i).getFacturaclientetelefono();
                                                nombre = arr.get(i).getFacturaclientenombre();
                                                apellido = arr.get(i).getFacturaclienteapellido();
                                                cedula = arr.get(i).getFacturaclientecedula();
                                                direccion = arr.get(i).getFacturaclientedireccion();
                                                subtotal=arr.get(i).getFacturasubtotal();
                                                iva=arr.get(i).getFacturaiva();
                                                total=arr.get(i).getFacturatotal();

                                            }


                                %>
                                <div class="content">
                                    <table class="table table-striped">
                                        <tr>
                                            <th bgcolor="white">
                                        <center><img src='estilos/Login_v2/images/index-logo-2.png' width='160' height='60'>
                                            <b><br>RUC:</b>0992892838001<br><b>Direcci&oacute;n: </b> Ayapamba 0e-54y Gonzol / Ayacucho 2912,<br> Victor Hugo Briones y Gallegos Lara <br> <b>QUITO - GUAYAQUIL</b>
                                        </center>
                                        </th>

                                        <th bgcolor="white">
                                            <p>FACTURA</p><br>

                                            <label>Num:</label><label><%= num%></label><br>
                                            <label>Autorizacion:</label> 

                                        </th>
                                        </tr>
                                    </table>

                                    <table>
                                        <tr>
                                            <th>
                                                <label><b>Fecha:</b></label><label><%= fecha%></label>

                                            </th>
                                            <th>
                                                <b> </b>
                                            </th>
                                            <th>
                                                <label><b>Telefono:</b></label><label><%= telefono%></label>
                                            </th>
                                        </tr>
                                        <tr>
                                            <th colspan="2">
                                                <label><b>Sr:</b></label><label><%= nombre%>  <%= apellido%></label>
                                            </th>
                                        </tr>
                                        <tr>
                                            <th colspan="2">
                                                <label><b>Cedula:  </b><label><%= cedula%></label>
                                            </th>
                                        </tr>
                                        <tr>
                                            <th colspan="2">
                                                <label><b> Direccion:   </b></label><label><%= direccion%></label>
                                            </th>
                                        </tr>
                                      
                                    </table>
                                              
                                    <table class="table order-table" align="center">
                                        <tr bgcolor="#D8D8D8">
                                            <td align="center">CANTIDAD    </td>
                                            <td align="center">DETALLE    </td>
                                            <td align="right">V.UNITARIO    </td>
                                            <td align="right">V.TOTAL    </td>
                                        </tr>
                                        <%
                                            for (int j = 0; j < nES; j++) {

                                        %>
                                        <tr>
                                            <td align="center"><%=arr.get(j).getFacturadetallecantidad()%> </td>
                                            <td align="left" ><%=arr.get(j).getFacturadetalledescripcion()%></td>
                                            <td align="right">$<%=formato.format(arr.get(j).getFacturadetallepreciounitario())%></td>
                                            <td align="right">$<%= formato.format(arr.get(j).getFacturadetallesubtotal())%></td>
                                        </tr>
                                        
                                            <%   }
                                            %>
                                            <tr>
                                            
                                            </tr>
                                            <Br>
                                            <tr>
                                            <td align="right" colspan="3"><b>Sub Total</b></td>
                                            <td align="right">$<%= subtotal%></td>
                                            </tr>
                                        <tr>
                                            <td align="right" colspan="3" ><b>IVA 12% </b></td>
                                            <td align="right">$<%= iva%></td>
                                            </tr>
                                        <tr>
                                            <td align="right" colspan="3"><b>Total</b></td>
                                            <td align="right"><b>$<%= total%></b></td>
                                            </tr>
                                    </table>


                                    <%
                                            }
                                        } catch (Exception ex) {

                                        }
                                    %>


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
    <script src="estilos/paper-dashboard-free-v1.1.2/assets/js/jquery-1.10.2.js" type="text/javascript">


    </script>
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

