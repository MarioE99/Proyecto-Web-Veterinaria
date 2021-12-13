<%-- 
    Document   : clientesControl
    Created on : 12-13-2021, 01:44:41 PM
    Author     : meev9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="edu.ujmd.conexiones.Conexion" import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ClientesControl</title>
    </head>
    <body>
        <%
            
             String id = request.getParameter("id");
             String Nombre = request.getParameter("Nombre");
             String Apellido = request.getParameter("Apellido");
             String Telefono = request.getParameter("Telefono");
             String Direccion = request.getParameter("Direccion");
             Conexion con = new Conexion();
            //Sentencia sql para ingresar datos
            if(id == ""){
                con.setQuery("INSERT INTO clientes  values (null,'" + Nombre + "','" + Apellido + "','" + Telefono + "','" + Direccion + "')");
                con.cerrarConexion();
            }
            else if(id != ""){
                con.setQuery("INSERT INTO clientes values ("+ id + ",'" + Nombre + "''" + Apellido + "''" + Telefono + "','" + Direccion + "')");
                con.cerrarConexion();
            }
             
        %>
        <%-- Foward se utiliza para redireccionar a la pagina deseada --%>
        <jsp:forward page="Clientes.jsp">
            <jsp:param name="resultado" value="Datos Ingresados Exitosamente"/>
        </jsp:forward>
    </body>
</html>
