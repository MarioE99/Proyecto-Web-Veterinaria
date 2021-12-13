<%@page import="edu.ujmd.conexiones.Conexion" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CargoControl</title>
    </head>
    <body>
        <%
            
             String id = request.getParameter("id");
             String Cargo = request.getParameter("Cargo del empleado");
             Conexion con = new Conexion();
            //Sentencia sql para ingresar datos
            if(id == ""){
                con.setQuery("INSERT INTO turno cargo_empleado (null,'" + Cargo + "')");
                con.cerrarConexion();
            }
            else if(id != ""){
                con.setQuery("INSERT INTO turno values ("+ id + ",'" + Cargo + "')");
                con.cerrarConexion();
            }
             
        %>
        <%-- Foward se utiliza para redireccionar a la pagina deseada --%>
        <jsp:forward page="Cargo_empleado.jsp">
            <jsp:param name="resultado" value="Datos Ingresados Exitosamente"/>
        </jsp:forward>
    </body>
</html>
