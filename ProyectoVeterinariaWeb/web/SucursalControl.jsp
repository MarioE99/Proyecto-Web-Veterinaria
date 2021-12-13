<%-- 
    Document   : SucursalControl
    Created on : 12-13-2021, 03:03:05 PM
    Author     : meev9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="edu.ujmd.conexiones.Conexion" import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sucursal Control</title>
    </head>
    <body>
         <%
            
             String id = request.getParameter("id");
             String Nom_Sucursal = request.getParameter("Nom_Sucursal");
             String Direccion = request.getParameter("Direccion");
             String Telefono = request.getParameter("Telefono");
             String Departamento = request.getParameter("Departamento");
             String Municipio = request.getParameter("Municipio");
             String Encargado = request.getParameter("Encargado");
             Conexion con = new Conexion();
            //Sentencia sql para ingresar datos
            if(id == ""){
                con.setQuery("INSERT INTO sucursal values (null,'" + id +"','"+Nom_Sucursal+"','"+Direccion+ "','" + Telefono + "','" + Departamento + "','" + Municipio + "','" + Encargado + "')");
                con.cerrarConexion();
            }
            else if(id != ""){
                con.setQuery("INSERT INTO sucursal ("+ id + ",'" + Nom_Sucursal + "''" + Direccion + "''" + Telefono + "''" + Departamento + "','" + Municipio + "','" + Encargado + "')");
                con.cerrarConexion();
            }
             
        %>
        <%-- Foward se utiliza para redireccionar a la pagina deseada --%>
        <jsp:forward page="Sucursal.jsp">
            <jsp:param name="resultado" value="Datos Ingresados Exitosamente"/>
        </jsp:forward>
    </body>
</html>
