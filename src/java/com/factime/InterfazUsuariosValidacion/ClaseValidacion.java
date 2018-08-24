/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.factime.InterfazUsuariosValidacion;

/**
 *
 * @author paul
 */
public class ClaseValidacion {
    private static  final int num_provincias = 24;
       
	public static Boolean validacionCedula(String cedula){
        //verifica que los dos primeros d�gitos correspondan a un valor entre 1 y NUMERO_DE_PROVINCIAS
        int prov = Integer.parseInt(cedula.substring(0, 2));

        if (!((prov > 0) && (prov <= num_provincias))) {
        	//addError("La c�dula ingresada no es v�lida");
        	System.out.println("Error: cedula mal ingresada");
            return false;
        }

        //verifica que el �ltimo d�gito de la c�dula sea v�lido
        int[] d = new int[10];
        //Asignamos el string a un array
        for (int i = 0; i < d.length; i++) {
            d[i] = Integer.parseInt(cedula.charAt(i) + "");
        }

        int imp = 0;
        int par = 0;

        //sumamos los duplos de posici�n impar
        for (int i = 0; i < d.length; i += 2) {
            d[i] = ((d[i] * 2) > 9) ? ((d[i] * 2) - 9) : (d[i] * 2);
            imp += d[i];
        }

        //sumamos los digitos de posici�n par
        for (int i = 1; i < (d.length - 1); i += 2) {
            par += d[i];
        }

        //Sumamos los dos resultados
        int suma = imp + par;
        
        //Restamos de la decena superior
        int d10 = Integer.parseInt(String.valueOf(suma + 10).substring(0, 1) +
                "0") - suma;
        
        //Si es diez el d�cimo d�gito es cero        
        d10 = (d10 == 10) ? 0 : d10;

        //si el d�cimo d�gito calculado es igual al digitado la c�dula es correcta
        if (d10 == d[9]) {
        	return true;
        }else {
        	//addError("La c�dula ingresada no es v�lida");
        	return false;
        }
	}
        
        public String LlenarSelectCarroCompras(Integer Stock)
    {
       String Cadena="";
       
       for(int i=1;i <= Stock;i++)
           Cadena+="<option value='"+i+"'>"+i+"</option>";
                                   
       return(Cadena);       
    }  
}
