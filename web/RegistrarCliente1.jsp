<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html><%
    if(request.getParameter("result") != null){
    if(request.getParameter("result").equals("error")){
    %>
        <script>alert('Cliente no registrado');</script>
    <%
    }
else
{
    if(request.getParameter("result").equals("cedula incorrecta")){
    %>
        <script>alert('Cedula Incorrecta');</script>
    <%
    }
else
{
    if(request.getParameter("result").equals("No hay conexion con la base de datos")){
    %>
        <script>alert('No hay conexion con el servidor');</script>
    <%
    }
    else
    {
      if(request.getParameter("result").equals("si existe")){
    %>
        <script>alert('el cliente ya existe');</script>
    <%
    }  
        
    }}
    
     }  
}
    %>
<html lang="es">
  <head>
    <title> </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximun-scale=1">
    <link rel="stylesheet" href="tema/css/estilos.css">
    <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
    <script src="tema/js/scripts.js"></script>
    <script language="javascript" type="text/javascript"></script>
    <script>
   function soloLetras(e) { 
tecla = (document.all) ? e.keyCode : e.which; 
if (tecla==8) return true; //Tecla de retroceso (para poder borrar) 
// dejar la lÃ­nea de patron que se necesite y borrar el resto 
patron =/[A-Za-z\sáéíóú]/; // Solo acepta letras 
//patron = /\d/; // Solo acepta nÃºmeros 
//patron = /\w/; // Acepta nÃºmeros y letras 
//patron = /\D/; // No acepta nÃºmeros 
// 
te = String.fromCharCode(tecla); 
return patron.test(te); 
} 
      
   function soloNumeros(e){
	var key = window.Event ? e.which : e.keyCode
	return (key >= 48 && key <= 57)
}
   
   </script>
  <body>
        <div class="grupo encabezado_paginas centro">
            <div class="caja web-100 centrar-contenido">
                <p>Bicirepuestos Alexandra</p>
            </div>
        </div>
      <div class="grupo ">
          <img src="tema/img/banner.jpg" >
      </div>
      <div class="grupo web-100">
            <ul class="menu izquierda menu_verde">
              <li><a href="index.jsp">Inicio</a></li>
              <li><a href="#">Quienes Somos</a></li>          
              <li><a href="BuscarProductoInvitado.jsp?txtparametro='all'">Nuestros productos</a></li>
            </ul>
      </div>
      <div class="grupo formato_tabla centrar-contenido "> 
            <form method="post" action="controladorRegistrarse.jsp" name="registrarse">
                <h2>Reg&iacute;strate en nuestra p&aacute;gina</h2><br>
                <div class="caja web-45 movil-40 derecha-contenido"  id="stylized">
                    <label>C&eacute;dula</label><br>
                    <label>Nombres</label><br>
                    <label>Apellidos</label><br>
                    <label>Tel&eacute;fono</label><br>
                    <label>Direcci&oacute;n</label><br>
                    <label>Contrase&ntilde;a</label><br>
                </div>              
                <div class="caja web-55 movil-60 izquierda-contenido"  id="stylized">
                    <input type="text" name="cedula"  size="30" maxlength="10" onkeypress="return soloNumeros(event)" placeholder="ejm 0603990078" required><br>
                    <input type="text" name="nombre"  size="30" maxlength="30" onkeypress="return soloLetras(event)" required><br>
                    <input type="text" name="apellido"  size="30" maxlength="30" onkeypress="return soloLetras(event)" required><br>
                    <input type="text" name="telefono"  size="30" maxlength="10" onkeypress="return soloNumeros(event)" placeholder="ejm 0987654321" required><br> 
                    <input type="text" name="direccion" size="30"  maxlength="50" required><br>
                    <input type="password" name="clave"  size="30" maxlength="10"  required><br><br>
                </div>
                 <div class="caja web-95 centrar-contenido"  id="stylized">               
                <input class="boton_verde" type="submit" name="registrar" value="Registrar">
                </div>
            </form><br>
        </div>
   <footer>
            <div class="grupo pie centro">
                <div class="caja web-70 centrar-contenido">
                    <p>Dirección: Venezuela 22-07 y Espejo <br>Riobamba-Ecuador<br>© Bicirepuestos "Alexandra" - 2015</p>
                </div>
                <div class="caja web-10 redes">
                    <img src="tema/img/facebook.png">
                </div>
                <div class="caja web-10 redes">
                    <img src="tema/img/images.png">
                </div>
                <div class="caja web-10 redes">
                    <img src="tema/img/twitter.png">
                </div>
            </div>
        </footer>
    </body>
</html>
