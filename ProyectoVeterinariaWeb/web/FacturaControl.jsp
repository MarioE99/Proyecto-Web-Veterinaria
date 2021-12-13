<%-- 
    Document   : FacturaControl
    Created on : 12-13-2021, 02:20:13 PM
    Author     : meev9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="edu.ujmd.conexiones.Conexion" import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Factura Control</title>
    </head>
    <body>
        <%
            
             String id = request.getParameter("id");
             String id_clientes = request.getParameter("id_clientes");
             String id_sucursal = request.getParameter("id_sucursal");
             String numFactura = request.getParameter("numFactura");
             String fecha = request.getParameter("fecha");
             Conexion con = new Conexion();
            //Sentencia sql para ingresar datos
            if(id == ""){
                con.setQuery("INSERT INTO factura values (null,'" + id +"','"+id_clientes+"','"+id_sucursal+ "','" + numFactura + "','" + fecha + "')");
                con.cerrarConexion();
            }
            else if(id != ""){
                con.setQuery("INSERT INTO factura ("+ id + ",'" + id_clientes + "''" + id_sucursal + "''" + numFactura + "''" + fecha + "')");
                con.cerrarConexion();
            }
             
        %>
        <%-- Foward se utiliza para redireccionar a la pagina deseada --%>
        <jsp:forward page="Factura.jsp">
            <jsp:param name="resultado" value="Datos Ingresados Exitosamente"/>
        </jsp:forward>
    </body>
</html>
