<%-- 
    Document   : XML
    Created on : 14/02/2016, 0:12:26
    Author     : paul
--%>

<%@page import="javax.xml.transform.TransformerException"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.util.logging.Level"%>
<%@page import="com.factime.servicioweb.Producto"%>
<%@page import="javax.xml.parsers.ParserConfigurationException"%>
<%@page import="org.jespxml.JespXML"%>
<%@page import="org.jespxml.modelo.Encoding"%>
<%@page import="java.io.File"%>
<%@page import="org.jespxml.modelo.Atributo"%>
<%@page import="org.jespxml.modelo.Tag"%>
<%@page import="java.util.List"%>
<%@page import="com.Bicirepuestos.ReferenceLogicaNegocio.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        List<Producto> Productos;
        
    com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service service = new com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio_Service();
        com.Bicirepuestos.ReferenceLogicaNegocio.BicirepuestosLogicaNegocio port = service.getBicirepuestosLogicaNegocioPort();
        Productos = port.listarProductosGINO();  
        
    Tag raiz = new Tag("Productos");
 
    Integer nProductos = Productos.size();
        for(Integer i = 0; i < nProductos; i++)
        {
            Producto oProducto = Productos.get(i);
            Tag producto = new Tag("Producto");
            raiz.addTagHijo(producto);
            producto.addAtributo(new Atributo("id",i.toString()));
            Tag codigo = new Tag("Codigo");
            producto.addTagHijo(codigo);
            codigo.addContenido(oProducto.getProductoCodigo());
            Tag descripcion = new Tag("Descripcion");
            producto.addTagHijo(descripcion);
            descripcion.addContenido(oProducto.getProductoDescripcion());
            Tag marca = new Tag("Marca");
            producto.addTagHijo(marca);
            marca.addContenido(oProducto.getProductoMarcaDescripcion());
            Tag procedencia = new Tag("Procedencia");
            producto.addTagHijo(procedencia);
            procedencia.addContenido(oProducto.getProductoProcedenciaDescripcion());
            Tag stock = new Tag("Stock");
            producto.addTagHijo(stock);
            stock.addContenido(oProducto.getProductoStock().toString());
            Tag precio = new Tag("Precio");
            producto.addTagHijo(precio);
            precio.addContenido(oProducto.getProductoPrecioUnitario().toString());
        }    
//    raiz.addAtributo(new Atributo("cantidad", "1"));
//    Tag libro = new Tag("libro");
//    //libro.addAtributo(new Atributo("paginas","100"));
//    Tag titulo;
//    Tag autor;
//    titulo = new Tag("titulo");
//    autor = new Tag("autor");
//    titulo.addContenido("Libro accion 1");
//    autor.addContenido("autor action");
//    raiz.addComentario(new Comentario("Comentario de la biblioteca"));
    //raiz.addTagHijo(libro);
//    libro.addTagHijo(titulo);
//    libro.addTagHijo(autor);
    
    JespXML xml = new JespXML(new File("C://Users//monse//Desktop//Proyecto Iteracion 10//BicirepuestosInterfazUsuario//Productos.xml"),Encoding.UTF_8);
            xml.escribirXML(raiz);  
            response.sendRedirect("ListarModificarProducto.jsp?txtparametro='all'");
            
        %>
    </body>
</html>