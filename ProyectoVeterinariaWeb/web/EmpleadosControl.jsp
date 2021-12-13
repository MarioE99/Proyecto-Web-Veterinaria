<%-- 
    Document   : empleadosControl
    Created on : 12-13-2021, 01:57:27 PM
    Author     : meev9
--%>

<%@page import="edu.ujmd.conexiones.Conexion" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empleados Control</title>
    </head>
    <body>
        <%
            
             String id = request.getParameter("id");
             String id_turno = request.getParameter("id_turno");
             String id_cargo = request.getParameter("id_cargo");
             String Nombre = request.getParameter("Nombre");
             String Apellido = request.getParameter("Apellido");
             String Telefono = request.getParameter("Telefono");
             String Dui = request.getParameter("Dui");
             String Cargo = request.getParameter("Cargo");
             Conexion con = new Conexion();
            //Sentencia sql para ingresar datos
            if(id == ""){
                con.setQuery("INSERT INTO empleados values (null,'" + id +"','"+id_turno+"','"+id_cargo+ "','" + Nombre + "','" + Apellido + "','" + Telefono + "','" + Dui + "','" + Cargo + "')");
                con.cerrarConexion();
            }
            else if(id != ""){
                con.setQuery("INSERT INTO empleados ("+ id +"','"+id_turno+"','"+id_cargo+ "','" + Nombre + "','" + Apellido + "','" + Telefono + "','" + Dui + "','" + Cargo + "')");
                con.cerrarConexion();
            }
             
        %>
        <%-- Foward se utiliza para redireccionar a la pagina deseada --%>
        <jsp:forward page="Empleados.jsp">
            <jsp:param name="resultado" value="Datos Ingresados Exitosamente"/>
        </jsp:forward>
    
    </body>
</html>
