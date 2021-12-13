<%-- 
    Document   : eliminarformapago
    Created on : 12-13-2021, 02:29:37 PM
    Author     : meev9
--%>

<%@page import="edu.ujmd.conexiones.Conexion" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id = request.getParameter("id");
    Conexion con = new Conexion();
    con.setQuery("delete from formapago where id = " + id);
    con.cerrarConexion();
    %>
    <jsp:forward page="FormaPago.jsp">
            <jsp:param name="resultado" value="Datos Eliminados Exitosamente"/>
    </jsp:forward>