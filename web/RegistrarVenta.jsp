<%@page import="org.apache.commons.lang.WordUtils"%>
<%@page import="com.factime.InterfazUsuariosValidacion.ClaseValidacion"%>
<%@page import="com.factime.servicioweb.Factura"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.factime.servicioweb.Cliente"%>

<%@page import="java.lang.Object"%>
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
<script language="JavaScript">




    function AgregarProducto(IdLicor, NombreLicor, Cantidad, PrecioUnit, Stock, numero)
    {
        var NLic = NombreLicor;
        var Resp = BuscarIdRepetido(NombreLicor);
        var Conf = '0';

        if (Resp !== -1)
        {
            NombreLicor = Resp;
            Cantidad = parseInt(Cantidad) + parseInt(document.getElementById(NombreLicor + '3').value);

            if (Cantidad > Stock)
                Conf = '1';
            else
            {
                for (i = 1; i <= 5; i++)
                {
                    Elemento = document.getElementById(NombreLicor + i.toString());
                    padre = Elemento.parentNode;
                    padre.removeChild(Elemento);
                }
            }
        }

        if (Conf === '0')
        {
            var ChkEliminar = document.createElement('input');
            ChkEliminar.type = 'checkbox';
            ChkEliminar.id = NombreLicor + '1';
            ChkEliminar.name = NombreLicor + '1';
            ChkEliminar.value = IdLicor;

            document.getElementById('FormPedido').appendChild(ChkEliminar);

            document.getElementById(NombreLicor + '1').onclick = function EliminarProducto()
            {
                var Total = document.getElementById('total').value;
                Total = parseFloat(Total.substring(1, Total.length));
                var Nom = document.getElementById(NombreLicor + '5').value;
                document.getElementById('total').value = '$' + (parseFloat(Total) - parseFloat(Nom.substring(1, Nom.length))).toFixed(2);


                for (i = 1; i <= 5; i++)
                {
                    Elemento = document.getElementById(NombreLicor + i.toString());
                    padre = Elemento.parentNode;
                    padre.removeChild(Elemento);
                }
            };

            document.getElementById(NombreLicor + '1').checked = 1;



            var InputNombreL = document.createElement('input');
            InputNombreL.type = 'text';
            InputNombreL.id = NombreLicor + '2';
            InputNombreL.name = NombreLicor + '2';
            InputNombreL.value = NLic;
            InputNombreL.size=50;


            document.getElementById('FormPedido').appendChild(InputNombreL);
            document.getElementById(NombreLicor + '2').style.width = '127px';
            document.getElementById(NombreLicor + '2').style.fontSize = '12px';
            document.getElementById(NombreLicor + '2').disabled = true;


            var InputCantidad = document.createElement('input');
            InputCantidad.type = 'text';
            InputCantidad.id = NombreLicor + '3';
            InputCantidad.name = NombreLicor + '3';
            InputCantidad.value = Cantidad;


            document.getElementById('FormPedido').appendChild(InputCantidad);
            document.getElementById(NombreLicor + '3').style.width = '35px';
            document.getElementById(NombreLicor + '3').style.fontSize = '12px';
            if (numero === 1)
            {
                document.getElementById(NombreLicor + '3').disabled = true;
            } else {
                document.getElementById(NombreLicor + '3').disabled = false;
            }


            var InputPrecio = document.createElement('input');
            InputPrecio.type = 'text';
            InputPrecio.id = NombreLicor + '4';
            InputPrecio.name = NombreLicor + '4';
            InputPrecio.value = '$' + PrecioUnit.toFixed(2);



            document.getElementById('FormPedido').appendChild(InputPrecio);
            document.getElementById(NombreLicor + '4').style.width = '40px';
            document.getElementById(NombreLicor + '4').style.fontSize = '12px';
            if (numero === 1)
            {
                document.getElementById(NombreLicor + '4').disabled = true;
            } else {
                document.getElementById(NombreLicor + '4').disabled = false;
            }



            var InputSubT = document.createElement('input');
            InputSubT.type = 'text';
            InputSubT.id = NombreLicor + '5';
            InputSubT.name = NombreLicor + '5';

            if (numero === 1)
            {
                InputSubT.value = '$' + (Cantidad * PrecioUnit).toFixed(2);
            } else
            {
                InputSubT.value = '$0.0';
            }


            document.getElementById('FormPedido').appendChild(InputSubT);
            document.getElementById(NombreLicor + '5').style.width = '60px';
            document.getElementById(NombreLicor + '5').style.fontSize = '12px';
            document.getElementById(NombreLicor + '5').disabled = true;

            if (numero === 1)
                ObtenerTotal();
        } else
            alert("Advertencia: No se puede exceder el valor del stock disponible.!!");
    }


    function BuscarIdRepetido(NombreL)
    {
        var formulario = document.getElementById("FormPedido");
        for (i = 0; i < formulario.elements.length; i++)
        {
            var Id = formulario.elements[i].id + '1';
            var Ind = Id.indexOf(NombreL);
            if (Ind !== -1)
            {
                return NombreL;
            }
        }
        return -1;
    }

    function HabilitarInputs()
    {
        var formulario = document.getElementById("FormPedido");
        for (i = 0; i < formulario.elements.length; i++)
        {
            var Sub = formulario.elements[i].id.slice(-1);

            if (Sub === '2' || Sub === '3' || Sub === '4' || Sub === '5' || Sub === 'l')
                formulario.elements[i].disabled = false;
        }
        document.getElementById('FormPedido').submit();
    }

    function CalcularSubtotales()
    {
        var formulario = document.getElementById("FormPedido");
        var NumElems = formulario.elements.length - 1;
        var Precio;
        var Cantidad;
        var error = false;
        if (NumElems > 0)
        {
            for (i = 0; i < (formulario.elements.length - 1); i = i + 5)
            {
                Precio = formulario.elements[i + 2].value;
                Cantidad = formulario.elements[i + 3].value.substring(1, formulario.elements[i + 3].value.length);

                if (Cantidad === "")
                {
                    error = true;
                    i = NumElems
                } else
                {
                    var Id = formulario.elements[i + 4].id;
                    document.getElementById(Id).value = "$" + (parseFloat(Precio) * parseFloat(Cantidad)).toFixed(2);
                }
            }
            if (error === false)
            {
                ObtenerTotal();
                document.getElementById('generar_notaventa').disabled = false;
                document.getElementById('guardar_como_pedido').disabled = false;
            }
        }
    }
    function soloNumeros(e)
    {
        key = e.keyCode || e.which;
        tecla = String.fromCharCode(key).toLowerCase();
        letras = "0123456789";
        especiales = [9, 11, 8, 13];

        //58 : 9,11 tab 127 del 8 retroceso 13 enter
        tecla_especial = false;
        for (var i in especiales)
        {
            if (key === especiales[i])
            {
                tecla_especial = true;
                break;
            }
        }

        if (letras.indexOf(tecla) === -1 && !tecla_especial)
        {
            return false;
        }

    }


    function ObtenerTotal()
    {
        var sAux = "";
        var Iva=0.12;
        var TotalVenta=0.0;
        var ValorIva=0.0;
        var Suma = parseFloat(0.0);

        var formulario = document.getElementById("FormPedido");
        for (i = 0; i < formulario.elements.length; i++)
        {
            var Sub = formulario.elements[i].id.slice(-1);

            if (Sub === '5')
            {
                var ct = formulario.elements[i].value;
                Suma = parseFloat(Suma) + parseFloat(ct.substring(1, ct.length));
            }

        }
        ValorIva=Suma*Iva;
        TotalVenta=Suma+ValorIva;
        
        
         document.getElementById('total').value = '$' + (parseFloat(Suma)).toFixed(2);
         document.getElementById('iva').value = '$' + (parseFloat(ValorIva)).toFixed(2);
         document.getElementById('totalventa').value = '$' + (parseFloat(TotalVenta)).toFixed(2);
    }
</script>

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

        <title>Factime |Clientes Administrador</title>

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



                            <div class="col-md-8">
                                <div class="card">

                                    <div class="content table-responsive table-full-width">

                                        <form action="" method="post">                                                                                                                               
                                            <div class="col-md-5 form-group-sm">

                                                <input name="cedula" placeholder="Cedula..." size="10" maxlength="10" type="search" class="form-control border-input" required="">

                                            </div>
                                            <input type="submit" name="buscar" class="btn btn-primary btn-group">
                                        </form>

                                        <%                      String c = request.getParameter("cedula");
                                                com.factime.ln.ws.FactimeLogicaNegocio_Service service = new com.factime.ln.ws.FactimeLogicaNegocio_Service();
                                                com.factime.ln.ws.FactimeLogicaNegocio port = service.getFactimeLogicaNegocioPort();
                                                
                                            Factura numfac=new Factura();
                                            numfac=port.numeroFactura();
                                            
                                            Integer num=numfac.getFacturanumero();
                                            num=num+1;
                                        %>

                                    </div>

                                </div>
                            </div>



                            <!--Agregar cliente-->
                            <div class="col-md-4">

                                <br>
                                <form action="BuscarClientes.jsp" method="post">                                                                                                                               
                                    <input class='btn btn-info btn-fill btn-wd' name=Registro' value='Registrar Cliente' type='submit'><br><br>
                                </form>

                            </div>




                            <div class="col-lg-6 col-md-6">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">FACTURA</h4>
                                    </div>
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




                                        <%
                                            try {

                                                Cliente cl = new Cliente();
                                                
                                                cl = port.listarCliente(c);

                                                Date ahora = new Date();
                                                SimpleDateFormat formateador = new SimpleDateFormat("dd-MM-yyyy");
                                                String strDate = formateador.format(ahora);

                                        %>
                                        <table>
                                            <tr>
                                                <th>
                                                    <label><b>Fecha:</b></label><label><%= strDate%></label>

                                                </th>
                                                <th>
                                                    <b> </b>
                                                </th>
                                                <th>
                                                    <label><b>Telefono:</b></label><label></label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th colspan="2">
                                                    <label><b>Sr:</b></label><label><%=cl.getClienteNombre().toString()%>  <%=cl.getClienteApellido().toString()%></label></th>
                                            </tr>
                                            <tr>
                                                <th colspan="2">
                                                    <label><b>Cedula:  </b><label><%=cl.getClienteCedula().toString()%></label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th colspan="2">
                                                    <label><b> Direccion:   </b></label><label><%=cl.getClienteDireccion().toString()%></label>
                                                </th>
                                            </tr>
                                        </table>



                                        <fieldset style="max-height:400px ;width: 3000px;height: auto; padding: 0px;float: left;border-radius: 6px">
                                            <fieldset style="max-height:400px ;width: 300px;height: 597px; padding: 1px;float: left;background-color: #A8AB98;">

                                                <fieldset style="width: 280px; min-height: 300px; padding: 0px;background-color: #e1e5d3;">
                                                    <input   style="background: white ;" type="text" value="      |Descripci&oacute;n |   Cant    |  P. Unit    |  SubT" size="38%" disabled=>
                                                    <form id='FormPedido' name='FormPedido' action="ControladorVenta.jsp?cliente=<%=cl.getClienteCedula().toString()%>" method="post">

                                                    </form><br>
                                                </fieldset>

                                                <fieldset style="width: 280px;height: 35px; padding: 0px;background-color:#9ad3c8">
                                                    SUBTOTAL : <input id='total' name='total' form='FormPedido' style="margin-left: 20%" type="text" value="$0.00" size="8" disabled>                            

                                                </fieldset> 
                                                <fieldset style="width: 280px;height: 35px; padding: 0px;background-color:#9ad3c8">
                                                    TOTAL IVA : <input id='iva' name='iva' form='FormPedido' style="margin-left: 20%" type="text" value="$0.00" size="8" disabled>                            

                                                </fieldset> 
                                                    <fieldset style="width: 280px;height: 35px; padding: 0px;background-color:#9ad3c8">
                                                    VALOR TOTAL    : <input id='totalventa' name='totalventa' form='FormPedido' style="margin-left: 20%" type="text" value="$0.00" size="8" disabled>                            

                                                </fieldset> 
                                                <br><button  style="font-size: 20px;width: 100%;" onclick="HabilitarInputs()" >REALIZAR VENTA</button>
                                            </fieldset>

                                        </fieldset>


                                    </div>

                                </div>
                            </div>

                            <!-- FACTURAS-->

                            <div class="col-lg-6 col-md-6">
                                <fieldset style="height:600px; width: 100%;float: left;overflow: auto;border-radius: 10px">
                                    <div class="card">
                                        <div class="header">
                                            <h4 class="title">Productos</h4>
                                        </div>

                                        <div class="content table-responsive table-full-width">

                                            <form action="" method="post">                                                                                                                               
                                                <div class="col-md-3 form-group-sm">
                                                    <input placeholder="Buscar..." size="15" maxlength="15" type="search" class="light-table-filter form-control border-input" data-table="order-table" >

                                                    <br>
                                                </div>
                                                <input type="submit" name="buscar" class="btn btn-primary btn-group">
                                            </form>                        

                                        </div>
                                        <div class="content">



                                            <table class="table order-table">
                                                <tr>
                                                    <th>Codigo</th>
                                                    <th>Descripcion</th>
                                                    <th>Stock</th>
                                                    <th>Precio</th>
                                                    <th>Agregar</th>
                                                </tr>

                                                <%
                                                    ArrayList<Producto> arr;
                                                     ClaseValidacion cv=new ClaseValidacion();
                                                    arr = (ArrayList<Producto>) port.loadProductos();
                                                    Integer nES = arr.size();

                                                    String result;
                                                    String marcas = port.listarMarcas();
                                                    String procedencias = port.listarProcedencias();

                                                    for (int i = 0; i <= nES; i++) {
                                                        Integer stock = arr.get(i).getProductoStock();
                                                
                                                       
                                                 out.println("<tr>");

                                                    out.println("<td>");
                                                        out.println(arr.get(i).getProductoCodigo());
                                                    out.println("</td>");
                                                    out.println("<td>");
                                                             out.println(arr.get(i).getProductoDescripcion());
                                                   out.println("</td>");
                                                   out.println("<td>");
                                                            out.println("<select id='" + "s" + String.valueOf(i) + "' required>");
                                                            out.println((stock == 0) ? "<option value='0'>0</option>" : cv.LlenarSelectCarroCompras(stock));
                                                            out.println("</select>");
                                        
                                                    out.println("</td>");                                                            
                                                    out.println("<td>");
                                                             out.println(arr.get(i).getProductoPrecioUnitario());
                                                    out.println("</td>");
                                                    out.println("<td>");
                                                       out.println("<fieldset>");
                                                           out.println("<input type='hidden' id='" + String.valueOf(i) + "' value='" + WordUtils.capitalizeFully(arr.get(i).getProductoDescripcion().toLowerCase()) + "'>");
                                                            String Btn = (arr.get(i).getProductoStock() > 0) ? "AgregarProducto(" + arr.get(i).getProductoId() + ",document.getElementById('" + String.valueOf(i) +"').value,document.getElementById('" + "s" + String.valueOf(i) +  "').value," +arr.get(i).getProductoPrecioUnitario()+ "," + arr.get(i).getProductoStock() + ",1)" : "";

                                                            String Deshabiitar = ((arr.get(i).getProductoStock() == 0) ? "disabled" : "");
                                                            out.println("<input style='cursor:pointer;' type='button' value='Agregar'  style='width:93% ;font-size: 11px' onclick=\"" + Btn + "\" " + Deshabiitar + ">");
                                                          out.println("</fieldset>");
                                            out.println("</td>");

                                                out.println("</tr>");

                                                
                                                    }
                                                %>


                                            </table>


                                            </fieldset>

                                            <%
                                                } catch (Exception ex) {
                                                    // TODO handle custom exceptions here
                                                }


                                            %>

                                        </div>

                                    </div>
                            </div>



                        </div>
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
</script>
