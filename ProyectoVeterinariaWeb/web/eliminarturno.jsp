<%-- 
    Document   : eliminarturno
    Created on : 12-12-2021, 11:35:32 AM
    Author     : meev9
--%>

<%@page import="edu.ujmd.conexiones.Conexion" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id = request.getParameter("id");
    Conexion con = new Conexion();
    con.setQuery("delete from turno where id = " + id);
    con.cerrarConexion();
    %>
    <jsp:forward page="Turnos.jsp">
            <jsp:param name="resultado" value="Datos Eliminados Exitosamente"/>
    </jsp:forward>
