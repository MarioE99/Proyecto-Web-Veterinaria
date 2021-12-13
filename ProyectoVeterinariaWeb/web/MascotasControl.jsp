<%-- 
    Document   : MascotasControl
    Created on : 12-13-2021, 02:43:21 PM
    Author     : meev9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="edu.ujmd.conexiones.Conexion" import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mascotas Control </title>
    </head>
    <body>
         <%
            
             String id = request.getParameter("id");
             String id_clientes = request.getParameter("id_clientes");
             String Nombre = request.getParameter("Nombre");
             String Edad = request.getParameter("Edad");
             String Raza = request.getParameter("Raza");
             String Genero = request.getParameter("Genero");
             String Peso = request.getParameter("Peso");
             String Estado_Vacuna = request.getParameter("Estado_Vacuna");
            
             Conexion con = new Conexion();
            //Sentencia sql para ingresar datos
            if(id == ""){
                con.setQuery("INSERT INTO mascotas values (null,'" + id +"','"+id_clientes+"','"+Nombre+ "','" + Edad + "','" + Raza + "''" + Genero + "''" + Peso + "''" + Estado_Vacuna +"')");
                con.cerrarConexion();
            }
            else if(id != ""){
                con.setQuery("INSERT INTO mascotas ("+ id + ",'" + id_clientes + "''" + Nombre + "''" + Edad + "''" + Raza + "''" + Genero + "''" + Estado_Vacuna + "')");
                con.cerrarConexion();
            }
             
        %>
        <%-- Foward se utiliza para redireccionar a la pagina deseada --%>
        <jsp:forward page="Mascotas.jsp">
            <jsp:param name="resultado" value="Datos Ingresados Exitosamente"/>
        </jsp:forward>
    </body>
</html>
