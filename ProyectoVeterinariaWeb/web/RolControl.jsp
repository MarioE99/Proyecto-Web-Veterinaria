<%-- 
    Document   : RolControl
    Created on : 12-13-2021, 02:56:20 PM
    Author     : meev9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="edu.ujmd.conexiones.Conexion" import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rol Control</title>
    </head>
    <body>
          <%
            
             String id = request.getParameter("id");
             String Nom_Comercial = request.getParameter("Nombre_Rol");
             
             Conexion con = new Conexion();
            //Sentencia sql para ingresar datos
            if(id == ""){
                con.setQuery("INSERT INTO rol values (null,'" + id +"','"+Nombre_Rol+ "')");
                con.cerrarConexion();
            }
            else if(id != ""){
                con.setQuery("INSERT INTO rol ("+ id + ",'" + Nombre_Rol + "')");
                con.cerrarConexion();
            }
             
        %>
        <%-- Foward se utiliza para redireccionar a la pagina deseada --%>
        <jsp:forward page="Rol.jsp">
            <jsp:param name="resultado" value="Datos Ingresados Exitosamente"/>
        </jsp:forward>
    </body>
</html>
