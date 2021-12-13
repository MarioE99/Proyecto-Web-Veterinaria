<%-- 
    Document   : FormaPagoControl
    Created on : 12-13-2021, 02:27:10 PM
    Author     : meev9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="edu.ujmd.conexiones.Conexion" import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forma Pago Control</title>
    </head>
    <body>
        <%
            
             String id = request.getParameter("id");
             String Tipo_Pago = request.getParameter("Tipo_Pago");
             
             Conexion con = new Conexion();
            //Sentencia sql para ingresar datos
            if(id == ""){
                con.setQuery("INSERT INTO formapago values (null,'" + id +"','" + Tipo_Pago  + "')");
                con.cerrarConexion();
            }
            else if(id != ""){
                con.setQuery("INSERT INTO formapago ("+ id + ",'" + Tipo_Pago + "')");
                con.cerrarConexion();
            }
             
        %>
        <%-- Foward se utiliza para redireccionar a la pagina deseada --%>
        <jsp:forward page="FormaPago.jsp">
            <jsp:param name="resultado" value="Datos Ingresados Exitosamente"/>
        </jsp:forward>
    </body>
</html>
