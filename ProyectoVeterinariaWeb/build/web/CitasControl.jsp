<%-- 
    Document   : CitasControl
    Created on : 12-13-2021, 01:16:27 PM
    Author     : meev9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="edu.ujmd.conexiones.Conexion" import="java.sql.*" %>
<%@page import="edu.ujmd.conexiones.Conexion" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Citas Control</title>
    </head>
    <body>
        <%
            
             String id = request.getParameter("id");
             String id_empleado = request.getParameter("id_empleados");
             String id_cliente = request.getParameter("id_clientes");
             String Fecha = request.getParameter("Fecha_Hora");
             Conexion con = new Conexion();
            //Sentencia sql para ingresar datos
            if(id == ""){
                con.setQuery("INSERT INTO citas values (null,'" + id +"','"+id_empleado+"','"+id_cliente+ "','" + id_empleado + "','" + Fecha + "')");
                con.cerrarConexion();
            }
            else if(id != ""){
                con.setQuery("INSERT INTO citas ("+ id + ",'" + id_empleado + "''" + id_cliente + "''" + Fecha + "')");
                con.cerrarConexion();
            }
             
        %>
        <%-- Foward se utiliza para redireccionar a la pagina deseada --%>
        <jsp:forward page="Citas.jsp">
            <jsp:param name="resultado" value="Datos Ingresados Exitosamente"/>
        </jsp:forward>
    
    </body>
</html>
