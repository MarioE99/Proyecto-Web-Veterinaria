<%-- 
    Document   : UsuariosControl
    Created on : 12-13-2021, 03:08:59 PM
    Author     : meev9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="edu.ujmd.conexiones.Conexion" import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios Control</title>
    </head>
    <body>
          <%
            
             String id = request.getParameter("id");
             String cod_rol = request.getParameter("cod_rol");
             String usuario = request.getParameter("usuario");
             String contraseña = request.getParameter("contraseña");
             Conexion con = new Conexion();
            //Sentencia sql para ingresar datos
            if(id == ""){
                con.setQuery("INSERT INTO usuarios values (null,'" + id +"','"+cod_rol+"','"+usuario+ "','" + contraseña + "')");
                con.cerrarConexion();
            }
            else if(id != ""){
                con.setQuery("INSERT INTO usuarios ("+ id + ",'" + cod_rol + "''" + usuario + "''" + contraseña + "')");
                con.cerrarConexion();
            }
             
        %>
        <%-- Foward se utiliza para redireccionar a la pagina deseada --%>
        <jsp:forward page="Usuarios.jsp">
            <jsp:param name="resultado" value="Datos Ingresados Exitosamente"/>
        </jsp:forward>
    </body>
</html>
