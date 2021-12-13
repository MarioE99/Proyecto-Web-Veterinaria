<%-- 
    Document   : eiminarcargo
    Created on : 12-13-2021, 01:27:19 PM
    Author     : meev9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
   <%@page import="edu.ujmd.conexiones.Conexion" import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    Conexion con = new Conexion();
    con.setQuery("delete from cargo_empleado where id = " + id);
    con.cerrarConexion();
    %>
    <jsp:forward page="Cargo_Empleado.jsp">
            <jsp:param name="resultado" value="Datos Eliminados Exitosamente"/>
    </jsp:forward>
</html>
