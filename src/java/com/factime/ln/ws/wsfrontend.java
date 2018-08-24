/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.factime.ln.ws;

import com.factime.servicioweb.FactimeAccesoDatos_Service;
import com.factime.servicioweb.Imagen;
import com.factime.servicioweb.Procedencia;
import com.factime.servicioweb.Producto;
import java.util.ArrayList;
import java.util.List;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.xml.ws.WebServiceRef;

/**
 *
 * @author Paul Mamarandi
 */
@WebService(serviceName = "wsfrontend")
public class wsfrontend {

    @WebServiceRef(wsdlLocation = "WEB-INF/wsdl/localhost_8080/iejsaAD/factimeAccesoDatos.wsdl")
    private FactimeAccesoDatos_Service service;
    private Exception error;

    /**
     * This is a sample web service operation
     */
    @WebMethod(operationName = "listarLineas")
    public String listarProced() {
        String result = "<select  name='linea' id=\"agileinfo-nav_search\"> ";
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<Procedencia> arr = (ArrayList) port.listarProcedencias();
        Integer nMarcas = arr.size();
        for (Integer i = 0; i < nMarcas; i++) {
            Procedencia oMarca = arr.get(i);
            result += "<option  value=" + oMarca.getProductoProcedenciaId() + ">" + oMarca.getProductoProcedenciaDescripcion() + "</option>";
        }
        result += "</select>";
        return result;
    }

    @WebMethod(operationName = "listarLineasmenu")
    public String listarProcedmenu(String aut, String nombre, String apellido) {
        String result = "<div class=\"collapse navbar-collapse menu--shylock\" id=\"bs-example-navbar-collapse-1\"> ";
        result += "<ul class=\"nav navbar-nav menu__list\"> ";
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<Procedencia> arr = (ArrayList) port.listarProcedencias();
        Integer nMarcas = arr.size();
        for (Integer i = 0; i < 6; i++) {
            Procedencia oMarca = arr.get(i);
            result += "<li class=\"active\">";
            result += "<a href='productos.jsp?op=" + oMarca.getProductoProcedenciaDescripcion() + "&aut=" + aut + "&nombre=" + nombre + "&apellido=" + apellido + "'>" + oMarca.getProductoProcedenciaDescripcion() + "";
            //result += "<span class=\"sr-only\">(current)</span>";
            result += "</a></li>";
        }

        result += "<li class=\"dropdown\"> ";
        result += "<a class=\"nav-stylehead dropdown-toggle\" href=\"#\" data-toggle=\"dropdown\">Mas ";
        result += "<b class=\"caret\"></b></a>";
        result += "<ul class=\"dropdown-menu agile_short_dropdown\">";
        for (Integer j = 6; j < nMarcas; j++) {
            Procedencia oMarca = arr.get(j);
            result += "<li>";
            result += "<a  href=\"productos.jsp?op=" + oMarca.getProductoProcedenciaDescripcion() + "\">" + oMarca.getProductoProcedenciaDescripcion() + "";
            //result += "<span class=\"sr-only\">(current)</span>";
            result += "</a></li>";
        }
        result += "</ul>";
        result += "</ul></div>";
        return result;
    }

    @WebMethod(operationName = "ProductoMostrar")
    public String ProductoMostrar(@WebParam(name = "Busqueda") String Busqueda, String aut, String nombre, String apellido) {
        String resul = "";
        String imglink = "";
        String imglink1 = "";
        String imglink2 = "";
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();

        ArrayList<Producto> arr = (ArrayList) port.buscarProducto(Busqueda);
        Integer nEs = arr.size();
        if ("all".equals(Busqueda.toLowerCase()) || "todo".equals(Busqueda.toLowerCase()) || "todos".equals(Busqueda.toLowerCase())) {
            //resul += this.Productos(); 
        } else {
            if (nEs != 0) {
                //resul += this.getProductosModificarTable();
            }
            if (nEs == 0) {
                resul += "<font color='red'>Datos no encontrados</font>";
            }
            for (int i = 0; i < nEs; i++) {
                ;
                Producto p = arr.get(i);
                resul += "<div class=\"col-md-4 product-men\">\n";

                resul += "<div class=\"men-pro-item simpleCart_shelfItem\">\n"
                        + "                                                                       <div class=\"men-thumb-item\">\n";
                String ArrayList;
                ArrayList<Imagen> im = (ArrayList) port.buscarImagen(p.getProductoCodigo(), 0);
                List<Imagen> im1 = port.buscarImagen(p.getProductoCodigo(), 1);
                List<Imagen> im2 = port.buscarImagen(p.getProductoCodigo(), 2);
                if (im1.isEmpty()) {
                    imglink1 = "";
                } else {
                    Imagen img1 = im1.get(0);
                    imglink1 = img1.getNombre();
                }
                if (im2.isEmpty()) {
                    imglink2 = "";
                } else {
                    Imagen img2 = im2.get(0);
                    imglink2 = img2.getNombre();
                }

                for (Integer h = 0; h < 1; h++) {
                    if (im.isEmpty()) {
                        resul += "<img src='images/m1.jpg' width='120' height='120'>";

                    } else {
                        Imagen img = im.get(h);

                        resul += "<img src='" + img.getNombre() + "' width='120' height='120'/>";
                        imglink = img.getNombre();
                    }
                }
                resul += "<div class=\"men-cart-pro\">"
                        + "										<div class=\"inner-men-cart-pro\">\n"
                        + "											<a href=\"single.jsp?tipo=" + p.getTipo() + "&detalle=" + p.getProductoDescripcion() + "&precio=" + p.getProductoPrecioUnitario() + "&img=" + imglink + "&img1=" + imglink1 + "&img2=" + imglink2 + "&texto=" + p.getTexto() + "&aut=" + aut + "&nombre=" + nombre + "&apellido=" + apellido + "\" class=\"link-product-add-cart\">Detalle</a>\n"
                        + "										</div>\n"
                        + "									</div>\n"
                        + "									<span class=\"product-new-top\">New</span>\n"
                        + "								</div>\n"
                        + "								<div class=\"item-info-product \">\n"
                        + "									<h4>";
                resul += "<a href=\"single.html\">" + p.getProductoDescripcion() + "</a>";
                resul += "</h4>";
                resul += "<div class=\"info-product-price\">";
                resul += "<span class=\"item_price\">$ " + p.getProductoPrecioUnitario() + "</span>";
                resul += "<del>$280.00</del>";
                resul += "</div><div class=\"snipcart-details top_brand_home_details item_add single-item hvr-outline-out\">";
                if (aut.equalsIgnoreCase("ok")) {
                    //

                    resul += "										<form action='ControladorIngresarDetalleFactura.jsp'   method=\"post\">\n"
                            + "											<fieldset>\n"
                            + "                                                                                          <input type=\"hidden\" name=\"aut\" value='" + aut + "'  readonly='readonly'>\n"
                            + "                                                                                          <input type=\"hidden\" name=\"nombre\" value='" + nombre + "' size=\"5\" readonly='readonly'>\n"
                            + "                                                                                          <input type=\"hidden\" name=\"apellido\" value='" + apellido + "' size=\"5\" readonly='readonly'>\n"
                            + "                                                                                          <input type=\"hidden\" name=\"idproducto\" value='" + p.getProductoId() + "' size=\"5\" readonly='readonly'>\n"
                            + "                                                                    <input type=\"hidden\" name=\"codproducto\" value='" + p.getProductoCodigo() + "' size=\"5\" readonly='readonly'>\n"
                            + "                                                                   <input type=\"hidden\" name=\"codigo1\" value=0>\n"
                            + "                <input type=\"hidden\" name=\"descripcion\" value='" + p.getProductoDescripcion() + "' size=\"30\" readonly='readonly'>\n"
                            + "                <input type=\"hidden\" name=\"precio\" value='" + p.getProductoPrecioUnitario() + "' size=\"30\" readonly='readonly'>\n"
                            + "                 <input type=\"hidden\" name=\"cantidad\" value='1' size=\"30\" readonly='readonly'>\n"
                            + "												<input type=\"hidden\" name=\"return\" value=\" \" />\n"
                            + "												<input type=\"hidden\" name=\"cancel_return\" value=\" \" />\n"
                            + "												<input type=\"submit\" name=\"submit\" value=\"Añadir"
                            + "\" class=\"button\" />\n"
                            + "											</fieldset>\n"
                            + "										</form>";
                } else {
                    resul += "<input type=\"submit\" name=\"submit\" value=\"Añadir\" class=\"button\" onclick=\"document.getElementById('ing').style.display='block'\">";

                }

                //
                resul += "									</div>\n"
                        + "\n"
                        + "								</div>\n"
                        + "							</div>\n";
                resul += "</div>";
            }

        }
        return resul;
    }

    //mostar solo boton single
    @WebMethod(operationName = "ProductoMostrarSingle")
    public String ProductoMostrarSingle(@WebParam(name = "Busqueda") String Busqueda, String aut, String nombre, String apellido) {
        String resul = "";
        String imglink = "";
        String imglink1 = "";
        String imglink2 = "";
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();

        ArrayList<Producto> arr = (ArrayList) port.buscarProducto(Busqueda);
        Integer nEs = arr.size();
        if ("all".equals(Busqueda.toLowerCase()) || "todo".equals(Busqueda.toLowerCase()) || "todos".equals(Busqueda.toLowerCase())) {
            //resul += this.Productos(); por
        } else {
            if (nEs != 0) {
                //resul += this.getProductosModificarTable();
            }
            if (nEs == 0) {
                resul += "<font color='red'>Datos no encontrados</font>";
            }
            for (int i = 0; i < nEs; i++) {
                Producto p = arr.get(i);

                if (aut.equalsIgnoreCase("ok")) {
                    //

                    resul += "										<form action='ControladorIngresarDetalleFactura.jsp'   method=\"post\">\n"
                            + "											<fieldset>\n"
                            + "                                                                                          <input type=\"hidden\" name=\"aut\" value='" + aut + "' size=\"5\" readonly='readonly'>\n"
                            + "                                                                                          <input type=\"hidden\" name=\"nombre\" value='" + nombre + "' size=\"5\" readonly='readonly'>\n"
                            + "                                                                                          <input type=\"hidden\" name=\"apellido\" value='" + apellido + "' size=\"5\" readonly='readonly'>\n"
                            + "                                                                                          <input type=\"hidden\" name=\"idproducto\" value='" + p.getProductoId() + "' size=\"5\" readonly='readonly'>\n"
                            + "                                                                    <input type=\"hidden\" name=\"codproducto\" value='" + p.getProductoCodigo() + "' size=\"5\" readonly='readonly'>\n"
                            + "                                                                   <input type=\"hidden\" name=\"codigo1\" value=0>\n"
                            + "                <input type=\"hidden\" name=\"descripcion\" value='" + p.getProductoDescripcion() + "' size=\"30\" readonly='readonly'>\n"
                            + "                <input type=\"hidden\" name=\"precio\" value='" + p.getProductoPrecioUnitario() + "' size=\"30\" readonly='readonly'>\n"
                            + "                 <input type=\"hidden\" name=\"cantidad\" value='1' size=\"30\" readonly='readonly'>\n"
                            + "												<input type=\"hidden\" name=\"return\" value=\" \" />\n"
                            + "												<input type=\"hidden\" name=\"cancel_return\" value=\" \" />\n"
                            + "												<input type=\"submit\" name=\"submit\" value=\"Añadir"
                            + "\" class=\"button\" />\n"
                            + "											</fieldset>\n"
                            + "										</form>";
                } else {
                    resul += "<input type=\"submit\" name=\"submit\" value=\"Añadir\" class=\"button\" onclick=\"document.getElementById('ing').style.display='block'\">";

                }

            }

        }
        return resul;
    }

}
