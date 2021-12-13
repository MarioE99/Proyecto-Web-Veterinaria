<%-- 
    Document   : eliminarrol
    Created on : 12-13-2021, 02:58:26 PM
    Author     : meev9
--%>

<%@page import="edu.ujmd.conexiones.Conexion" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id = request.getParameter("id");
    Conexion con = new Conexion();
    con.setQuery("delete from rol where id = " + id);
    con.cerrarConexion();
    %>
    <jsp:forward page="Rol.jsp">
            <jsp:param name="resultado" value="Datos Eliminados Exitosamente"/>
    </jsp:forward>