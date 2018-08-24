/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.factime.ln.ws;

import com.factime.servicioweb.FactimeAccesoDatos_Service;
import com.factime.servicioweb.Cliente;
import com.factime.servicioweb.Marca;
import com.factime.servicioweb.Gasto;
import com.factime.servicioweb.Procedencia;
import com.factime.servicioweb.Producto;
import com.factime.servicioweb.ClienteFactura;
import com.factime.servicioweb.Compra;
import com.factime.servicioweb.DetalleFactura;
import com.factime.servicioweb.Empleado;
import com.factime.servicioweb.Factura;
import com.factime.servicioweb.FacturaAbastece;
import com.factime.servicioweb.CompraProducto;
import com.factime.servicioweb.Imagen;
import com.factime.servicioweb.Proveedor;
import com.factime.servicioweb.ProveedorFacturaAbastece;
import com.factime.servicioweb.TelefonoPersona;
import com.factime.servicioweb.TelefonoProveedor;
import com.factime.servicioweb.Venta;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.xml.ws.WebServiceRef;

/**
 *
 * @author ProgramadorCrediFast
 */
@WebService(serviceName = "factimeLogicaNegocio")
public class factimeLogicaNegocio {
    @WebServiceRef(wsdlLocation = "WEB-INF/wsdl/localhost_8080/iejsaAD/factimeAccesoDatos.wsdl")        
    private FactimeAccesoDatos_Service service;
        private Exception error;
    

    @WebMethod(operationName = "ListarClientes")
    public String getListarClientes(){
        String result = "<table align='center' border='1'>";
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<Cliente> arr = (ArrayList) port.getClientes();
        Integer nEs = arr.size();
        for(Integer i = 0; i < nEs; i++)
        {
            Cliente e = arr.get(i);
            result += "<tr>";
            result += "<td>" + i.toString() + "</td>";
            result += "<td>" + e.getClienteId() + "</td>";
            result += "<td>" + e.getClienteCedula() + "</td>";
            result += "<td>" + e.getClienteNombre() + "</td>";
            result += "<td>" + e.getClienteApellido() + "</td>";
            result += "<td>" + e.getClienteDireccion() + "</td>";
            result += "<td><a href='index.jsp?clienteid="+e.getClienteId()+"'>Editar</a></td>";
            result += "</tr>";
        }
       result += "</table><br>";
       return result;
    }
    
    
    
    //MOSTRAR DATOS DEL CLIENTE DADO SU NUMERO DE CEDULA
    @WebMethod(operationName = "listarCliente")
    public Cliente listarCliente(@WebParam String strClienteCedula){
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        return port.listarCliente(strClienteCedula);
    }
    
    //listar proveedor
      @WebMethod(operationName = "listarProveedor1")
    public Proveedor listarProveedor1(@WebParam Integer id){
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        return port.listarProveedor1(id);   
    }
    
    @WebMethod(operationName = "autenticacionCliente")
    public Cliente autenticacionCliente(Cliente oCliente){
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        Cliente oCliente1 = port.autenticacionCliente(oCliente);
        return oCliente1;
    }
    
    @WebMethod(operationName = "autenticacionEmpleado")
    public Empleado autenticacionEmpleado(Empleado oEmpleado){
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        Empleado oEmpleado1 = port.autenticacionEmpleado(oEmpleado);
        return oEmpleado1;
    }
    
    @WebMethod(operationName = "ingresarCliente")
    public String ingresarCliente(Cliente oCliente){
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        String strResult = port.ingresarCliente(oCliente);
        return strResult;
    }
    
    @WebMethod(operationName = "buscarClientes")
    public String buscarClientes(String strClientesPalabra){
        String strResult = "<table align='center' border='1'>";
    com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
    ArrayList<Cliente> arr = (ArrayList) port.buscarClientes(strClientesPalabra);
    
    Integer nEs = arr.size();   
        for(Integer i = 0; i < nEs; i++)
        {
            Cliente oCliente = arr.get(i);
            strResult += "<tr>";
            strResult += "<td>" + oCliente.getClienteId() + "</td>";
            strResult += "<td>" + oCliente.getClienteCedula() + "</td>";
            strResult += "<td>" + oCliente.getClienteNombre() + "</td>";
            strResult += "<td>" + oCliente.getClienteApellido() + "</td>";
            strResult += "<td>" + oCliente.getClienteDireccion() + "</td>";
            strResult += "<td>" + oCliente.getClienteNumeroCompras() + "</td>";
            strResult += "<td><a href='ModificarClientes.jsp?clienteid="+oCliente.getClienteId()+"'>Editar</a></td>";
            strResult += "<td><a href='EliminarClientes.jsp?clienteid="+oCliente.getClienteId()+"'>Eliminar</a></td>";
            strResult += "</tr>";
        }
       strResult += "</table><br>";
       return strResult;
    }
    
    @WebMethod(operationName = "modificarCliente")
    public String modificarCliente(Cliente oCliente)
    {
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        return port.modificarCliente(oCliente);
    }
    
    @WebMethod(operationName = "listarEmpleado")
    public String listarEmpleado(String strEmpleadoCedula){
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        Empleado oEmpleado = port.listarEmpleado(strEmpleadoCedula);
        
        TelefonoPersona oTelefonoPersona = port.listarTelefonoPersona(strEmpleadoCedula);
            String strResult = "<div class='caja web-45 movil-40 derecha-contenido'  id='stylized'>";
           
            strResult += "<label>C&eacute;dula</label><br>";
            strResult += "<label>Nombre</label><br>";
            strResult += "<label>Apellido</label><br>";
            strResult += "<label>Direcci&oacute;n</label><br>";
            strResult += "<label>Tel&eacute;fono</label><br>";
            strResult += "<label>Fecha de Ingreso</label><br>";
            strResult += "<label>Contrase&ntilde;a</label><br>";
            strResult += "<label>Sueldo</label><br>";
        strResult += "</div>";
        strResult += "<div class='caja web-55 movil-60 izquierda-contenido'  id='stylized'>";
        
        DecimalFormat formato = new DecimalFormat("# 0.00");
        
        strResult += "<input name='cedula' value='"+oEmpleado.getEmpleadoCedula()+"' type='text' maxlength='10' size='30' onkeypress=\"return soloNumeros(event)\" readonly='readonly'><br>";
        strResult += "<input name='nombre' value='"+ oEmpleado.getEmpleadoNombre() +"' type='text' size='30' onkeypress=\"return soloLetras(event)\" required><br>";
        strResult += "<input name='apellido' value='"+ oEmpleado.getEmpleadoApellido() +"' type='text' size='30' onkeypress=\"return soloLetras(event)\" required><br>";
        strResult += "<input name='direccion' value='"+ oEmpleado.getEmpleadoDireccion() +"' type='text' size='30' required><br>";
        strResult += "<input name='telefono' value='"+ oTelefonoPersona.getTelefonoPersonaTelefono() +"' type='text' size='30' maxlength= '10' onkeypress=\"return soloNumeros(event)\" required><br>";
        strResult += "<input name='ingresofecha' value='"+ oEmpleado.getEmpleadoIngresoFecha() +"' type='date' size='30' readonly='readonly'><br>";
        strResult += "<input name='clave' value='"+ oEmpleado.getEmpleadoClave() +"' type='password' size='30' required><br>";
        strResult += "<input name='sueldo' value='"+oEmpleado.getEmpleadoSueldo()+"0' type='number' min='0' max='500' step='0.01' size='30' readonly='readonly'><br><br>";
        strResult += "</div><br>";
        strResult += "<div class='caja web-100 centrar-contenido'>";
        strResult += "<input class='boton_verde' name='Guardar' value='Guardar' type='submit'><br><br>";
        strResult += "</div>";
        return strResult;
    }
    
    @WebMethod(operationName = "TestModificarEmpleado")
    public String TestModificarEmpleado(String cedula,String nombre,String apellido,String direccion,String fechaingreso,String clave,Float sueldo,String telefono){
        Empleado oEmpleado = new Empleado();
        TelefonoPersona oTelefonoPersona = new TelefonoPersona();
        
        oEmpleado.setEmpleadoCedula(cedula);
        oEmpleado.setEmpleadoNombre(nombre);
        oEmpleado.setEmpleadoApellido(apellido);
        oEmpleado.setEmpleadoDireccion(direccion);
        oEmpleado.setEmpleadoIngresoFecha(fechaingreso);
        oEmpleado.setEmpleadoClave(clave);
        oEmpleado.setEmpleadoSueldo(sueldo);
        
        oTelefonoPersona.setTelefonoPersonaEmpleadoId(cedula);
        oTelefonoPersona.setTelefonoPersonaTelefono(telefono);
        
        return modificarEmpleado(oEmpleado,oTelefonoPersona);
    }
    
    @WebMethod(operationName = "modificarEmpleado")
    public String modificarEmpleado(Empleado oEmpleado,TelefonoPersona oTelefonoPersona){
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        String strResult = port.modificarEmpleado(oEmpleado,oTelefonoPersona);
        return strResult;
    }
    
     @WebMethod(operationName = "ingresarProducto")
    public String ingresarProducto(Producto oProducto){
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        String strResult = port.ingresarProducto(oProducto);
        return strResult;
    }
    
    @WebMethod(operationName = "listarProductos")
    public String listarProductos(){
        String result = "<center><table border='1'>";
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<Producto> arr = (ArrayList) port.listarProductos();
        Integer nEs = arr.size();
        Integer id = 0;
        result += "<tr>";
            result += "<th> Id</th>";
            result += "<th> C&oacute;digo</th>";
            result += "<th> Descripci&oacute;n </th>";
            result += "<th> Marca </th>";
            result += "<th> Procedencia </th>";
            result += "<th> Stock </th>";
            result += "<th> Precio Unitario </th>";
            result += "</tr>";
        for(Integer i = 0; i < nEs; i++)
        {
            Producto oProducto = arr.get(i);
            id = i+1;
            DecimalFormat formato = new DecimalFormat("# 0.00");
            result += "<tr>";
            result += "<td>" + id.toString() + "</td>";
            result += "<td>" + oProducto.getProductoCodigo()+ "</td>";
            result += "<td>" + oProducto.getProductoDescripcion() + "</td>";
            result += "<td>" + oProducto.getProductoMarcaDescripcion() + "</td>";
            result += "<td>" + oProducto.getProductoProcedenciaDescripcion() + "</td>";
            result += "<td>" + oProducto.getProductoStock()+"</td>";
            result += "<td> $ " + formato.format(oProducto.getProductoPrecioUnitario())+"</td>";
            result += "</tr>";
        }
       result += "</table></center><br>";
       return result;
    }

    
    @WebMethod(operationName = "ingresarMarca")
    public String ingresarMarca(Marca oMarca)
    {
       com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
       String strResult = port.ingresarMarca(oMarca);
       return strResult;
    }
    
    @WebMethod(operationName = "listarMarcas")
    public String listarMarcas()
    {
        String result = "<select  name='marca'>";
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<Marca> arr = (ArrayList) port.listarMarcas();
        Integer nMarcas = arr.size();
        for(Integer i = 0; i < nMarcas; i++)
        {
            Marca oMarca = arr.get(i);
            result += "<option  value=" + oMarca.getProductoMarcaId() + ">"+oMarca.getProductoMarcaDescripcion()+"</option>";
        }
       result += "</select>";
       return result;
    }
    
     @WebMethod(operationName = "ingresarProcedencia")
    public String ingresarProcedencia(Procedencia oProcedencia)
    {
       com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
       String strResult = port.ingresarProcedencia(oProcedencia);
       return strResult;
    }
    
    @WebMethod(operationName = "listarProcedencias")
    public String listarProcedencias()
    {
        String result = "<select name='procedencia'>";
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<Procedencia> arr = (ArrayList) port.listarProcedencias();
        Integer nProcedencias = arr.size();
        for(Integer i = 0; i < nProcedencias; i++)
        {
            Procedencia oProcedencia = arr.get(i);
            result += "<option value=" + oProcedencia.getProductoProcedenciaId() + ">"+oProcedencia.getProductoProcedenciaDescripcion()+"</option>";
        }
       result += "</select>";
       return result;
    }
    
    
    //BUSCAR CLIENTES
    private String getClientesTableHeader() 
     {
        String result;

        result = "<tr>";
        result += "<th>C&eacutedula</th>";
        result += "<th>Nombre</th>";
        result += "<th>Apellido</th>";
        result += "<th>Dirección</th>";
        result += "<th>No. Compras</th>";
        result += "</tr>";

        return result;
    }
    
     private String getClientesTableHeader1() 
     {
        String result;
        result = "<tr>";
        result += "<th>Id</th>";
        result += "<th>C&eacutedula</th>";
        result += "<th>Nombre</th>";
        result += "<th>Apellido</th>";
        result += "<th>Dirección</th>";
        result += "<th>Total Facturas</th>";
        result += "</tr>";

        return result;
    } 
    
       
    @WebMethod(operationName = "getClientes")
    public String getClientesTable(@WebParam(name = "parametroDeBusqueda") String parametroDeBusqueda) 
    {        
        String resul = "<table align='center' border='1'>";       
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<Cliente> arr = (ArrayList) port.buscarClienteM(parametroDeBusqueda);
        Integer nEs = arr.size();
        if(nEs!=0)
        {
            resul += this.getClientesTableHeader();
        }
        if(nEs==0)
        {
            resul +="<font color='red'>Datos no encontrados</font>";
        }
        for (int i = 0; i < nEs; i++) {
            Cliente c = arr.get(i);
            resul += this.getClientesTableRow(i, c);
        }
        resul += "</table><br>";
        return resul;
    }
    
    private String getClientesTableRow(Integer i, Cliente c) {
          
        String result;
        result = "<tr align='center'>";
        result += "<td>" + c.getClienteCedula() + "</td>";
        result += "<td>" + c.getClienteNombre() + "</td>";
        result += "<td>" + c.getClienteApellido() + "</td>";
        result += "<td>" + c.getClienteDireccion() + "</td>";        
        result += "<td>" + c.getClienteNumeroCompras()+ "</td>";
        result += "</tr>";

        return result;
    } //FIN BUSCAR CLIENTES
    
    
       private String getClientesTableRow1(Integer i, ClienteFactura cf)
       {
            String result;
            DecimalFormat formato = new DecimalFormat("# 0.00");
            result = "<tr align='center'>";
            result += "<td>" + cf.getClienteId() + "</td>";
            result += "<td>" + cf.getClienteCedula() + "</td>";
            result += "<td>" + cf.getClienteNombre() + "</td>";
            result += "<td>" + cf.getClienteApellido() + "</td>";
            result += "<td>" + cf.getClienteDireccion() + "</td>";
            result += "<td> $" +formato.format(cf.getTotalFacturas())+ "</td>";
            //result += "<td><index.jsp?clienteid="+cf.getClienteId()+"></td>";
         
            result += "</tr>";
            return result;
    }
    
    
    

    
    //LISTAR CLIENTES MAS FRECUENTES
    @WebMethod(operationName = "listarMasFrecuentesCliente")
    public String listarMasFrecuentes(@WebParam(name = "parametroDeBusqueda")String numeroComprasCliente)
    {
        String resul = "<table align='center' border='1'>";        
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<Cliente> arr = (ArrayList) port.listarMasFrecuentesCliente(numeroComprasCliente);
        Integer nEs = arr.size();
        if(nEs!=0)
        {
            resul += this.getClientesTableHeader();
        }
        for (int i = 0; i < nEs; i++) {
            Cliente c = arr.get(i);
            resul += this.getClientesTableRow(i, c);
        }
        resul += "</table><br>";
        if(nEs==0)
        {
            resul = "<font color='red'>No se encontraron clientes con compras mayores o iguales a "+numeroComprasCliente+"</font><br><br>";
        }
        if(numeroComprasCliente==null)
        {
            resul = "";
        } 
        return resul;
    }
    
    @WebMethod(operationName = "mejorcompraClientes")
    public String mejorcompraClientes()
    {
        String result = "<table align='center' border='1'>";
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<ClienteFactura> arr = (ArrayList) port.mejorcompraClientes();
        Integer nEs = arr.size();
        if(nEs!=0)
        {
            result += this.getClientesTableHeader1();
        }
        for (int i = 0; i < nEs; i++) 
        {
            ClienteFactura cf = arr.get(i);
            result += this.getClientesTableRow1(i,cf);
        }
        result += "</table><br>";
        return result;
     }
       
  
    //BUSCAR PRODUCTOS
     private String getProductosTableHeader() 
     {
        String result;
        result = "<tr>";
        result += "<th>Código</th>";
        result += "<th>Descripción</th>";
        result += "<th>Marca</th>";
        result += "<th>Procedencia</th>";
        result += "<th>Precio Unitario</th>";
        result += "<th>Stock</th>";
        result += "</tr>";
        return result;
    }
    
      @WebMethod(operationName = "getProductos")
    public String getProductosTable(@WebParam(name = "parametroDeBusqueda") String parametroDeBusqueda) 
    {        
        String resul = "<table align='center' border='1'>";
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<Producto> arr = (ArrayList) port.buscarProducto(parametroDeBusqueda);
        Integer nEs = arr.size();
        if(nEs!=0)
        {
            resul += this.getProductosTableHeader();
        }
        if(nEs==0)
        {
            resul +="<font color='red'>Datos no encontrados</font>";
        }
        for (int i = 0; i < nEs; i++) {
            Producto p = arr.get(i);
            resul += this.getProductosTableRow(i, p);
        }
        resul += "</table><br>";
        return resul;
    }
   
    private String getProductosTableRow(Integer i, Producto p) {
          
        String result;
        DecimalFormat formato = new DecimalFormat("# 0.00");
        result = "<tr>";
        //result += "<td>" + i.toString() + "</td>";
        result += "<td>" + p.getProductoCodigo() + "</td>";
        result += "<td>" + p.getProductoDescripcion() + "</td>";
        result += "<td>" + p.getProductoMarcaDescripcion() + "</td>";
        result += "<td>" + p.getProductoProcedenciaDescripcion() + "</td>";
        result += "<td> $ " + formato.format(p.getProductoPrecioUnitario()) + "</td>";        
        result += "<td>" + p.getProductoStock() + "</td>";  
    
        result += "</tr>";
        return result;
    }

     @WebMethod(operationName = "listarProductosMasVendidos")
    public String listarProductosMasVendidos(String strDFmes,String strDFanio,String strDFlimite) 
    {
        String result = "<table align='center' border='1'>";
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<DetalleFactura> arr = (ArrayList) port.listarProductosMasVendidos(strDFmes, strDFanio, strDFlimite);
        Integer nEs = arr.size();
        if(nEs!=0)
        {
            result += "<tr>"; 
            result += "<th>Identificador</th>";
            result += "<th>Nombre del producto</th>";
            result += "<th>Numero de Ventas</th>";
            result += "</tr><br>";
        }
       if(nEs==0)
        {
            result = "<font color='red'>No se encontraron productos vendidos en esa fecha </font><br><br>";
        }
        if(strDFmes==null)
        {
            result = "";
        } 

        for(Integer i = 0; i < nEs; i++)
        {
            DetalleFactura e = arr.get(i);
            result += "<tr>";
            result += "<td>" + e.getDetallefacturaproductoid() + "</td>";
            result += "<td>" + e.getDetallefacturaproductodescripcion()+ "</td>";
            result += "<td>" + e.getDetallefacturaproductocantidad() + "</td>";
            result += "</tr>";
        }
       result += "</table><br>";
       return result;
    }
    
    //load factura lista todas las facturas
       
   @WebMethod(operationName = "loadFacturas")
    public ArrayList<Factura> loadFacturas(){   
    com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
    ArrayList<Factura> arr=(ArrayList) port.listarFactura();
    return (ArrayList<Factura>)  port.listarFactura();
    }
    
    //LISTAR FACTURAS ANULADAS
    @WebMethod(operationName = "FacturasAnuladas")
    public ArrayList<Factura> FacturasAnuladas(){   
    com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
    ArrayList<Factura> arr=(ArrayList) port.facturasAnuladas();
    return (ArrayList<Factura>)  port.facturasAnuladas();
    }

    
    //facturas por fecha
       @WebMethod(operationName = "FacturasPorFecha")
    public ArrayList<Factura> FacturasPorFecha(String fecha){   
    com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
    ArrayList<Factura> arr=(ArrayList) port.listarFactura();
    return (ArrayList<Factura>)  port.listarFacturasporFecha(fecha);
    }
    
    
    @WebMethod(operationName = "listarFacturasAnuladas")
    public String listarFacturasAnuladas(Integer mes, Integer anio)
    {
        String result = "<table align='center' class=\"table table-hover\" border='1'>";
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<Factura> arr = (ArrayList) port.listarFacturasAnuladas(mes,anio);
        Integer nEs = arr.size();
        Integer id = 0;
        if(nEs==0)
        {
            result="<font color='red'>No existen facturas emitidas en el 0"+mes+"/"+anio+" </font><br><br>";
        }
        else
        {
            result += "<tr>";
                result += "<th> N°</th>";
                result += "<th> C&eacute;dula</th>";
                result += "<th> Nombre </th>";
                result += "<th> Apellido</th>";
                result += "<th> Fecha de Compra</th>";
                result += "<th> Subtotal</th>";
                result += "<th> Iva</th>";
                result += "<th> Total</th>";
                result += "</tr>";
            for(Integer i = 0; i < nEs; i++)
            {
                Factura oFactura = arr.get(i);
                id = i+1;
                DecimalFormat formato = new DecimalFormat("# 0.00");
                result += "<tr>";
                result += "<td>" + oFactura.getFacturanumero()+ "</td>";
                result += "<td>" + oFactura.getClienteCedula()+ "</td>";
                result += "<td>" + oFactura.getClienteNombre() + "</td>";
                result += "<td>" + oFactura.getClienteApellido() + "</td>";
                result += "<td>" + oFactura.getFacturafechacompra() + "</td>";
                result += "<td> $ " + formato.format(oFactura.getFacturasubtotal())+"</td>";
                result += "<td> $ " + formato.format(oFactura.getFacturaiva())+"</td>";
                result += "<td> $ " + formato.format(oFactura.getFacturatotal())+"</td>";
                result += "</tr>";
            }
            result += "</table>";
            result += "<br>";
            result += "<h5> El total de facturas anuladas en esta fecha es: "+nEs+"</h5>";

        }
       
       return result;
    }

@WebMethod(operationName = "listarFacturasporFecha")
    public String listarFacturasporFecha(String fecha)
    {
        String result = "<div class='caja web-100 centro-contenido'>";
        result += "<table align='center' border='1'>";
        DecimalFormat formato = new DecimalFormat("# 0.00");
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<Factura> arr = (ArrayList) port.listarFacturasporFecha(fecha);
        Integer nEs = arr.size();
        Integer id = 0;
        Double suma=0.0;
        
         if(fecha==null)
        {
            result ="";
        }
        
        
        else if(nEs==0)
        {
            result +="<font color='red'>No existen facturas emitidas en "+fecha+" </font><br><br>";
        }
        
                      
        else
        {
            
            result += "<tr>";  
            result += "<th> N° </th>";
            result += "<th> C&eacute;dula</th>";
            result += "<th> Nombre</th>";
            result += "<th> Apellido</th>";
            result += "<th> Fecha</th>";
            result += "<th> Subtotal</th>";
            result += "<th> Iva</th>";
            result += "<th> Total</th>";
            //result += "<th> Estado de la Factura</th>";
            result += "</tr>";
            for(Integer i = 0; i < nEs; i++)
            {
                Factura oFactura = arr.get(i);
                id = i+1;
        
                
                result += "<tr>";
                result += "<td>" + oFactura.getFacturanumero()+ "</td>";
                result += "<td>" + oFactura.getFacturaclientecedula()+ "</td>";
                result += "<td>" + oFactura.getClienteNombre() + "</td>";
                result += "<td>" + oFactura.getClienteApellido() + "</td>";
                result += "<td>" + oFactura.getFacturafechacompra() + "</td>";
                result += "<td> $ " + formato.format(oFactura.getFacturasubtotal())+"</td>";
                result += "<td> $ " + formato.format(oFactura.getFacturaiva())+"</td>";
                result += "<td> $ " + formato.format(oFactura.getFacturatotal())+"</td>";
                result += "</tr>";
                suma=suma+oFactura.getFacturatotal();
            }
            result += "</table></div>";
            result += "<div class='caja web-100 centro-contenido centrar'>";
            result += "<br>";
            result += "<h5>Total de facturas "+nEs+" y $ "+formato.format(suma)+" dólares en ventas</h5>";
            result += "</div>";

        }
       
       return result;
    }

    
    //BUSCAR FACTURA
    private String getFacturaTableHeader() {
        String result;

        result = "<tr>";
        result += "<th >N. Factura</th>";
        result += "<th >Cédula</th>";
        result += "<th >Nombre</th>";
        result += "<th >Apellido</th>";
        result += "<th >Fecha de emisi&oacute;n</th>";
        result += "<th >Total de compra</th>";
        result += "<th >Ver detalle</th>";
        result += "</tr>";
        return result;
    }

    @WebMethod(operationName = "getFacturas")
    public String getFacturaTable(@WebParam(name = "parametroDeBusqueda") String parametroDeBusqueda) {
        String resul = "<table align='center' border='1'>";

        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<Factura> ArrayFacturas = (ArrayList) port.buscarFactura(parametroDeBusqueda);
        Integer nFs = ArrayFacturas.size();
        if (nFs != 0) {
            resul += this.getFacturaTableHeader();
        }
        if (nFs == 0) {
            resul += "<font color='red'>Datos no encontrados</font>";
        }
        for (int i = 0; i < nFs; i++) {
            Factura f = ArrayFacturas.get(i);
            resul += this.getFacturasTableRow(i, f);
        }
        resul += "</table>";
        return resul;
    }

    private String getFacturasTableRow(Integer i, Factura f) {

        String result;
        DecimalFormat formato = new DecimalFormat("# 0.00");
        result = "<tr>";
        result += "<td>" + f.getFacturanumero() + "</td>";
        result += "<td>" + f.getFacturaclientecedula() + "</td>";
        result += "<td>" + f.getFacturaclientenombre() + "</td>";
        result += "<td>" + f.getFacturaclienteapellido() + "</td>";
        result += "<td>" + f.getFacturafechacompra() + "</td>";
        result += "<td> $" + formato.format(f.getFacturatotal()) + "</td>";
        //result += "<td><a href='ListarFactura.jsp?id=" + f.getFacturanumero().toString() + "'>Detalle</a></td>";
        result += "<td><a href='ListarFactura.jsp?id=" + f.getFacturanumero().toString() + "'><img tittle='ver detalle' alt='ver detalle' src='tema/img/detalle.png' width='30' height='30'></a></td>";       

        result += "</tr>";

        return result;
    }

    
    /////////////////////////////////////////////////////////////////////////////
    ////////////////////mostrarfacturas cliente/////////////////////////////////
    
    private String getFacturaTableHeaderCli() {
        String result;

        result = "<tr>";
        result += "<th >N. Factura</th>";
        result += "<th >Fecha de emisi&oacute;n</th>";
        result += "<th >Total de compra</th>";
        result += "<th >Ver detalle</th>";
        result += "</tr>";
        return result;
    }
    
     private String getFacturasTableRowCli(Integer i, Factura f) {

        String result;
        DecimalFormat formato = new DecimalFormat("# 0.00");
        result = "<tr>";
        result += "<td>" + f.getFacturanumero() + "</td>";
        result += "<td>" + f.getFacturafechacompra() + "</td>";
        result += "<td> $" + formato.format(f.getFacturatotal()) + "</td>";
        //result += "<td><a href='ListarFactura1.jsp?id=" + f.getFacturanumero().toString() + "'>Detalle</a></td>";
        result += "<td><a href='ListarFactura1.jsp?id=" + f.getFacturanumero().toString() + "'><img tittle='ver detalle' alt='ver detalle' src='tema/img/detalle.png' width='30' height='30'></a></td>";       

        result += "</tr>";

        return result;
    }
    
    @WebMethod(operationName = "getFacturasCli")
    public String getFacturaTableCli(@WebParam(name = "parametroDeBusqueda") String parametroDeBusqueda) {
        String resul = "<table align='center' border='1'>";

        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<Factura> ArrayFacturas = (ArrayList) port.buscarFactura(parametroDeBusqueda);
        Integer nFs = ArrayFacturas.size();
        if (nFs != 0) {
            resul += this.getFacturaTableHeaderCli();
        }
        if (nFs == 0) {
            resul += "<font color='red'>Datos no encontrados</font>";
        }
        for (int i = 0; i < nFs; i++) {
            Factura f = ArrayFacturas.get(i);
            resul += this.getFacturasTableRowCli(i, f);
        }
        resul += "</table>";
        return resul;
    }

    ////////////////////fin mostrarfacturas cliente/////////////////////////////////
   //////////////////////////////////////////////////////////////////////////////////
    
    
    
    
    @WebMethod(operationName = "getFacturaId")
    public String getFacturaIdTable(@WebParam(name = "FacturaId") String FacturaId) {
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        Factura f = port.getFactura(FacturaId);
        DecimalFormat formato = new DecimalFormat("# 0.00");
        String result = "<table align='center' class='tabla_factura'    border='1'>";

        result += "<tr><td rowspan='2' colspan='2' class='td_blanco'><img src='tema/img/logo.jpg' width='100' height='100'><br> <b>RUC:</b>0602633968001 <br> <b>Direcci&oacute;n</b>Venezuela 22-07 y Espejo <br> <b>RIOBAMBA - ECUADOR</b></td><td colspan='2' class='td_factura'>Bici Repuestos Alexandra</td></tr>";
        result += "<tr><td class='td_factura'>Factura N°</td><td class='td_blanco'>" + f.getFacturanumero() + "</td></tr>";
        result += "<tr><td colspan='2' class='td_factura'>Se&ntilde;or(es):</td><td colspan='2' class='td_blanco'>" + f.getFacturaclientenombre() + " " + f.getFacturaclienteapellido() + "</td></tr>";
        result += "<tr><td colspan='2' class='td_factura'>Fecha:</td><td colspan='2' class='td_blanco'>" + f.getFacturafechacompra() + "</td></tr>";
        result += "<tr><td colspan='2' class='td_factura'>R.U.C/C.I.:</td><td colspan='2' class='td_blanco'>" + f.getFacturaclientecedula() + "</td></tr>";
        result += "<tr><td class='td_factura'>Direcci&oacute;n:</td><td class='td_blanco'>" + f.getFacturaclientedireccion() + "</td><td class='td_factura'>Tel&eacute;fono:</td><td class='td_blanco'>" + f.getFacturaclientetelefono() + "</td></tr>";
        result += "<tr ><td class='td_verde'>CANTIDAD</td><td class='td_verde'>PRODUCTO</td><td class='td_verde'>V.UNITARIO</td><td class='td_verde'>V. TOTAL </td></tr>";
        result += getDetalles(f.getFacturanumero().toString());
        result += "<tr>";
        result += "<td align='right' colspan='3' class='td_factura'>Sub Total</td>";
        result += "<td align='center' class='td_blanco'>$ " + formato.format(f.getFacturasubtotal()) + "</td>";
        result += "</tr>";
        result += "<tr>";
        result += "<td align='center' colspan='3' class='td_factura'>IVA 12%</td>";
        result += "<td align='center' class='td_blanco'>$ " + formato.format(f.getFacturaiva()) + "</td>";
        result += "</tr>";
        result += "<tr>";
        result += "<td align='center' colspan='3'class='td_factura'>Total</td>";
        result += "<td align='center' class='td_blanco'><b>$ " + formato.format(f.getFacturatotal()) + "</b></td>";
        result += "</tr>";
        result += "</table>";
        return result;
    }

    @WebMethod(operationName = "getDetalles")
    public String getDetalles(@WebParam(name = "FacturaId") String FacturaId) {
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<DetalleFactura> ArrayFacturas = (ArrayList) port.getDetalles(FacturaId);
        Integer nFs = ArrayFacturas.size();
        String result = "";
        if (nFs != 0) {
            for (int i = 0; i < nFs; i++) {
                DetalleFactura oDetalleFactura = ArrayFacturas.get(i);
                DecimalFormat formato = new DecimalFormat("# 0.00");
                result += "<tr>";
                result += "<td align='center' class='td_blanco'>" + oDetalleFactura.getDetallefacturaproductocantidad() + "</td>";
                result += "<td align='center' class='td_blanco'>" + oDetalleFactura.getDetallefacturaproductodescripcion() + "</td>";
                result += "<td align='center' class='td_blanco'>$" + formato.format(oDetalleFactura.getDetallefacturaproductopreciounitario()) + "</td>";
                result += "<td align='center' class='td_blanco'>$" + formato.format(oDetalleFactura.getDetallefacturapreciototal()) + "</td>";
                result += "</tr>";
            }
        }
        return result;
    }

/////listar clientes

    @WebMethod(operationName = "ListarClientesFactura")
    public String ListarClientesFactura() {
        
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<Cliente> arr = (ArrayList) port.getClientes();
        Integer nEs = arr.size();
        String result = "<table border='1' align='center'>";

        result += "<tr>";
        //result += "<th> Item</th>";
        result += "<th> Cédula</th>";
        result += "<th> Nombre </th>";
        result += "<th>Apellido</th>";
        result += "<th>Dirección</th>";
        result += "<th>Opción</th>";
        result += "</tr>";
        for (Integer i = 0; i < nEs; i++) {
            Cliente e = arr.get(i);
            result += "<tr>";
            //result += "<td>" + i.toString() + "</td>";
            //result += "<td>" + e.getClienteId() + "</td>";
            result += "<td>" + e.getClienteCedula() + "</td>";
            result += "<td>" + e.getClienteNombre() + "</td>";
            result += "<td>" + e.getClienteApellido() + "</td>";
            result += "<td>" + e.getClienteDireccion() + "</td>";
            result += "<td><a href='ControladorClienteFactura.jsp?clienteid=" + e.getClienteId() + "'>Añadir</a></td>";
            result += "</tr>";
        }
        result += "</table>";
        return result;
    }

    //NumeroFactura
    @WebMethod(operationName = "NumeroFactura")
    public Factura NumeroFactura() {
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        Factura c = new Factura();
        c = port.numeroFactura();
        return c;
    }
    
     // ver factura GINO
    
   private String getFacturaVerTableHeader() {
        String result;

        result = "<tr>";
        result += "<th >N. Factura</th>";
        result += "<th >Cédula</th>";
        result += "<th >Nombre</th>";
        result += "<th >Apellido</th>";
        result += "<th >Fecha de emisi&oacute;n</th>";
        result += "<th >Total</th>";
        result += "<th >Ver Detalle</th>";
        result += "</tr>";
        return result;
    }

    @WebMethod(operationName = "getFacturasVer")
    public String getFacturaVerTable(@WebParam(name = "parametroDeBusqueda") String parametroDeBusqueda) {
        String resul = "<table class=\"table table-hover\">";

        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<Factura> ArrayFacturas = (ArrayList) port.buscarFactura(parametroDeBusqueda);
        Integer nFs = ArrayFacturas.size();
        if (nFs != 0) {
            resul += this.getFacturaTableHeader();
        }
        if (nFs == 0) {
            resul += "<font color='red'>Datos no encontrados</font>";
        }
        for (int i = 0; i < nFs; i++) {
            Factura f = ArrayFacturas.get(i);
            resul += this.getFacturasTableRow(i, f);
        }
        resul += "</table>";
        return resul;
    }

    private String getFacturasVerTableRow(Integer i, Factura f) {

        String result;
        DecimalFormat formato = new DecimalFormat("# 0.00");
        result = "<tr>";
        result += "<td>" + f.getFacturanumero() + "</td>";
        result += "<td>" + f.getFacturaclientecedula() + "</td>";
        result += "<td>" + f.getFacturaclientenombre() + "</td>";
        result += "<td>" + f.getFacturaclienteapellido() + "</td>";
        result += "<td>" + f.getFacturafechacompra() + "</td>";
        result += "<td> $ " + formato.format(f.getFacturatotal()) + "</td>";
        result += "<td><a href='BuscarFactura.jsp?id=" + f.getFacturanumero().toString() + "'>Detalle</a></td>";
        result += "</tr>";

        return result;
    }

    @WebMethod(operationName = "getFacturaIdVer")
    public String getFacturaIdVerTable(@WebParam(name = "FacturaId") String FacturaId) {
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        Factura f = port.getFacturaVer(FacturaId);
        String result = "<table  class=\"table table-striped\"   >";
        DecimalFormat formato = new DecimalFormat("# 0.00");
         result += "<tr><td bgcolor=\"white\" rowspan='2'><center><img src='estilos/Login_v2/images/index-logo-2.png' width='120' height='40'></center></td></tr>";
        result += "<tr><td  bgcolor=\"white\" colspan='4'><center><b>RUC:</b><c/enter>0992892838001<br><b>Direcci&oacute;n: </b> Ayapamba 0e-54y Gonzol / Ayacucho 2912, Victor Hugo Briones y Gallegos Lara <br> <b>QUITO - GUAYAQUIL</b></td></tr>";
        result += "<tr><td colspan='0   ' class='td_factura'><b>Pedido N°:</b></td><td class='td_blanco'>&nbsp&nbsp" + f.getFacturanumero() + "</td><td bgcolor=\"white\" rowspan='4'colspan='4' ></td></tr>";
        result += "<tr><td bgcolor=\"white\" ><b>Se&ntilde;or(es):</b></td><td bgcolor=\"white\">" + f.getFacturaclientenombre() + " " + f.getFacturaclienteapellido() + "</td></tr>";
        result += "<tr><td ><b>Fecha:</b></td><td >" + f.getFacturafechacompra() + "</td></tr>";
        result += "<tr><td bgcolor=\"white\"><b>R.U.C / C.I.:</b></td><td bgcolor=\"white\" >" + f.getFacturaclientecedula() + "</td></tr>";
        result += "<tr><td ><b>Direcci&oacute;n:</b></td><td >" + f.getFacturaclientedireccion() + "</td><td ><b>Tel&eacute;fono:</b></td><td >" + f.getFacturaclientetelefono() + "</td></tr>";
        result += "<tr ><td class='td_verde'><b>CANTIDAD</b></td><td  class='td_verde'><b>CODIGO</b></td><td class='td_verde'><b>PRODUCTO</b></td><td class='td_verde'><b>V.UNITARIO</b></td><td class='td_blanco'><b>V. TOTAL</b> </td></tr>";
        result += getDetallesVer(f.getFacturanumero().toString());
        result += "<tr>";
        result += "<td align='right' colspan='4'class='td_factura'><b>Sub Total</b></td>";
        result += "<td align='center' class='td_blanco'>$ " + formato.format(f.getFacturasubtotal()) + "</td>";
        result += "</tr>";
        result += "<tr>";
        result += "<td align='center' colspan='4' class='td_factura'><b>IVA 12% </b></td>";
        result += "<td align='center' class='td_blanco'>$ " + formato.format(f.getFacturaiva()) + "</td>";
        result += "</tr>";
        result += "<tr>";
        result += "<td align='center' colspan='4' class='td_factura'><b>Total</b></td>";
        result += "<td align='center' class='td_blanco'><b>$ " + formato.format(f.getFacturatotal()) + "</b></td>";
        result += "</tr>";
        result += "</table>";
        return result;
    }

    @WebMethod(operationName = "getDetallesVer")
    public String getDetallesVer(@WebParam(name = "FacturaId") String FacturaId) {
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<DetalleFactura> ArrayFacturas = (ArrayList) port.getDetallesVer(FacturaId);
        Integer nFs = ArrayFacturas.size();
        String result = "";
        if (nFs != 0) {
            for (int i = 0; i < nFs; i++) {
                DetalleFactura oDetalleFactura = ArrayFacturas.get(i);
                DecimalFormat formato = new DecimalFormat("# 0.00");
                result += "<tr>";
                result += "<td align='center' class='td_blanco'>" + oDetalleFactura.getDetallefacturaproductocantidad() + "</td>";
                result += "<td align='center' class='td_blanco'>" + oDetalleFactura.getCodproducto()+ "</td>";
                result += "<td align='center' class='td_blanco'>" + oDetalleFactura.getDetallefacturaproductodescripcion() + "</td>";
                result += "<td align='center' class='td_blanco'>$" + formato.format(oDetalleFactura.getDetallefacturaproductopreciounitario()) + "</td>";
                result += "<td align='center' class='td_blanco'>$" + formato.format(oDetalleFactura.getDetallefacturapreciototal()) + "</td>";
                result += "</tr>";
            }
        }
        return result;
    }
    
    
        /////Buscar cliente por parametro
    @WebMethod(operationName = "aa")
    public Cliente aa(Integer id) {
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        Cliente c = new Cliente();
        c = port.buscar(id);
        return c;
    }
     ///////Listar productos factura
    @WebMethod(operationName = "ListarProductosFactura")
    public String ListarProductosFactura() {

        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<Producto> arr = (ArrayList) port.listarProductosFactura();
        Integer nEs = arr.size();

        String result = "<table border='1' align='center'>";

        result += "<tr>";
        result += "<th>Código</th>";
        result += "<th>Descripción</th>";
        result += "<th> Marca </th>";
        //result += "<th>Procedencia</th>";
        result += "<th>P. Unitario</th>";
        result += "<th>Stock</th>";
        result += "<th>Opción</th>";
        result += "</tr>";

        for (Integer i = 0; i < nEs; i++) {
            Producto e = arr.get(i);
            DecimalFormat formato = new DecimalFormat("# 0.00");
            result += "<tr>";
            //result += "<td>" + i.toString() + "</td>";
            //result += "<td>" + e.getProductoId() + "</td>";
            result += "<td>" + e.getProductoCodigo() + "</td>";
            result += "<td>" + e.getProductoDescripcion() + "</td>";
            result += "<td>" + e.getProductoMarcaDescripcion() + "</td>";
            //result += "<td>" + e.getProductoProcedenciaDescripcion() + "</td>";
            result += "<td>  $ " + formato.format(e.getProductoPrecioUnitario()) + "</td>";
            result += "<td>" + e.getProductoStock() + "</td>";
            result += "<td><a href='ControladorProductosFactura.jsp?productoid=" + e.getProductoId() + "'>Añadir</a></td>";
            result += "</tr>";
        }
        result += "</table>";
        return result;
    }
    
    //Buscar Productos Factura
    private String getProductosFacturaTableHeader() {
        String result;
        result = "<tr>";
        result += "<th>Código</th>";
        result += "<th>Descripción</th>";
        result += "<th>Marca</th>";
        result += "<th>Procedencia</th>";
        result += "<th>Precio Unitario</th>";
        result += "<th>Stock</th>";
        result += "<th>Opción</th>";
        result += "</tr>";
        return result;
    }

    @WebMethod(operationName = "getProductosFactura")
    public String getProductosFacturaTable(@WebParam(name = "parametroDeBusqueda") String parametroDeBusqueda) {
        String resul = "<table align='center' border='1'>";
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<Producto> arr = (ArrayList) port.buscarProducto(parametroDeBusqueda);
        Integer nEs = arr.size();
        if (nEs != 0) {
            resul += this.getProductosFacturaTableHeader();
        }
        if (nEs == 0) {
            resul += "<font color='red'>Datos no encontrados</font><br>";
        }
        for (int i = 0; i < nEs; i++) {
            Producto p = arr.get(i);
            resul += this.getProductosFacturaTableRow(i, p);
        }
        resul += "</table><br>";
        return resul;
    }

    private String getProductosFacturaTableRow(Integer i, Producto p) {

        String result;
        DecimalFormat formato = new DecimalFormat("# 0.00");
        result = "<tr>";
        //result += "<td>" + i.toString() + "</td>";
        result += "<td>" + p.getProductoId() + "</td>";
        // result += "<td>" + p.getProductoCodigo() + "</td>";
        result += "<td>" + p.getProductoDescripcion() + "</td>";
        result += "<td>" + p.getProductoMarcaDescripcion() + "</td>";
        result += "<td>" + p.getProductoProcedenciaDescripcion() + "</td>";
        result += "<td> $ " + formato.format(p.getProductoPrecioUnitario()) + "</td>";
        result += "<td>" + p.getProductoStock() + "</td>";
        result += "<td><a href='ControladorProductosFactura.jsp?productoid=" + p.getProductoId() + "'>Añadir</a></td>";
        result += "</tr>";
        return result;
    }
     // BuscarClientesFactura
        private String getClientesFacturaTableHeader() {
        String result;
        result = "<tr>";
        result += "<th> Item</th>";
        result += "<th> Cédula</th>";
        result += "<th> Nombre </th>";
        result += "<th>Apellido</th>";
        result += "<th>Dirección</th>";
        result += "<th>Opción</th>";
        result += "</tr>";
        return result;
    }

    @WebMethod(operationName = "getClientesFactura")
    public String getClientesFacturaTable(@WebParam(name = "parametroDeBusqueda") String parametroDeBusqueda) {
        String resul = "<table align='center' border='1'>";
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<Cliente> arr = (ArrayList) port.buscarClientes(parametroDeBusqueda);
        Integer nEs = arr.size();
        if (nEs != 0) {
            resul += this.getClientesFacturaTableHeader();
        }
        if (nEs == 0) {
            resul += "<font color='red'>Datos no encontrados</font>";
        }
        for (int i = 0; i < nEs; i++) {
            Cliente p = arr.get(i);
            resul += this.getClientesFacturaTableRow(i, p);
        }
        resul += "</table><br>";
        return resul;
    }

    private String getClientesFacturaTableRow(Integer i, Cliente p) {
            String result;
             result = "<tr>";
            //result += "<td>" + i.toString() + "</td>";
            result += "<td>" + p.getClienteId() + "</td>";
            result += "<td>" + p.getClienteCedula() + "</td>";
            result += "<td>" + p.getClienteNombre() + "</td>";
            result += "<td>" + p.getClienteApellido() + "</td>";
            result += "<td>" + p.getClienteDireccion() + "</td>";
            result += "<td><a href='ControladorClienteFactura.jsp?clienteid=" + p.getClienteId() + "'>Añadir</a></td>";
            result += "</tr>";
       
        return result;
    }


///////Listar productos factura
    @WebMethod(operationName = "ListarProductoFactura")
    public Producto ListarProductoFactura(Integer codigo)
    {
       com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
      Producto oProducto = null; 
     oProducto=port.buscarProductosFactura(codigo);
        
        return oProducto;
    }
     //////////ingresar Detalle Factura

    @WebMethod(operationName = "ingresarDetalleFactura")
    public String ingresarDetalleFactura(Integer numeroF, Integer numeroP, String detalle, Double precioU, Integer cantidad, Double precioT) {
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        String strResult = port.ingresardetallefactura(numeroF, numeroP, detalle, precioU,cantidad,precioT);
        return strResult;
    }
    ////////////
    public java.util.List<com.factime.servicioweb.DetalleFactura> subtotalFactura(java.lang.Integer arg0) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        return port.subtotalFactura(arg0);
    }
    ////////
    @WebMethod(operationName = "ListarDetalleFactura")
    public String ListarDetalleFactura(String codigoimg){
        String result = " <div class='table-responsive'>";
        result = "<table class='timetable_sub'>";
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<DetalleFactura> arr = (ArrayList) port.obtenerDetalles();
        Integer nEs = arr.size();
        DecimalFormat formato = new DecimalFormat("# 0.00");
        result += "<tr> <br><br>";
                result += "<th WIDTH='100' HEIGHT='30'> Cantidad</th>";
                 result += "<th WIDTH='100' HEIGHT='30'> Producto</th>";
                result += "<th WIDTH='300' HEIGHT='30'> Descripci&oacute;n</th>";
                result += "<th WIDTH='250' HEIGHT='30'> Precio Unitario </th>";
                result += "<th WIDTH='250' HEIGHT='30'> Subtotal</th>";
                result += "</tr>";
        for(Integer i = 0; i < nEs; i++)
        {
            DetalleFactura oDetalleFactura = arr.get(i);
            result += "<tr>";
            result += "<td>" + oDetalleFactura.getDetallefacturaproductocantidad() + "</td>";
            
            //
            String ArrayList;
                        ArrayList<Imagen> im = (ArrayList) port.buscarImagenPedido(oDetalleFactura.getDetallefacturaproductoid().toString());
                          
                        for(Integer h = 0; h < 1; h++)
                        {                              
                            if(im.isEmpty())
                            {                
                               result +="<td><img src='images/m1.jpg' width='120' height='120'></td>";
                                         
                            }
                            else
                            {   
                                   Imagen img = im.get(h);
                                   
                            result +="<td><img src='"+img.getNombre()+"' width='120' height='120'></td>";  
                                                                  }
                        }
            //
            
            //result += "<td></td>";
            //result += "<td>" + oDetalleFactura.getDetallefacturafacturaid() + "</td>";
            result += "<td>" + oDetalleFactura.getDetallefacturaproductodescripcion() + "</td>";
            result += "<td> $ " + formato.format(oDetalleFactura.getDetallefacturaproductopreciounitario()) + "</td>";
           
            result += "<td> $" + formato.format(oDetalleFactura.getDetallefacturapreciototal())+ "</td>";
            result += "</tr>";
        }      
       result += "</table>";
       result += "</div>";
       return result;
    }
    ////////
    public String ingresarFactura( java.lang.String arg4,java.lang.String arg0, java.lang.Double arg1, java.lang.Double arg2, java.lang.Double arg3) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        return port.ingresarFactura(arg4,arg0, arg1, arg2, arg3);
    }
    
    
    @WebMethod(operationName = "listarEmpleadoporSueldo")
    public String listarEmpleadoporSueldo(Float sueldo)
    {
        String result = "<table align='center' border='1'>";
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<Empleado> arr = (ArrayList) port.listarEmpleadosporSueldo(sueldo);
        Integer nEs = arr.size();
        Integer id = 0;
        DecimalFormat formato = new DecimalFormat("# 0.00");        
         if(sueldo==null)
        {
            result ="";
        }
        
        
        else if(nEs==0)
        {
            result +="<font color='red'>No existen empleados con "+sueldo+" de sueldo </font><br><br>";
        }
        
                      
        else
        {
            result += "<tr>";
                
                result += "<th> C&eacute;dula</th>";
                result += "<th> Nombre</th>";
                result += "<th> Apellido</th>";
                result += "<th> Direcci&oacute;n</th>";
                result += "<th> Sueldo</th>";
                
                result += "</tr>";
            for(Integer i = 0; i < nEs; i++)
            {
                Empleado oEmpleado = arr.get(i);
                id = i+1;
                                
                result += "<tr>";
                result += "<td>" + oEmpleado.getEmpleadoCedula()+ "</td>";
                result += "<td>" + oEmpleado.getEmpleadoNombre()+ "</td>";
                result += "<td>" + oEmpleado.getEmpleadoApellido() + "</td>";
                result += "<td>" + oEmpleado.getEmpleadoDireccion() + "</td>";
                result += "<td> $ " + formato.format(oEmpleado.getEmpleadoSueldo())+ "</td>";
                
               
                //result += "<td> " + oFactura.getFacturaestado()+"</td>";
                result += "</tr>";
               // suma=suma+oFactura.getFacturatotal();
            }
            result += "</table>";
            result += "";
            result += "<h5> Cantidad de empleados: "+nEs+"</h5>";
            //result += "<h5> Total de Facturas "+suma+"</h5>";

        }
       
       return result;
    }
    
 /*Listar compras anuladas abastecimiento*/
    @WebMethod(operationName = "listarComprasAnuladas")
    public String listarComprasAnuladas(Integer mes, Integer anio)
    {
        String result = "<table align='center' border='1'>";
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<FacturaAbastece> arr = (ArrayList) port.listarComprasAnuladas(mes,anio);
        Integer nEs = arr.size();
        Integer id = 0;
        if(nEs==0)
        {
            result="<font color='red'>No existen facturas emitidas en el "+mes+"/"+anio+" </font><br><br>";
        }
        else
        {
            result += "<tr>";
                result += "<th> N° Factura</th>";
                result += "<th> Proveedor</th>";
                result += "<th> Fecha de Compra</th>";
                result += "<th> Subtotal</th>";
                result += "<th> Iva</th>";
                result += "<th> Total</th>";
                result += "</tr>";
                DecimalFormat formato = new DecimalFormat("# 0.00");
            for(Integer i = 0; i < nEs; i++)
            {
                FacturaAbastece oFactura = arr.get(i);
                id = i+1;
                
                result += "<tr>";
                result += "<td>" + oFactura.getFacturaAbasteceNumero()+ "</td>";
                result += "<td>" + oFactura.getProveedorNombre()+ "</td>";
                result += "<td>" + oFactura.getFacturaAbasteceFecha() + "</td>";
                result += "<td> $ " + formato.format(oFactura.getFacturaAbasteceSubtotal())+ "</td>";
                result += "<td> $ " + formato.format(oFactura.getFaturaAbasteceIva())+"</td>";
                result += "<td> $ " + formato.format(oFactura.getFacturaAbasteceTotal()) + "</td>";
                result += "</tr>";
            }
            result += "</table>";
            result += "<br>";
            result += "<h5> El total de compras anuladas en esta fecha es: "+nEs+"</h5>";

        }
       
       return result;
    }
    
  /////Listar facturas activas abastece iteracion 10  
     @WebMethod(operationName = "listarFacturasActivasAbastece")
    public String listarFacturasActivasAbastece(Integer mes, Integer anio)
    {
        String result = "<table align='center' border='1' class=\"table table-hover\">";       
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();        
        ArrayList<FacturaAbastece> arr = (ArrayList) port.listarFacturasActivasAbastece(mes,anio);
        Integer nEs = arr.size();
        Integer id = 0;
        if(nEs==0)
        {
            result="<font color='red'>No existen facturas emitidas en el "+mes+"/"+anio+" </font><br><br>";
        }
        else
        {
            result += "<tr>";                
            result +="<h3><font color='black'>Listado de las facturas del "+mes+"/"+anio+" </font></h3>";
            result += "</tr>";                
            result += "<tr>";                
                result += "<th> N° Factura</th>";
                result += "<th> Proveedor</th>";
                result += "<th> Fecha de Compra</th>";
                result += "<th> Subtotal</th>";
                result += "<th> Iva</th>";
                result += "<th> Total</th>";
                result += "<th> Anular</th>";
                result += "</tr>";
                DecimalFormat formato = new DecimalFormat("# 0.00");
            for(Integer i = 0; i < nEs; i++)
            {
                FacturaAbastece oFactura = arr.get(i);
                id = i+1;
                
                result += "<tr>";
                result += "<td>" + oFactura.getFacturaAbasteceId()+ "</td>";
                result += "<td>" + oFactura.getProveedorNombre()+ "</td>";
                result += "<td>" + oFactura.getFacturaAbasteceFecha() + "</td>";
                result += "<td> $" + formato.format(oFactura.getFacturaAbasteceSubtotal())+ "</td>";
                result += "<td> $" + formato.format(oFactura.getFaturaAbasteceIva())+"</td>";
                result += "<td> $" + formato.format(oFactura.getFacturaAbasteceTotal()) + "</td>";
                result += "<td><a href='ControladorAnularFacturaAbastece.jsp?idFactura="+oFactura.getFacturaAbasteceId().toString()+"' onmouseDown='alert('Factura anulada')'>Anular</a></td>";
                result += "</tr>";
            }
            result += "</table>";
            result += "<br>";
            result += "<h5> El total de compras anuladas en esta fecha es: "+nEs+"</h5>";

        }
       
       return result;
    }
    
    ////Modificar estado de la factura abastece iteracion 10
     @WebMethod(operationName = "CambiarEstadoFacturaAbastece")
    public String CambiarEstadoFacturaAbastece(Integer IdFactura){        
         com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();        
        return port.cambiarEstadoFacturaAbastece(IdFactura);
    }
    /////////////////////////////////////////////////////BUSCAR COMPRASsssss
     /*@WebMethod(operationName = "buscarComprass")
    public String buscarComprass(String variable){
        String strResult = "<table align='center' border='1'>";
        
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        
    ArrayList<Compra> arr = (ArrayList) port.buscarComprass(variable);
    Integer cont=0;
    Integer nEs = arr.size();
    
     if(nEs!=0)
        {
            strResult += "<tr>";
        strResult += "<th> ID FACTURA </th>";
        strResult += "<th> RUC </th>";
        strResult += "<th> NOMBRE </th>";
        strResult += "<th> FECHA </th>";
        strResult += "<th> TOTAL </th>";
        strResult += "</tr>";
        }
                            
        DecimalFormat formato = new DecimalFormat("# 0.00");
           
        for(Integer i = 0; i < nEs; i++)
        {
            Compra oCompra = arr.get(i);
            
            strResult += "<tr>";
            strResult += "<td>" + oCompra.getCompraId()+ "</td>";
            strResult += "<td>" +  oCompra.getAbasteceproveedorruc() + "</td>";
            strResult += "<td>" + oCompra.getAbasteceproveedornombre() + "</td>";
            strResult += "<td>" + oCompra.getCompraFecha() + "</td>";
            strResult += "<td> $ " +  formato.format(oCompra.getCompraTotal()) + "</td>";
            //strResult+= "<td><a href='BuscarComprass.jsp?id="+ oCompra.getCompraId()+"'>DETALLE</a></td>";
            strResult += "</tr>";
            cont++;
        }
        
       strResult += "</table><br>";
      
       return strResult;
    }*/
    
    /////////////////////////////////////////////////////DETALLES ABASTECIMIENTOdssssssssssssss
    
     @WebMethod(operationName = "DetallesAbastecimientosss")
    public String DetallesAbastecimientosss(String variable){
        String strResult = "<table align='center' border='1' width='595'>";
        
        
        
         com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        
          Integer variable1=Integer.parseInt(variable);
        
    ArrayList<CompraProducto> arr = (ArrayList) port.loadDetallesAbastecimientos(variable1);
    Integer nEs = arr.size();
        DecimalFormat formato = new DecimalFormat("# 0.00");
         for(Integer i = 0; i < nEs; i++)
        {
           CompraProducto oCompraProducto = arr.get(i);
            strResult += "<tr>";
            strResult += "<td>" +oCompraProducto.getCantidad()+ "</td>";
            strResult += "<td>" + oCompraProducto.getDetallenombreproducto() + "</td>";
            strResult += "<td> $" + formato.format(oCompraProducto.getPrecioUnitario())+ "</td>";
            
            strResult += "<td> $ " + formato.format(oCompraProducto.getTotalAbastece())+ "</td>";
            strResult += "</tr>";
    }
        CompraProducto oCompraProducto = arr.get(1);
        strResult += "<td colspan='3'> SUBTOTAL</td><td colspan='3'> $ "+formato.format(oCompraProducto.getSubtotal())+"</td>";
        strResult += "<tr>";
        strResult += "<td colspan='3'> IVA </td><td colspan='3'> $ "+formato.format(oCompraProducto.getIva())+"</td>";
        strResult += "</tr>";
        strResult += "<tr>";
        strResult += "<td colspan='3'> TOTAL</td><td colspan='3'> $ "+formato.format(oCompraProducto.getTotal())+"</td>";
        strResult += "</tr>";
        strResult += "</table><br>";
         
        return strResult;
    }
        /////////
     @WebMethod(operationName = "getFacturaAbastecimiento")
    public String getFacturaAbastecimiento(@WebParam(name = "FacturaId") String FacturaId) 
    {        
        
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
       
        CompraProducto f = port.getFacturaAbastece(FacturaId);
        
         String result = "<table align='center' class='tabla_factura'    border='1'>";
        result += "<tr ><th  rowspan='2' colspan='4'>factime Alexandra</th></tr>";
        result += "<tr ></tr>";
        result += "<tr ><th>N&uacutemero</th><th colspan='3'>Proveedor</th></tr>";
        result += "<tr><td >" + f.getCompraNumero() + "</td><td colspan='3'>" +f.getNombreproveedor()  + "</td></tr>";
        result += "<tr ><th colspan='2'>Ruc</th></td><th colspan='2'>Fecha</th></tr>";
        result += "<tr ><td colspan='2'>" + f.getRuc() + "</td><td colspan='2'>"+f.getFecha() +"</td></tr>";
        result += "<tr ><th>CANTIDAD</th><th>PRODUCTO</th><th>V.UNITARIO</th><th>V. TOTAL </th></tr>";
        result += DetallesAbastecimientosss(f.getCompraNumero().toString());    
        result += "<tr>";
        
        result += "</table>";

        return result;
    }
    
    ///////////////////
    
     private String getProveedoresTableHeader1() 
     {
        String result;
        result = "<tr>";
        //result += "<th>Id</th>";
        result += "<th>Nombre</th>";
        result += "<th>Dirección</th>";
        result += "<th>Ciudad</th>";
        result += "<th>Total Facturas</th>";
        result += "</tr>";

        return result;
    } 
     
    private String getProveedoresTableRow1(Integer i, ProveedorFacturaAbastece pf)
    {
            String result;
            result = "<tr align='center'>";
            //result += "<td>" + pf.getProveedorid() + "</td>";
           result += "<td>" + pf.getProveedorNombre() + "</td>";
           result += "<td>" + pf.getProveedorDireccion() + "</td>";
           result += "<td>" + pf.getProveedorCiudad() + "</td>";
           result += "<td>" + pf.getTotalFacturasAbastece() + "</td>";
               
            result += "</tr>";
            return result;
    }
    
     @WebMethod(operationName = "listarFacturasconComprasAltas")
    public String listarFacturasconComprasAltas(Double ComprasAltas)
    {
        String result = "<table align='center' border='1'>";
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<ProveedorFacturaAbastece> arr = (ArrayList) port.listarFacturasconComprasAltas(ComprasAltas);
        Integer cont=0;
        Integer nEs = arr.size();
        if(nEs!=0)
        {
            
            result += this.getProveedoresTableHeader1();
        }
        for (int i = 0; i < nEs; i++) 
        {
            ProveedorFacturaAbastece pf = arr.get(i);
            result += this.getProveedoresTableRow1(i, pf);
            cont++;
        }
        
        result += "</table><br>";
        if(cont==0){
            result+= "<font color='red'>No existen facturas con compras mayores al valor ingresado </font><br><br>";
        }
        return result;
     }

 
        
    
    @WebMethod(operationName = "buscarProveedorEmpleado")
    public String buscarProveedorEmpleado(String strPalabraBuscar)
    {
       String strResult = "<table align='center' border='1'>";
    com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
    ArrayList<Proveedor> arr = (ArrayList) port.buscarProveedor(strPalabraBuscar);
    
    Integer nEs = arr.size();
     if("all".equals(strPalabraBuscar.toLowerCase()) || "todo".equals(strPalabraBuscar.toLowerCase()) || "todos".equals(strPalabraBuscar.toLowerCase()) )
        {
            strResult += this.listarProveedoresEmpleado();
        }
     else
     {
     if(strPalabraBuscar==null)
        {
            strResult ="";
        }
        
        
        else if(nEs==0)
        {
            strResult +="<font color='red'> Datos no encontrados </font><br><br>";    
        }
        
                      
        else
        {
            strResult += "<tr>";                
            strResult += "<th>RUC</th>";
            strResult += "<th>Nombre</th>";
            strResult += "<th> Cuidad</th>";
            strResult += "<th> Tel&eacute;fono</th>";
            strResult += "<th> Direcci&oacute;n</th>";
            strResult += "<th> Opci&oacute;n</th>";
            strResult += "</tr>";
            strResult += "<tr>";
            strResult += "<form method='post' action='ControladorRegistrarProveedorEmpleado.jsp' name='registrar'>";
            strResult += "<td><input type='text' name='ruc' size='13' maxlength='13' onkeypress='return soloNumeros(event)' required></td>";
            strResult += "<td><input type='text' name='nombre'  size='20' maxlength='30' onkeypress=' return soloLetras(event)' required></td>";
            strResult += "<td><input type='text' name='ciudad'  size='10' maxlength='30' onkeypress=' return soloLetras(event)' required></td>";
            strResult += "<td><input type='text' name='telefono'  size='12' maxlength='10' onkeypress='return soloNumeros(event)' required></td>";
            strResult += "<td><input type='text' name='direccion' size='25'  maxlength='50' onkeypress='return soloLetras(event)' required></td>";
        //strResult += "<td><input class='boton_verde' type='submit' name='registrar' value='Registrar'></td>";
            strResult += "<td><input type='image' src='tema/img/save.png' width='30' height='30'></td>";
            strResult += "</form></tr>";
        for(Integer i = 0; i < nEs; i++)
        {
            Proveedor oProveedor = arr.get(i);
            
            
            strResult += "<tr>";
            strResult += "<td>" + oProveedor.getProveedorRuc()+ "</td>";
            strResult += "<td>" + oProveedor.getProveedorNombre()+ "</td>";
            strResult += "<td>" + oProveedor.getProveedorCiudad()+ "</td>";           
            strResult += "<td>" + oProveedor.getTelefonoProveedor() + "</td>";            
            strResult += "<td>" + oProveedor.getProveedorDireccion()+ "</td>";
            strResult += "<td><a href='ModificarProveedoresEmpleado.jsp?proveedorruc="+ oProveedor.getProveedorRuc()+"'><img src='tema/img/edit.ico' width='30' height='30'></a></td>";
            strResult += "</tr>";
        }
       strResult += "</table><br>";
       
    }
     }
     return strResult;        
    }
    
    @WebMethod(operationName = "buscarProveedor")
    public String buscarProveedor(String strPalabraBuscar)
    {
       String strResult = "<table align='center' border='1'>";
    com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
    ArrayList<Proveedor> arr = (ArrayList) port.buscarProveedor(strPalabraBuscar);
    
    Integer nEs = arr.size();
     if("all".equals(strPalabraBuscar.toLowerCase()) || "todo".equals(strPalabraBuscar.toLowerCase()) || "todos".equals(strPalabraBuscar.toLowerCase()) )
        {
            strResult += this.listarProveedores();
        }
     else
     {
     if(strPalabraBuscar==null)
        {
            strResult ="";
        }
        
        
        else if(nEs==0)
        {
            strResult +="<font color='red'> Datos no encontrados </font><br><br>";    
        }
        
                      
        else
        {
            strResult += "<tr>";                
            strResult += "<th>RUC</th>";
            strResult += "<th>Nombre</th>";
            strResult += "<th> Cuidad</th>";
            strResult += "<th> Tel&eacute;fono</th>";
            strResult += "<th> Direcci&oacute;n</th>";
            strResult += "<th> Opci&oacute;n</th>";
            strResult += "</tr>";
            strResult += "<tr>";
            strResult += "<form method='post' action='ControladorRegistrarProveedor.jsp' name='registrar'>";
            strResult += "<td><input type='text' name='ruc' size='13' maxlength='13' onkeypress='return soloNumeros(event)' required></td>";
            strResult += "<td><input type='text' name='nombre'  size='20' maxlength='30'  required></td>";
            strResult += "<td><input type='text' name='ciudad'  size='10' maxlength='30' onkeypress=' return soloLetras(event)' required></td>";
            strResult += "<td><input type='text' name='telefono'  size='12' maxlength='10' onkeypress='return soloNumeros(event)' required></td>";
            strResult += "<td><input type='text' name='direccion' size='25'  maxlength='50'  required></td>";
        //strResult += "<td><input class='boton_verde' type='submit' name='registrar' value='Registrar'></td>";
            strResult += "<td><input type='image' src='tema/img/save.png' width='30' height='30'></td>";
            strResult += "</form></tr>";
        for(Integer i = 0; i < nEs; i++)
        {
            Proveedor oProveedor = arr.get(i);
            
            
            strResult += "<tr>";
            strResult += "<td>" + oProveedor.getProveedorRuc()+ "</td>";
            strResult += "<td>" + oProveedor.getProveedorNombre()+ "</td>";
            strResult += "<td>" + oProveedor.getProveedorCiudad()+ "</td>";           
            strResult += "<td>" + oProveedor.getTelefonoProveedor() + "</td>";            
            strResult += "<td>" + oProveedor.getProveedorDireccion()+ "</td>";
            //strResult += "<td><a href='ModificarProveedores.jsp?proveedorruc="+ oProveedor.getProveedorRuc()+"'>Modificar</a></td>";
            strResult += "<td><a href='ModificarProveedores.jsp?proveedorruc="+ oProveedor.getProveedorRuc()+"'><img src='tema/img/edit.ico' width='30' height='30'></a></td>";
            strResult += "</tr>";
        }
       strResult += "</table><br>";
       
    }
     }
     return strResult;        
    }
    // LISTAR EMPLEADO POR TIEMPO
    @WebMethod(operationName = "listarEmpleadoTiempo")
    public String listarEmpleadoTiempo()
    {
        String result = "<table align='center' border='1'>";
         com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<Empleado> arr = (ArrayList) port.listarEmpleadoTiempo();
        Integer nEs = arr.size();
        //Integer id = 0;
        //Double suma=0.0;
        /*if(fecha==null)
        {
            result ="";
        }*/
        if(nEs==0)
        {
            result +="<font color='red'>No existen empleados </font><br><br>";
        }
                            
        else
        {
            result += "<tr>";
                
                //result += "<th> C&eacute;dula</th>";
                result += "<th> Nombre</th>";
                result += "<th> Apellido</th>";
                result += "<th> Fecha de Ingreso</th>";
                result += "<th> Dias Laborados </th>";
                result += "</tr>";
            for(Integer i = 0; i < nEs; i++)
            {
                Empleado oEmpleado = arr.get(i);
                                
                result += "<tr>";
                
                result += "<td>" + oEmpleado.getEmpleadoNombre()+ "</td>";
                result += "<td>" + oEmpleado.getEmpleadoApellido()+ "</td>";
                result += "<td>" + oEmpleado.getEmpleadoIngresoFecha()+ "</td>";
                result += "<td>" + oEmpleado.getEmpleadoTiempo()+ "</td>";
                result += "</tr>";
                
            }
            result += "</table><br><br><br>";
            result += "<br><br>";
        }
       
       return result;
    }
    
    
    //INICIO LISTAR PROVEEDORES
    private String getProveedoresTableHeader() 
     {
        String result;

        result = "<tr>";
        result += "<th>N&uacutemero</th>";
        result += "<th>RUC</th>";
        result += "<th>Nombre</th>";
        result += "<th>Ciudad</th>";
        result += "<th>Dirección</th>";
        //result += "<th>No. Compras</th>";
        result += "</tr>";

        return result;
    }
    
   
        @WebMethod(operationName = "listarProveedoresEmpleado")
    public String listarProveedoresEmpleado() 
    {        
        String result = "<table align='center' border='1'>";       
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<Proveedor> arr = (ArrayList) port.listarProveedor();
        Integer nEs = arr.size();
        /*if(nEs!=0)
        {
            result += this.getProveedoresTableHeader();
        }*/
        if(nEs==0)
        {
            result +="<font color='red'>Datos no encontrados</font>";
        }
        
        result += "<tr>";
        result += "<th>RUC</th>";
        result += "<th>Nombre</th>";
        result += "<th>Ciudad</th>";
        result += "<th> Tel&eacute;fono</th>";
        result += "<th> Direcci&oacute;n</th>";
        result += "<th> Opci&oacute;n</th>";
        result += "</tr>";
        result += "<tr>";
        result += "<form method='post' action='ControladorRegistrarProveedor.jsp' name='registrar'>";
        result += "<td><input type='text' name='ruc' size='13' maxlength='13' onkeypress='return soloNumeros(event)' required></td>";
        result += "<td><input type='text' name='nombre'  size='20' maxlength='30'  required></td>";
        result += "<td><input type='text' name='ciudad'  size='10' maxlength='30' required></td>";
        result += "<td><input type='text' name='telefono'  size='12' maxlength='10' onkeypress='return soloNumeros(event)'  required></td>";
        result += "<td><input type='text' name='direccion' size='25'  maxlength='50'  required></td>";
        //result += "<td><input class='boton_verde' type='submit' name='registrar' value='Registrar'></td>";
        result += "<td><input type='image' src='tema/img/save.png' width='30' height='30'></td>";
        result += "</form></tr>";
        
        for (int i = 0; i < nEs; i++) {
            Proveedor c = arr.get(i);
            result += this.getProveedoresEmpleadoTableRow(i, c);
        }
        result += "</table><br>";
        return result;

    }
    
    private String getProveedoresEmpleadoTableRow(Integer i, Proveedor c) {
          
       String result;
        result = "<tr align='center'>";
        //result += "<td>" + c.getProveedorId()+ "</td>";
        result += "<td>" + c.getProveedorRuc() + "</td>";
        result += "<td>" + c.getProveedorNombre() + "</td>";
        result += "<td>" + c.getProveedorCiudad() + "</td>";        
        result += "<td>"+ c.getTelefonoProveedor() +"</td>" ; 
        result += "<td>" + c.getProveedorDireccion()+ "</td>";
        //result += "<td><a href='ModificarProveedores.jsp?proveedorruc="+ c.getProveedorRuc()+"'>Modificar</a></td>";
        result += "<td><a href='ModificarProveedoresEmpleado.jsp?proveedorruc="+ c.getProveedorRuc()+"'><img src='tema/img/edit.ico' width='30' height='30'></a></td>";
        result += "</tr>";

        return result;
    }
    
       
    @WebMethod(operationName = "listarProveedores")
    public String listarProveedores() 
    {        
        String result = "<table align='center' border='1'>";       
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<Proveedor> arr = (ArrayList) port.listarProveedor();
        Integer nEs = arr.size();
        /*if(nEs!=0)
        {
            result += this.getProveedoresTableHeader();
        }*/
        if(nEs==0)
        {
            result +="<font color='red'>Datos no encontrados</font>";
        }
        
        result += "<tr>";
        result += "<th>RUC</th>";
        result += "<th>Nombre</th>";
        result += "<th>Ciudad</th>";
        result += "<th> Tel&eacute;fono</th>";
        result += "<th> Direcci&oacute;n</th>";
        result += "<th> Opci&oacute;n</th>";
        result += "</tr>";
        result += "<tr>";
        result += "<form method='post' action='ControladorRegistrarProveedor.jsp' name='registrar'>";
        result += "<td><input type='text' name='ruc' size='13' maxlength='13' onkeypress='return soloNumeros(event)' required></td>";
        result += "<td><input type='text' name='nombre'  size='20' maxlength='30'  required></td>";
        result += "<td><input type='text' name='ciudad'  size='10' maxlength='30' onkeypress=' return soloLetras(event)' required></td>";
        result += "<td><input type='text' name='telefono'  size='12' maxlength='10' onkeypress='return soloNumeros(event)'  required></td>";
        result += "<td><input type='text' name='direccion' size='25'  maxlength='50'  required></td>";
        //result += "<td><input class='boton_verde' type='submit' name='registrar' value='Registrar'></td>";
        result += "<td><input type='image' src='tema/img/save.png' width='30' height='30'></td>";
        result += "</form></tr>";
        
        for (int i = 0; i < nEs; i++) {
            Proveedor c = arr.get(i);
            result += this.getProveedoresTableRow(i, c);
        }
        result += "</table><br>";
        return result;

    }
    
    private String getProveedoresTableRow(Integer i, Proveedor c) {
          
       String result;
        result = "<tr align='center'>";
        //result += "<td>" + c.getProveedorId()+ "</td>";
        result += "<td>" + c.getProveedorRuc() + "</td>";
        result += "<td>" + c.getProveedorNombre() + "</td>";
        result += "<td>" + c.getProveedorCiudad() + "</td>";        
        result += "<td>"+ c.getTelefonoProveedor() +"</td>" ; 
        result += "<td>" + c.getProveedorDireccion()+ "</td>";
        //result += "<td><a href='ModificarProveedores.jsp?proveedorruc="+ c.getProveedorRuc()+"'>Modificar</a></td>";
        result += "<td><a href='ModificarProveedores.jsp?proveedorruc="+ c.getProveedorRuc()+"'><img src='tema/img/edit.ico' width='30' height='30'></a></td>";
        result += "</tr>";

        return result;
    }
    //FIN LISTAR PROVEEDORES
    
    
    
    //Inicio Listar Facturas
    
    private String getFacturasTableRow1(Integer i,Factura f) {
          
        String result;
        DecimalFormat formato = new DecimalFormat("# 0.00");
        result = "<tr>";
        result += "<td>" + f.getFacturanumero() + "</td>";
        result += "<td>" + f.getFacturaclientecedula() + "</td>";
        result += "<td>" + f.getFacturaclientenombre() + "</td>";
        result += "<td>" + f.getFacturaclienteapellido() + "</td>";
        result += "<td>" + f.getFacturafechacompra() + "</td>";
        result += "<td> $" + formato.format(f.getFacturatotal()) + "</td>";  
        result += "<td><a href='ListarFactura.jsp?id=" + f.getFacturanumero().toString() + "'><img tittle='ver detalle' alt='ver detalle' src='tema/img/detalle.png' width='30' height='30'></a></td>";       
        result += "</tr>";
        
        return result;
    }
    
    
    //listar todas las facturas 
    @WebMethod(operationName = "listarFactura")
    public String listarFactura(){ 
       String resul = "<table class=\"table table-hover\">";
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<Factura> ArrayFacturas = (ArrayList) port.listarFactura();
        Integer nFs = ArrayFacturas.size();
        if(nFs!=0)
        {
            resul += this.getFacturaTableHeader();
        }
        if(nFs==0)
        {
            resul +="<font color='red'>Datos no encontrados</font>";
        }
        for (int i = 0; i < nFs; i++) {
            Factura f = ArrayFacturas.get(i);
            resul += this.getFacturasTableRow1(i,f);
        }
        resul += "</table>";
        return resul;
        
    }
    //Fin Listar Facturas
    
    //Listar facturas no anuladas iteracion 7
     @WebMethod(operationName = "listarFacturasNoAnuladas")
    public String listarFacturasNoAnuladas(Integer mes, Integer anio)
    {
        String result = "<table border='1' align='center'>";
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<Factura> arr = (ArrayList) port.listarFacturasNoAnuladas(mes,anio);
        Integer nEs = arr.size();
        Integer id = 0;
        if(nEs==0)
        {
            result +="<font color='red'>Facturas no encontradas</font>";
        }
        else
        {
            
            result += "<tr>";
                result += "<th WIDTH='5' HEIGHT='30'> N° Factura</th>";
                result += "<th WIDTH='70' HEIGHT='30'> C&eacute;dula</th>";
                result += "<th WIDTH='200' HEIGHT='30'> Nombre </th>";
                result += "<th WIDTH='200' HEIGHT='30'> Apellido</th>";
                result += "<th WIDTH='200' HEIGHT='30'> Fecha de Compra</th>";
               // result += "<th WIDTH='20' HEIGHT='30'> Subtotal</th>";
                //result += "<th WIDTH='200' HEIGHT='00'> Iva</th>";
                result += "<th  WIDTH='200' HEIGHT='30'> Total</th>";
                result += "<th WIDTH='100' HEIGHT='30'>Anular Factura</th>";
                result += "</tr>";
            DecimalFormat formato = new DecimalFormat("# 0.00");
            for(Integer i = 0; i < nEs; i++)
            {
                Factura oFactura = arr.get(i);
                id = i+1;
                
                result += "<tr align='center' bgcolor='#CEF6D8'>";
                result += "<td>" + oFactura.getFacturanumero()+ "</td>";
                result += "<td>" + oFactura.getClienteCedula()+ "</td>";
                result += "<td>" + oFactura.getClienteNombre() + "</td>";
                result += "<td>" + oFactura.getClienteApellido() + "</td>";
                result += "<td>" + oFactura.getFacturafechacompra() + "</td>";
              //  result += "<td> $ " + oFactura.getFacturasubtotal()+"</td>";
                //result += "<td> $ " + oFactura.getFacturaiva()+"</td>";
                result += "<td align='right'> $ " + formato.format(oFactura.getFacturatotal())+"</td>";
                result += "<td><a href='ControladorAnularFactura.jsp?idFactura="+oFactura.getFacturanumero().toString()+"' onmouseDown='alert('Factura anulada')'>Anular</a></td>";
                result += "</tr>";
            }
        }
       result += "</table><br>";
       return result;
    }
    ////Modificar estado de la factura iteracion 7
     @WebMethod(operationName = "CambiarEstadoFactura")
    public String CambiarEstadoFactura(Integer estado){
         com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();        
        return port.cambiarEstadoFactura(estado);
    }

    public String borraDetalle() {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        return port.borraDetalle();
    }
   //Inicio Ingresar Proveedor
      @WebMethod(operationName = "ingresarProveedor")
    public String ingresarProveedor(Proveedor oProveedor){
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        String strResult = port.ingresarProveedor(oProveedor);
        return strResult;
    }
    
    
    //Fin Ingresar Proveedor 
    
    
     ////////////////////////////////////////////////////////////
   ///////////////MODIFICAR PROVEEDOR/////////////////////////
   //////////////////////////////////////////////////////////
    
  
  
    
    @WebMethod(operationName = "modificarProveedor")
    public String modificarProveedor(Proveedor oProveedor, TelefonoProveedor oTelefonoProveedor) {
        
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        return port.modificarProveedor(oProveedor, oTelefonoProveedor);
    }
    
    
     private String getProveedoresTableHeaderPro() 
     {
  
        String result = "<tr>";
        result += "<th>Id</th>";
        result += "<th>Ruc</th>";
        result += "<th>Nombre</th>";
        result += "<th>Dirección</th>";
        result += "<th>Ciudad</th>";
        result += "<th>Editar</th>";
        result += "</tr>";

        return result;
    }
    
    
     private String getProveedoresTableRowPro(Integer i, Proveedor p) {
          
        String result;
        result = "<tr>";
        //result += "<td>" + p.getProveedorId() + "</td>";
        result += "<td>" + p.getProveedorRuc() + "</td>";
        result += "<td>" + p.getProveedorNombre() + "</td>";
        result += "<td>" + p.getProveedorDireccion() + "</td>";
        result += "<td>" + p.getProveedorCiudad() + "</td>";
        result += "<td><a href='ModificarProveedores.jsp?proveedorruc=" + p.getProveedorRuc() + "'>Editar</a></td>";       
        result += "</tr>";
        
        return result;
        
    }
   
    
    @WebMethod(operationName = "listarProveedores2")
    public String listarProveedores2(){ 
       String result = "<table align='center' border='1'>";
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<Proveedor> ArrProveedor = (ArrayList) port.listarProveedor();
        
        Integer nPs = ArrProveedor.size();
        
        if(nPs!=0)
        {
            result += this.getProveedoresTableHeaderPro();
        }
        if(nPs==0)
        {
            result +="<font color='red'>Datos no encontrados</font>";
        }
        for (int i = 0; i < nPs; i++)
        
        {
            Proveedor p = ArrProveedor.get(i);
            result += this.getProveedoresTableRowPro(i,p);
        }
        result += "</table><br>";
        return result;
        
    }
    ///////////////FIN MODIFICAR PROVEEDOR/////////////////////////
  
 ///////////////MODIFICAR PRODUCTO//////////////////////////
    //LISTAR LOS PRODUCTOS DISPONIBLES   ListarModificarProducto.jsp
    private String getProductosModificarTable() 
     {
        String result;
        String marcas = listarMarcas();
        String procedencias = listarProcedencias();

        result = "<tr>";
        result += "<th>Código</th>";
        result += "<th>Descripción</th>";
        result += "<th>Linea</th>";
        result += "<th>Grupo</th>";
        result += "<th>Stock</th>";
        result += "<th>Precio</th>";
        result += "<th>Tipo</th>";
        result += "<th>Imagen</th>";
        result += "<th>Opciones</th>";
        result += "</tr>";        
       
        result += "<tr>";
        result += "<form method='post' action='controladorIngresarProducto.jsp' name='registrar'>";
        result += "<td><input type='text' size='6' name='codigo' maxlength='6' required></td>";
        result += "<td><input type='text' name='descripcion' maxlength='50' required ></td>";        
        result += "<td>" + procedencias + "</td>";
        result += "<td>" + marcas + "</td>";
        result += "<td><input type='number' size='3' name='stock'  min='0' max='1000' step='1'  required></td>";
        result += "<td><input type='number' size='3' name='precio'  min='0' max='1000' step='0.01'  required></td>";
        result += "<td> <select  name ='tipo'>\n" +
    "  <option value=\"ORIGINAL\">ORIGINAL</option>\n" +
"  <option value=\"GENERICO\">GENERICO</option>\n" +
"</select> </td>";
        result += "<td><img src='tema/img/incognita.png' width='30' height='30'></td>";
        result += "<td><input type='image' src='tema/img/save.png' width='30' height='30'></td>";
        result += "</form></tr>";
        return result;
    }
       
 @WebMethod(operationName = "ProductosModificar")
    public String ProductosModificar(@WebParam(name = "Busqueda") String Busqueda, Integer tipo) 
    {        
        String resul = "<table class=\"table table-striped\">";
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
       
        ArrayList<Producto> arr = (ArrayList) port.buscarProducto(Busqueda);
        Integer nEs = arr.size();
        if("all".equals(Busqueda.toLowerCase()) || "todo".equals(Busqueda.toLowerCase()) || "todos".equals(Busqueda.toLowerCase()))
        {
            resul += this.Productos();
        }
        else
        {
            if(nEs!=0)
            {
                resul += this.getProductosModificarTable();
            }
            if(nEs==0)
            {
                resul +="<font color='red'>Datos no encontrados</font>";
            }
            for (int i = 0; i < nEs; i++) 
            {
                Producto p = arr.get(i);
                resul += this.ProductosTableRow(i, p,0);
            }
            resul += "</table><br>";
        }
      return resul;
    }
   //FIN LISTAR LOS PRODUCTOS
    //////////////////////////////////////////
    
    
    ///////////////MODIFICAR PRODUCTO//////////////////////////
    //LISTAR LOS PRODUCTOS DISPONIBLES   ListarModificarProducto.jsp

       
 @WebMethod(operationName = "LoadProductos")
    public ArrayList<Producto> LoadProductos() 
    {        
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<Producto> arr = (ArrayList) port.loadProductos();
        return (ArrayList<Producto>) port.loadProductos();
    }
   //FIN LISTAR LOS PRODUCTOS
    //////////////////////////////////////////
    
    
    //buscar productos por su marca o linea
     @WebMethod(operationName = "BuscarProductosVariable")
    public ArrayList<Producto> BuscarProductosVariable(String variable) 
    {        
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<Producto> arr = (ArrayList) port.buscarProductosVariable(variable);
        return (ArrayList<Producto>) port.buscarProductosVariable(variable);
    }
    
    //listar todos los proveedores
     @WebMethod(operationName = "loadProveedor")
    public ArrayList<Proveedor> loadProveedor(){   
    com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
    return (ArrayList<Proveedor>) port.listaProveedores();
    }
    //load clientes 
   @WebMethod(operationName = "loadClientes")
    public ArrayList<Cliente> listarClientes(){   
    com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
    return (ArrayList<Cliente>) port.loadClientes();
    }
//fin load clientes
    
    //load compras
     @WebMethod(operationName = "loadCompra")
    public ArrayList<Compra> loadCompra(){   
    com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
    return (ArrayList<Compra>) port.loadCompra();   
    }
    //fin load compras
    
      /*  //listar proveedor
      @WebMethod(operationName = "LoadDetallesAbastecimientos")
    public CompraProducto LoadDetallesAbastecimientoss(@WebParam Integer id){
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        return port.lo
                
                
                
                }*/
    
    
    
    
    private String ProductosTableRow(Integer i, Producto p, Integer tipo) {
          
        String result;
        DecimalFormat formato = new DecimalFormat("# 0.00");
        result = "<tr>";
        result += "<td>" + p.getProductoCodigo() + "</td>";
        result += "<td>" + p.getProductoDescripcion() + "</td>";        
        result += "<td>" + p.getProductoProcedenciaDescripcion() + "</td>"; 
        result += "<td>" + p.getProductoMarcaDescripcion() + "</td>";
        result += "<td>" + p.getProductoStock() + "</td>"; 
        result += "<td> $ " + formato.format(p.getProductoPrecioUnitario()) + "</td>";
        result += "<td>"+p.getTipo()+"</td>";
        //
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<Imagen> arj = (ArrayList) port.buscarImagen(p.getProductoCodigo(),tipo);
        Integer nImg = arj.size();
                for(Integer j = 0; j < 1; j++)
        {          
            if(nImg.equals(0))
            {                
                result += "<td><a href='#'><img src='tema/img/incognita.png' width='30' height='30'></a></td>";             
            }
            else
            {Imagen im = arj.get(j);
            result += "<td><a href='#'><img src='"+im.getNombre()+"' width='30' height='30'></a></td>";
                
            }
        }       
        //esult += "<td><a href='#?id="+ p.getProductoId()+"'><img src='tema/img/Incognita2.png' width='30' height='30'></a></td>";
        result += "<td><a href='ModificarProducto.jsp?id="+ p.getProductoId()+"&cod="+ p.getProductoCodigo()+"'><img src='tema/img/edit.ico' width='30' height='30'></a></td>";
       result += "</tr>";
        return result;
    }

    
    //Mostrar datos de un producto dado su id para su modificacion
     @WebMethod(operationName = "MostrarModificarP")
    public String MostrarModificarP(String id)     {        
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        Producto p = port.buscarProductoAModificar(id);
               String result = "<label>Descripción</label><br>";
        result += "<input name='descripcion' value='"+ p.getProductoDescripcion() +"' class='form-control border-input' type='text' size='30' required ><br>";
        
        result += "<label>Linea</label><br>";
        result += "<select class='form-control border-input' name='procedencia'>";
        ArrayList<Procedencia> ar = (ArrayList) port.listarProcedencias();
        Integer nProcedencias = ar.size();
        //result += "<option selected>"+ p.getProductoProcedenciaId() + ">"+p.getProductoProcedenciaDescripcion()+"</option>";
        for(Integer i = 0; i < nProcedencias; i++)
        {
            Procedencia oProcedencia = ar.get(i);
            if(p.getProductoProcedenciaId() == oProcedencia.getProductoProcedenciaId())
            {
                result += "<option selected value=" + oProcedencia.getProductoProcedenciaId() + ">"+oProcedencia.getProductoProcedenciaDescripcion()+"</option>";
            }
            else
            {
            result += "<option value=" + oProcedencia.getProductoProcedenciaId() + ">"+oProcedencia.getProductoProcedenciaDescripcion()+"</option>";
            }
        }
       result += "</select>";
       
       result += "<br>";
       
               result += "<label>Grupo</label><br>";
        result += "<select name='marca' class='form-control border-input'>";
        ArrayList<Marca> arr = (ArrayList) port.listarMarcas();
        Integer nMarcas = arr.size();
        for(Integer i = 0; i < nMarcas; i++)
        {
            Marca oMarca = arr.get(i);
            if(p.getProductoMarcaId() == oMarca.getProductoMarcaId())
            {
                 result += "<option selected value=" + oMarca.getProductoMarcaId() + ">"+oMarca.getProductoMarcaDescripcion()+"</option>";
            }
            else
            {
                 result += "<option value=" + oMarca.getProductoMarcaId() + ">"+oMarca.getProductoMarcaDescripcion()+"</option>";
            }
        }
       result += "</select>";
       result += "<br>";
       //
        result += "<label>Tipo</label><br>";
        result += "<select name='tipo' class='form-control border-input'>";
          
           
            if(("ORIGINAL       ".equals(p.getTipo()))||(" ORIGINAL      ".equals(p.getTipo())))
            {
                 result += "<option selected value='"+p.getTipo()+"'>"+p.getTipo()+"</option>";
                 result += "<option value='GENERICO'>GENERICO</option>";
            }
            if(("GENERICO       ".equals(p.getTipo()))||(" GENERICO      ".equals(p.getTipo())))
            {
                 result += "<option selected value='"+p.getTipo()+"'>"+p.getTipo()+"</option>";
                 result += "<option  value='ORIGINAL'>ORIGINAL</option>";
            }
        
       result += "</select>";
       result += "<br>";
       
               result += "<label>Precio</label><br>";
        result += "<input class='form-control border-input' name='precio' value='"+ p.getProductoPrecioUnitario()  +"' type='number' size='30'  min='0' max='1000' step='0.01' required><br>";
        result += "<label>Stock</label><br>";
        result += "<input class='form-control border-input' name='stock' value='"+ p.getProductoStock() +"' size='10' readonly='readonly'><br>";                    
      //
      result += "<label>Descripcion Larga</label><br>";
       result += " <textarea rows=\"4\" cols=\"50\" name=\"destxt\" >"+p.getTexto()+"</textarea>";
       result += "<br>";
       //
        result += "<input name='id' value='"+ p.getProductoId()+"' type='hidden' size='10' readonly='readonly'><br>";
        result += "<center>";
        result += "<input class='btn btn-info btn-fill btn-wd' name='Guardar' value='Guardar' type='submit'>";        
        result += "</center>";
        result += "<div class='clearfix'>";
        result += "</div>";
        result += "<input name='codigo' value='"+ p.getProductoCodigo()+ "' type='hidden' size='30' readonly='readonly'><br>";
       
       // result += "</form>";
        return result;

           
    }
    //imagen
    @WebMethod(operationName = "MostrarModificarImagenPrincipal")
    public String MostrarModificarImagenPrincipal(String id,String cod,Integer tipo)     {        
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<Imagen> ar = (ArrayList) port.buscarImagen(cod, tipo);
        Integer nImg = ar.size();
        String rutaf;
        String result = " <table border=\"0\">";
        
                for(Integer i = 0; i < 1; i++)
        {          
            if(nImg.equals(0))
            {                
                result += " <tr>";             
                result += " <td>Imagen</td>";       
                result += "<td> <input type=\"file\" name=\"txtfile\" value=\"\" size=\"50\" /accept=\"image/*\"></td>";
                result += "<td><input class='btn btn-info btn-fill btn-wd' name='Guardar' value='Guardar' type='submit'> </td>";               
            }
            else
            {
            Imagen p = ar.get(i);
            result += " <tr>";             
                result += " <td>Imagen </td><td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>";       
                result += "<td><img src='"+p.getNombre()+"' width='120' height='120'></td>";
                result +="<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>";result +="<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>";
               rutaf=p.getRutafisica();
                result += "<td><a href='ControladorEliminarImg.jsp?tipo="+tipo+"&id="+id+"&fileurl="+p.getRutafisica()+"&cod="+cod+" '><img src='tema/img/eliminar.jpg' width='35' height='35'></a></td>";
                
            }
        }    
        result +="</table>";
        return result;

           
    }

    @WebMethod(operationName = "ModificarProducto")
    public String ModificarProducto(Integer id, String codigo, String descripcion, Integer marcaid, Integer procedenciaid, Double preciou, Integer stock,String tipo,String texto){
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        String strResult = port.modificarProducto(id,codigo,descripcion, marcaid, procedenciaid, preciou, stock,tipo,texto);
        return strResult;
    }
    
    
     //Inicio Ingresar Proveedor
      @WebMethod(operationName = "ingresarImgP")
    public String ingresarImgP(Imagen oImagen){
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        String strResult = port.ingresarImgP(oImagen);
        return strResult;
    }
     //eliminar ruta de imagen
      @WebMethod(operationName = "elimibarRutaImgP")
    public String eliminarRutaImgP(Imagen oImagen){
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        String strResult = port.eliminarRutaImgP(oImagen);
        return strResult;
    }
    
    ///////////////FIN MODIFICAR PRODUCTO////////////////////// 
    
 /*Unir PRODUCTOS*/
  @WebMethod(operationName = "Productos")
    public String Productos(){
        String result = "<center><table border='1'>";
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<Producto> arr = (ArrayList) port.listarProductos();
        Integer nEs = arr.size();
        Integer id = 0;
        String marcas=listarMarcas();
        String procedencias=listarProcedencias();
        result += "<tr>";
            result += "<th> C&oacute;digo</th>";
            result += "<th> Descripci&oacute;n </th>";
            result += "<th> Linea </th>";
            result += "<th> Grupo </th>";
            result += "<th> Stock </th>";
            result += "<th> Precio</th>";
            result += "<th> Opciones</th>";
            result += "</tr>";
            result += "<tr>";
            result += "<form method='post' action='controladorIngresarProducto.jsp' name='registrar'>";
            result += "<td><input type='text' size='6' name='codigo' maxlength='6' required></td>";
            result += "<td><input type='text' name='descripcion' maxlength='50' required ></td>";
            result += "<td WIDTH='100'>" + marcas + "</td>";
            result += "<td WIDTH='40'>" + procedencias + "</td>";
            result += "<td><input type='number' size='3' name='stock'  min='0' max='100' step='1'  required></td>";
            result += "<td><input type='number' size='3' name='precio'  min='0' max='500' step='0.01'  required></td>";
            result += "<td><input type='image' src='tema/img/save.png' width='30' height='30'></td>";
            result += "</form></tr>";
            DecimalFormat formato = new DecimalFormat("# 0.00");
        for(Integer i = 0; i < nEs; i++)
        {
            Producto oProducto = arr.get(i);
            id = i+1;
            result += "<tr>";
            result += "<td>" + oProducto.getProductoCodigo()+ "</td>";
            result += "<td>" + oProducto.getProductoDescripcion() + "</td>";
            result += "<td>" + oProducto.getProductoMarcaDescripcion() + "</td>";
            result += "<td>" + oProducto.getProductoProcedenciaDescripcion() + "</td>";
            result += "<td>" + oProducto.getProductoStock()+"</td>";
            result += "<td> $ " + formato.format(oProducto.getProductoPrecioUnitario())+"</td>";
            result += "<td><a href='ModificarProducto.jsp?id="+ oProducto.getProductoId()+"'><img src='tema/img/edit.ico' width='30' height='30'></a></td>";
            result += "</tr>";
        }
       result += "</table></center><br>";
       return result;
    }
/*fin unir */    
/*Ver productos como cliente*/
     
  @WebMethod(operationName = "ProductoscomoCliente")
    public String ProductoscomoCliente(){
        String result = "<center><table border='1'>";
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<Producto> arr = (ArrayList) port.listarProductos();
        Integer nEs = arr.size();
        Integer id = 0;
          result += "<tr>";
            result += "<th WIDTH='150'> C&oacute;digo</th>";
            result += "<th WIDTH='300'> Descripci&oacute;n </th>";
            result += "<th  WIDTH='150'> Marca </th>";
            result += "<th WIDTH='150'> Procedencia </th>";
            result += "<th WIDTH='150'> Precio Unitario</th>"; 
            DecimalFormat formato = new DecimalFormat("# 0.00");
        for(Integer i = 0; i < nEs; i++)
        {
            Producto oProducto = arr.get(i);
            id = i+1;
            result += "<tr>";
            result += "<td>" + oProducto.getProductoCodigo()+ "</td>";
            result += "<td>" + oProducto.getProductoDescripcion() + "</td>";
            result += "<td>" + oProducto.getProductoMarcaDescripcion() + "</td>";
            result += "<td>" + oProducto.getProductoProcedenciaDescripcion() + "</td>";
           
            result += "<td> $ " + formato.format(oProducto.getProductoPrecioUnitario())+"</td>";           
            result += "</tr>";
        }
       result += "</table></center><br>";
       return result;
    }
/*Fin de ver productos como cliente*/    

    /*Ver productos como empleado*/
   @WebMethod(operationName = "ProductoscomoEmp")
    public String ProductoscomoEmp(){
        String result = "<center><table border='1'>";
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<Producto> arr = (ArrayList) port.listarProductos();
        Integer nEs = arr.size();
        Integer id = 0;
          result += "<tr>";
            result += "<th WIDTH='150'> C&oacute;digo</th>";
            result += "<th WIDTH='300'> Descripci&oacute;n </th>";
            result += "<th WIDTH='150'> Linea </th>";
            result += "<th WIDTH='150'> Grupo </th>";
            result += "<th WIDTH='150'> Stock </th>";
            result += "<th WIDTH='150'> Precio Unitario</th>"; 
            DecimalFormat formato = new DecimalFormat("# 0.00");
        for(Integer i = 0; i < nEs; i++)
        {
            Producto oProducto = arr.get(i);
            id = i+1;
            result += "<tr>";
            result += "<td>" + oProducto.getProductoCodigo()+ "</td>";
            result += "<td>" + oProducto.getProductoDescripcion() + "</td>";
            result += "<td>" + oProducto.getProductoMarcaDescripcion() + "</td>";
            result += "<td>" + oProducto.getProductoProcedenciaDescripcion() + "</td>";
            result += "<td>" + oProducto.getProductoStock()+"</td>";
            result += "<td> $ " + formato.format(oProducto.getProductoPrecioUnitario())+"</td>";           
            result += "</tr>";
        }
       result += "</table></center><br>";
       return result;
    }
/*Fin de ver productos como cliente*/    
    
/*Buscar productos como CLIENTE*/
    @WebMethod(operationName = "ProductosBuscar")
    public String ProductosBuscar(@WebParam(name = "Busqueda") String Busqueda) 
    {        
        String resul = "<center><table border='1'>";
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
       
        ArrayList<Producto> arr = (ArrayList) port.buscarProducto(Busqueda);
        Integer nEs = arr.size();

            resul += "</tr>";
        if("all".equals(Busqueda.toLowerCase()) || "todo".equals(Busqueda.toLowerCase()) || "todos".equals(Busqueda.toLowerCase()))
        {
            resul += this.Productos();
        }
        else
        {
            if(nEs!=0)
            {
            resul += "<tr>";
            resul += "<th WIDTH='150'> C&oacute;digo</th>";
            resul += "<th WIDTH='300'> Descripci&oacute;n </th>";
            resul += "<th WIDTH='150'> Marca </th>";
            resul += "<th WIDTH='150'> Procedencia </th>";
            resul += "<th WIDTH='150'> Precio Unitario</th>";    
                for (int i = 0; i < nEs; i++) 
                {
                    Producto p = arr.get(i);
                    resul += this.ProductosparaCliente(i, p);
                }
            }
            if(nEs==0)
            {
                resul +="<font color='red'>Datos no encontrados</font>";
            }
            
            resul += "</table></center><br>";
        }
      return resul;
    }
   
    private String ProductosparaCliente(Integer i, Producto p) {
          
        String result;
        DecimalFormat formato = new DecimalFormat("# 0.00");
        result = "<tr>";
        result += "<td>" + p.getProductoCodigo() + "</td>";
        result += "<td>" + p.getProductoDescripcion() + "</td>";
        result += "<td>" + p.getProductoMarcaDescripcion() + "</td>";
        result += "<td>" + p.getProductoProcedenciaDescripcion() + "</td>"; 
        result += "<td> $ " + formato.format(p.getProductoPrecioUnitario()) + "</td>";
        
        result += "</tr>";
        return result;
    }
/*Fin de buscar productos como cliente*/  
    
/*Buscar productos como EMPLEADO*/
    @WebMethod(operationName = "ProductosBuscarEmp")
    public String ProductosBuscarEmp(@WebParam(name = "Busqueda") String Busqueda) 
    {        
        String resul = "<center><table border='1'>";
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
       
        ArrayList<Producto> arr = (ArrayList) port.buscarProducto(Busqueda);
        Integer nEs = arr.size();

            resul += "</tr>";
        if("all".equals(Busqueda.toLowerCase()) || "todo".equals(Busqueda.toLowerCase()) || "todos".equals(Busqueda.toLowerCase()))
        {
            resul += this.ProductoscomoCliente();
        }
        else
        {
            if(nEs!=0)
            {
            resul += "<tr>";
            resul += "<th WIDTH='150'> C&oacute;digo</th>";
            resul += "<th WIDTH='300'> Descripci&oacute;n </th>";
            resul += "<th WIDTH='150'> Marca </th>";
            resul += "<th WIDTH='150'> Procedencia </th>";
            resul += "<th WIDTH='150'> Stock </th>";
            resul += "<th WIDTH='150'> Precio Unitario</th>";    
                for (int i = 0; i < nEs; i++) 
                {
                    Producto p = arr.get(i);
                    resul += this.ProductosparaEmp(i, p);
                }
            }
            if(nEs==0)
            {
                resul +="<font color='red'>Datos no encontrados</font>";
            }
            
            resul += "</table></center><br>";
        }
      return resul;
    }
   
    private String ProductosparaEmp(Integer i, Producto p) {
          
        String result;
        DecimalFormat formato = new DecimalFormat("# 0.00");
        result = "<tr>";
        result += "<td>" + p.getProductoCodigo() + "</td>";
        result += "<td>" + p.getProductoDescripcion() + "</td>";
        result += "<td>" + p.getProductoMarcaDescripcion() + "</td>";
        result += "<td>" + p.getProductoProcedenciaDescripcion() + "</td>"; 
        result += "<td>" + p.getProductoStock() + "</td>"; 
        result += "<td> $ " + formato.format(p.getProductoPrecioUnitario())+ "</td>";
        
        result += "</tr>";
        return result;
    }
/*Fin de buscar productos como empleado*/  
    
    

    
    @WebMethod(operationName = "ListarProveedoresCompra")
    public String ListarProveedoresCompra(String Idproveedor)
    {
        String result = "<select class=\"form-control border-input\"  name='proveedor'>";
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
          ArrayList<Proveedor> arr = (ArrayList) port.listaProveedores();
        Integer nProcedencias = arr.size(); 
        if(Idproveedor==null)
        {
            for(Integer i = 0; i < nProcedencias; i++)
            {
                Proveedor oProveedor = arr.get(i);
                result += "<option value=" + oProveedor.getProveedorId() + ">"+oProveedor.getProveedorNombre()+"</option>";

            }
        }
        else
        {
            for(Integer i = 0; i < nProcedencias; i++)
            {
                
                Proveedor oProveedor = arr.get(i);
                if(Integer.parseInt(Idproveedor)==oProveedor.getProveedorId())
                {
    
                   result += "<option value=" + oProveedor.getProveedorId() + ">"+oProveedor.getProveedorNombre()+"</option>";
                }
            }
        }
       result += "</select>";
       return result;
    }
    
       
    
     //ListarProductos
     @WebMethod(operationName = "ListarProductosCompra")
    public String ListarProductosCompra()
    {
        String result = "<select class=\"form-control border-input\" name='producto'>";
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
          ArrayList<Producto> arr = (ArrayList) port.listarProductosCompra();
        Integer nProductos = arr.size();
        for(Integer i = 0; i < nProductos; i++)
        {
            Producto oProducto = arr.get(i);
            result += "<option value=" + oProducto.getProductoId() + ">"+oProducto.getProductoDescripcion()+"</option>";
 
        }
       result += "</select>";
       return result;
    }

    public String ingresarDetalleCompra(java.lang.Integer arg0, java.lang.Integer arg1, java.lang.Double arg2, java.lang.Integer arg3) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        return port.ingresarDetalleCompra(arg0, arg1, arg2, arg3);
    }
  public String ingresarCompra(java.lang.Integer arg0, java.lang.Integer arg1, java.lang.String arg2, java.lang.Double arg3, java.lang.Double arg4) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        return port.ingresarCompra(arg0, arg1, arg2, arg3, arg4);
    }
    

     @WebMethod(operationName = "sumaDetalles")
    public java.util.List<com.factime.servicioweb.CompraProducto> sumaDetalles(java.lang.Integer arg0) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        return port.sumaDetalles(arg0);
    }

 /// Suma detalles

    @WebMethod(operationName = "getSumaDetalles")
    public String getSumaDetalleTable(Integer parametroDeBusqueda) 
    {        
        String resul = "<table class=\"table table-striped\" align='center' border='0'>";
       
        
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<CompraProducto> arr = (ArrayList) port.sumaDetalles(parametroDeBusqueda);
        Integer nEs = arr.size();
   
        for (int i = 0; i < nEs; i++) {
            CompraProducto c = arr.get(i);
            resul += this.getSumaDetalleTableRow(i, c);
        }
        resul += "</table>";
        return resul;
    }
    
    private String getSumaDetalleTableRow(Integer i, CompraProducto c) {
        Double Total;  
        DecimalFormat formato = new DecimalFormat("# 0.00");
        String result;
        result = "<tr align='center' bgcolor='#CEF6D8'>";
        //result += "<td>" + i.toString() + "</td>";        
        result += "<td >TOTAL COMPRA : $&nbsp;" + formato.format(c.getSubtotalFactura())+ "</td>";
       
        //result += "<td><a href='index.jsp?id=" + c.getId().toString() + "'>Editar</a></td>";
        result += "</tr>";
        return result;
    } 
    
    ///PRUEBA REPORTE GINO
    @WebMethod(operationName = "ListarProductosGINO")
    public ArrayList<Producto> ListarProductosGINO()
    {
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
          ArrayList<Producto> arr = (ArrayList) port.listarProductosCompra();
        /*Integer nProductos = arr.size();
        for(Integer i = 0; i < nProductos; i++)
        {
            Producto oProducto = arr.get(i);
            result += "<option value=" + oProducto.getProductoId() + ">"+oProducto.getProductoDescripcion()+"</option>";
 
        }
       result += "</select>";*/
       return arr;
    }
    
    ///FIN PRUEBA GINO
    
    /// Compra Factura
        private String getComprasDetalleTableHeader() 
     {
        String result;

        result = "<tr bgcolor='#A9F5A9'>";
        //result += "<th WIDTH='80' HEIGHT='30'>Id</th>";
        result += "<th WIDTH='100' HEIGHT='30'>Producto</th>";
        result += "<th WIDTH='200' HEIGHT='30'>Precio</th>";
        result += "<th WIDTH='200' HEIGHT='30'>Cantidad</th>";
        result += "<th WIDTH='250' HEIGHT='30'>Total</th>";
        //result += "<th colspan=2 WIDTH='250' HEIGHT='30'>Opciones</th>";
        //result += "<th>Acci&oacuten</th>";
        result += "</tr>";
        return result;
    }
    

     @WebMethod(operationName = "getComprasDetalles")
    public String getComprasDetalleTable(Integer parametroDeBusqueda) 
    {        
        String resul = "<table class=\"table table-striped\" align='center' border='0'>";
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<CompraProducto> arr = (ArrayList) port.comprasDetalles(parametroDeBusqueda);
        
        Integer nEs = arr.size();
        if(nEs!=0)
        {
            resul += this.getComprasDetalleTableHeader();
        }
        if(nEs==0)
        {
            resul +="<font color='red'>Datos no encontrados</font>";
        }
        for (int i = 0; i < nEs; i++) {
            CompraProducto p = arr.get(i);
            resul += this.getComprasDetalleTableRow(i, p);
        }
        resul += "</table>";
        return resul;
    }
   
    private String getComprasDetalleTableRow(Integer i, CompraProducto p) {
          
        String result;
        DecimalFormat formato = new DecimalFormat("# 0.00");
        result = "<tr align='center' bgcolor='#CEF6D8'>";
        //result += "<td>" + i.toString() + "</td>";
        result += "<td>" + p.getProductoDescripcion() + "</td>";
        result += "<td>$ " + formato.format(p.getPrecioUnitario()) + "</td>";
        result += "<td>" + p.getCantidad() + "</td>";
        result += "<td>$ " + formato.format(p.getTotal())+ "</td>";
       // result += "<td><a href='IngresarComora.jsp?id=" + p.getProductoId().toString() + "'>Editar</a></td>";
       // result += "<td><a href='EliminarProducto.jsp?id=" + p.getProductoId().toString() + "'>Eliminar</a></td>";
      
        result += "</tr>";
        return result;
    }
    
    @WebMethod(operationName = "getClientesTodos")
    public String getClientesTodos(@WebParam(name = "parametroDeBusqueda") String parametroDeBusqueda)
    {
        String result = "<table class=\"table table-hover\">";    
         com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<Cliente> arr = (ArrayList) port.buscarClienteM(parametroDeBusqueda);
        Integer nEs = arr.size();
        Integer id = 0;
        if(nEs==0)
        {
            result="<font color='red'>No existen Clientes</font>";
            //return "no";
        }
        else
        {                       
            result += "<tr>";                
                //result += "<th>Id</th>";
                result += "<th>C&eacutedula</th>";
                result += "<th>Nombre</th>";
                result += "<th>Apellido</th>";
                result += "<th>Dirección</th>";
                result += "<th>Teléfono</th>";
                result += "<th>Compras</th>";
                result += "<th>Opciones</th>";
                result += "</tr>";
             //// ingreso
                result += "<tr><form action='controladorRegistrar.jsp' method='action' name='registrar'>";                
                //result += "<th></th>";
                result += "<td class='fondo_blanco'><input type='text' name='cedula'  size='10' maxlength='10' onkeypress='return soloNumeros(event)'required></td>";
                result += "<td class='fondo_blanco'><input type='text' name='nombre'  size='12' maxlength='30' onkeypress='return soloLetras(event)' required></td>";
                result += "<td class='fondo_blanco'><input type='text' name='apellido'  size='12' maxlength='30' onkeypress='return soloLetras(event)' required></td>";
                result += "<td class='fondo_blanco'><input type='text' name='direccion' size='25'  maxlength='45' required><br></td>";
                
                result +="";    
                result += "<td class='fondo_blanco'><input type='text'  name='telefono' size='10'   maxlength='10' onkeypress='return soloNumeros(event)' required><br></td>";
                result += "<td class='fondo_blanco'><input type='text' style='text-align:center'  name='compras' size='6' value='0' OnFocus='this.blur()' maxlength='10' required>\n";
                result += "<td class='fondo_blanco'><input type='image' src='tema/img/save.png' name='registrar' width='30' height='30'></td></form>\n";
                for(Integer i = 0; i < nEs; i++)
                {               
                Cliente c = arr.get(i);
                id = i+1;
                
                result += "<tr>";
               // result += "<td>" + c.getClienteId() + "</td>";
                result += "<td>" + c.getClienteCedula() + "</td>";
                result += "<td>" + c.getClienteNombre() + "</td>";
                result += "<td>" + c.getClienteApellido() + "</td>";
                result += "<td>" + c.getClienteDireccion() + "</td>";   
                result += "<td>"+c.getClienteTelefono()+"</td>";
                result += "<td>" + c.getClienteNumeroCompras()+ "</td>";
                result += "<td><img src='tema/img/visto.png' width='30' height='30'></td>";
                result += "</tr>";
            }	
            result += "</table>";
            result += "<br>";
            result += "<h5> El total de clientes es: "+nEs+"</h5>";
            
        }
       
      return result; 
    }


    ////////////////////
    //UNIR EMPLEADO////
    ///////////////////
          
       @WebMethod(operationName = "ListarEmpleados")
    public String ListarEmpleados(){
        String result = "<center><table border='1'>";
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<Empleado> arr = (ArrayList) port.listarEmpleados();
        Integer nEs = arr.size();
        Integer id = 0;
        result += "<tr>";
            result += "<th> Cédula</th>";
            result += "<th> Nombre</th>";
            result += "<th> Apellido </th>";
            result += "<th> Dirección </th>";
            result += "<th> Ingreso </th>";
            result += "<th> Sueldo </th>";
            result += "<th> Teléfono </th>";
            result += "<th> Opción </th>";
            result += "</tr>";
                   
            result += "<tr>";
                result += "<form action='ControladorRegistroEmpleado.jsp' method='action' name='registrar'>";                
                //result += "<th></th>";
                result += "<td ><input type='text' name='cedula'  size='9' maxlength='10' onkeypress='return soloNumeros(event)'required></td>";
                result += "<td ><input type='text' name='nombre'  size='10' maxlength='30' onkeypress='return soloLetras(event)' required></td>";
                result += "<td ><input type='text' name='apellido'  size='10' maxlength='30' onkeypress='return soloLetras(event)' required></td>";
                result += "<td ><input type='text' name='direccion' size='11'  maxlength='45' required><br></td>";
                result += "<td ><input type='date' size='10'  name='fecha'  required><br></td>";
                result += "<td ><input type='number' size='2' name='sueldo'  min='0' max='500' step='0.1' maxlength='6' required><br></td>";                
                result += "<td ><input type='text'  name='telefono' size='9' maxlength='10' onkeypress='return soloNumeros(event)' required><br></td>";
                result += "<td ><input type='image' src='tema/img/save.png' name='registrar' width='30' height='30'></td></form>\n";
                result += "</tr>";
            
        DecimalFormat formato = new DecimalFormat("# 0.00");
        for(Integer i = 0; i < nEs; i++)
        {
            Empleado oEmpleado = arr.get(i);
            id = i+1;
            result += "<tr>";
            //result += "<td>" + id.toString() + "</td>";
            result += "<td>" + oEmpleado.getEmpleadoCedula() + "</td>";
            result += "<td>" + oEmpleado.getEmpleadoNombre() + "</td>";
            result += "<td>" + oEmpleado.getEmpleadoApellido() + "</td>";
            result += "<td>" + oEmpleado.getEmpleadoDireccion() + "</td>";
            result += "<td>" + oEmpleado.getEmpleadoIngresoFecha()+ "</td>";
            result += "<td> $ " + formato.format(oEmpleado.getEmpleadoSueldo())+"</td>";
            result += "<td>" + oEmpleado.getEmpleadoTelefono() +"</td>";
            result += "<td><a href='ModificarEmpleadoAdministrador.jsp?ci="+ oEmpleado.getEmpleadoCedula()+"'><img src='tema/img/edit.ico' width='30' height='30'></a></td>";

            result += "</tr>";
            
          
        }
       result += "</table></center><br>";
       if(nEs>0)
        {
             result +="<br><font color='black'>Total de empleados = "+nEs+"</font><br><br>";
        }
       return result;
    }

 //BUSCAR EMPLEADO
    private String getEmpleadoTablaEncabezado() 
     {
        String result;

        result = "<tr>";
        //result += "<th WIDTH='80' HEIGHT='30'>Id</th>";
        result += "<th>C&eacutedula</th>";
        result += "<th>Nombre</th>";
        result += "<th>Apellido</th>";
        result += "<th>Dirección</th>";
        result += "<th>Ingreso</th>";
         result += "<th>Sueldo</th>";
          result += "<th>Telefono</th>";
          result += "<th>Opcion</th>";
        //result += "<th>Acci&oacuten</th>";
        result += "</tr>";

        return result;
    }
     
       
    @WebMethod(operationName = "getEmpleados")
    public String getEmpleadoTabla(@WebParam(name = "parametroDeBusqueda") String parametroDeBusqueda) 
    {        
        String resul = "<table align='center' border='1'>";
       
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<Empleado> arrEmp = (ArrayList) port.buscarEmpleados(parametroDeBusqueda);
        Integer nEs = arrEmp.size();
        if("all".equals(parametroDeBusqueda.toLowerCase()) || "todo".equals(parametroDeBusqueda.toLowerCase()) || "todos".equals(parametroDeBusqueda.toLowerCase()) )
        {
            resul += this.ListarEmpleados();
        }
        
       
        else
            {
        if(parametroDeBusqueda==null)
        {
            resul ="";
        }
        
        if(nEs!=0)
        {
            resul += this.getEmpleadoTablaEncabezado();
        }
        if(nEs==0)
        {
            resul +="<font color='red'>Datos no encontrados</font>";
        }
        else
        {
        resul += "<tr>";
                resul += "<form action='ControladorRegistroEmpleado.jsp' method='action' name='registrar'>";                
                //result += "<th></th>";
                resul += "<td ><input type='text' name='cedula'  size='9' maxlength='10' onkeypress='return soloNumeros(event)'required></td>";
                resul += "<td ><input type='text' name='nombre'  size='10' maxlength='30' onkeypress='return soloLetras(event)' required></td>";
                resul += "<td ><input type='text' name='apellido'  size='10' maxlength='30' onkeypress='return soloLetras(event)' required></td>";
                resul += "<td ><input type='text' name='direccion' size='11'  maxlength='45' required><br></td>";
                resul += "<td ><input type='date'  name='fecha' size='15' required><br></td>";
                resul += "<td ><input type='number' size='2' name='sueldo'  min='0' max='500' step='0.1'  required><br></td>";                 
                resul += "<td ><input type='text' size='9'  name='telefono'  maxlength='10' onkeypress='return soloNumeros(event)' required><br></td>";
                resul += "<td ><input type='image' src='tema/img/save.png' name='registrar' width='30' height='30'></td></form>\n";
                resul += "</tr>";
        }
        for (int i = 0; i < nEs; i++) {
            Empleado c = arrEmp.get(i);
            resul += this.getEmpleadoTablaFila(i, c);
        }
        resul += "</table>";
        if(nEs>0)
        {
             resul +="<br><font color='black'>Total de empleados = "+nEs+"</font><br><br>";
        }
            }
        return resul;
    }
    
    private String getEmpleadoTablaFila(Integer i, Empleado c) {
          
        String result;
        DecimalFormat formato = new DecimalFormat("# 0.00");
        result = "<tr >";
        //result += "<td>" + i.toString() + "</td>";
        result += "<td>" + c.getEmpleadoCedula() + "</td>";
        result += "<td>" + c.getEmpleadoNombre()+ "</td>";
        result += "<td>" + c.getEmpleadoApellido() + "</td>";
        result += "<td>" + c.getEmpleadoDireccion() + "</td>";        
        result += "<td>" + c.getEmpleadoIngresoFecha()+ "</td>";
         result += "<td> $ " + formato.format(c.getEmpleadoSueldo())+ "</td>";         
         result += "<td>" + c.getEmpleadoTelefono() +"</td>";
         result += "<td><a href='ModificarEmpleadoAdministrador.jsp?ci="+ c.getEmpleadoCedula()+"'><img src='tema/img/edit.ico' width='30' height='30'></a></td>";

        result += "</tr>";

    
        return result;
    }   

    
    //listar facturas por cliente
     @WebMethod(operationName = "ListarFacturasCliente")
    public ArrayList<Factura> ListarFacturasCliente(String cedula) 
    {        
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
               return (ArrayList<Factura>) port.listarFacturaClientes(cedula);
    }
    
  @WebMethod(operationName = "ModificarEmpleadoB")
    public String ModificarEmpleadoB(String ecedula, Double esueldo, Integer etipo){
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        String strResult = port.modificarEmplead(ecedula, esueldo, etipo);
        return strResult;
    }

 @WebMethod(operationName = "Empleado1")
    public String Empleado1(String ci)     {        
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        Empleado e = port.buscarEmpleadoModificar(ci);
        DecimalFormat formato = new DecimalFormat("# 0.00");
        String result ="<div class='caja web-45 movil-40 derecha-contenido'  id='stylized'>";
        result += "<label>Cédula</label><br>";
        result += "<label>Sueldo ($)</label><br>";
        result += "<label>Tipo</label><br>";
        result += "</div>";
        result += "<div class='caja web-55 movil-60 izquierda-contenido'  id='stylized'>";
        result += "<input name='ecedula' value='"+ e.getEmpleadoCedula() +"' type='text' size='11' readonly='readonly' ><br>";
        result += "<input name='esueldo' value='"+e.getEmpleadoSueldo() +"' type='number' size='11' required ><br>";
       result += "<select name='etipo'id='stylized' >";
        for(Integer i = 0; i < 2; i++)
        {
            if(e.getEmpleadoTipo() == i)
            {
                if(i==1)
                        {
                 result += "<option selected value=" + i + "> Administrador </option>";
                        }
                else
                {
                    result += "<option selected value=" + i + "> Empleado </option>";
                }
            }
            else
            {
                 if(i==1)
                        {
                 result += "<option value=" + i + "> Administrador </option>";
                        }
                else
                {
                    result += "<option value=" + i + "> Empleado</option>";
                }
            }
        }
       result += "</select>";
       
               
      //  result += "<input name='etipo' value='"+ e.getEmpleadoTipo()+"' type='text' size='11' required><br><br><br>";
        result += "<br><br><input class='boton_verde' name='Guardar' value='Guardar' type='submit'>";
       result += "</div><br><br>";
        //result += "</form>";
        return result;

    }    
      ////////////////////
    //FIN UNIR EMPLEADO////
    ///////////////////

    //proveedor
     @WebMethod(operationName = "listarProveedor")
    public ArrayList<Proveedor> listarProveedor() 
    {        
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<Proveedor> arr = (ArrayList) port.loadProductos();
        return (ArrayList<Proveedor>) port.listarProveedor();
    }
    
    
    /*FACTURA DETALLE FACTURA ABSTECE*/
    
    @WebMethod(operationName = "FacturaCompraDetalles")
    public ArrayList<CompraProducto> FacturaCompraDetalles(Integer Fac, Integer Id) 
    {        
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        ArrayList<CompraProducto> arr = (ArrayList) port.facturaCompraDetalles(Fac,Id);
        return (ArrayList<CompraProducto>) port.facturaCompraDetalles(Fac, Id);
    }
    
    //gastos listar
      @WebMethod(operationName = "loadGastos")
    public ArrayList<Gasto> loadGastos(){   
    com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
    return (ArrayList<Gasto>) port.loadGastos();
    }
    
     
    
        @WebMethod(operationName = "ingresarGasto")
    public Boolean ingresarGasto(Gasto oGasto){
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        Boolean strResult = port.ingresarGasto(oGasto);
        return strResult;
    }
    
    @WebMethod(operationName = "EmpleadoUno")
    public Empleado EmpleadoUno(){
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        return port.empleadoUno();
    }
    
      @WebMethod(operationName = "GuardarVenta")
    public String GuardarVenta(@WebParam ArrayList<DetalleFactura> LstDetalles,@WebParam Factura ObjF,@WebParam Integer op)
    {          com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        return port.guardarVenta(LstDetalles, ObjF, op);

    }
    @WebMethod(operationName = "ObtenerFactura")
    public ArrayList<Factura> ObtenerFactura(Integer Id){   
    com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
    return (ArrayList<Factura>) port.obtenerFactura(Id);
    }

    
     @WebMethod(operationName = "IngresarVentaSimple")
    public String IngresarVentaSimple(Venta oVenta){
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        String strResult = port.ingresarVentaSimple(oVenta);
        return strResult;
    }
    
    @WebMethod(operationName = "loadVentaSimple")
    public ArrayList<Venta> loadVentaSimple(){   
    com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
    return (ArrayList<Venta>) port.loadVentaSimple();
    }
    
    @WebMethod(operationName = "UltimaFacturaIngresada")
    public Integer UltimaFacturaIngresada(){
        Integer nFactura;
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
       nFactura=port.ultimaFacturaIngresada();
       return nFactura;
    }
    
    @WebMethod(operationName = "CambiarEstadoVenta")
    public String CambiarEstadoVenta(Integer Id){
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
       String val=port.cambiarEstadoVenta(Id);
       return val;
    }
    
     @WebMethod(operationName = "ProductoPorCodigo")
    public Producto ProductoPorCodigo(String codigo){
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        Producto oProducto =new Producto();
        return oProducto = port.productoPorCodigo(codigo);
    }
    
     @WebMethod(operationName = "ProductoCodigoNombre")
    public Producto ProductoCodigoNombre(String nombre){
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        Producto oProducto =new Producto();
        return oProducto = port.productoCodigoNombre(nombre);
    }
    
    //imagen producto

    private java.util.List<com.factime.servicioweb.Producto> loadProductos() {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        return port.loadProductos();
    }

    private Cliente listarCliente_1(java.lang.String arg0) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        return port.listarCliente(arg0);
    }

    private Proveedor listarProveedor1_1(java.lang.Integer arg0) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        return port.listarProveedor1(arg0);
    }

    private Proveedor listarProveedor1_2(java.lang.Integer arg0) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        return port.listarProveedor1(arg0);
    }

    private java.util.List<com.factime.servicioweb.Proveedor> listarProveedor_1() {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        return port.listarProveedor();
    }

    private Proveedor listarProveedor1_3(java.lang.Integer arg0) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        return port.listarProveedor1(arg0);
    }

    private java.util.List<com.factime.servicioweb.DetalleFactura> getDetalles_1(java.lang.String arg0) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        return port.getDetalles(arg0);
    }

    private Proveedor listarProveedor1_4(java.lang.Integer arg0) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        return port.listarProveedor1(arg0);
    }

    private Proveedor listarProveedor1_5(java.lang.Integer arg0) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        return port.listarProveedor1(arg0);
    }

    private Proveedor listarProveedor1_6(java.lang.Integer arg0) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        return port.listarProveedor1(arg0);
    }

    private java.util.List<com.factime.servicioweb.CompraProducto> loadDetallesAbastecimientos(java.lang.Integer arg0) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        return port.loadDetallesAbastecimientos(arg0);
    }

    private java.util.List<com.factime.servicioweb.Factura> listarFactura_1() {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        return port.listarFactura();
    }

    private Boolean ingresarGasto_1(com.factime.servicioweb.Gasto arg0) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        return port.ingresarGasto(arg0);
    }

    private Empleado empleadoUno() {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        return port.empleadoUno();
    }

    private java.util.List<com.factime.servicioweb.Factura> listarFacturasAnuladas_1(java.lang.Integer arg0, java.lang.Integer arg1) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        return port.listarFacturasAnuladas(arg0, arg1);
    }

    private java.util.List<com.factime.servicioweb.Factura> facturasAnuladas() {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        return port.facturasAnuladas();
    }

    private String guardarVenta(java.util.List<com.factime.servicioweb.DetalleFactura> arg0, com.factime.servicioweb.Factura arg1,java.lang.Integer arg2) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        return port.guardarVenta(arg0, arg1,arg2);
    }

    private String guardarVenta_1(java.util.List<com.factime.servicioweb.DetalleFactura> arg0, com.factime.servicioweb.Factura arg1,java.lang.Integer arg2) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        return port.guardarVenta(arg0, arg1,arg2);
    }

    private Integer ultimaFacturaIngresada() {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        return port.ultimaFacturaIngresada();
    }

    private Integer ultimaFacturaIngresada_1() {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        return port.ultimaFacturaIngresada();
    }

    private Integer ultimaFacturaIngresada_2() {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        return port.ultimaFacturaIngresada();
    }

    private java.util.List<com.factime.servicioweb.Venta> loadVentaSimple_1() {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        return port.loadVentaSimple();
    }

    private Producto productoCodigoNombre(java.lang.String arg0) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        com.factime.servicioweb.FactimeAccesoDatos port = service.getFactimeAccesoDatosPort();
        return port.productoCodigoNombre(arg0);
    }

   
}
