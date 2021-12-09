<%@page import="edu.ujmd.conexion.Conexion" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>turnoControl</title>
    </head>
    <body>
        <%
            
             String id = request.getParameter("id");
             String Horario = request.getParameter("Horario");
             String Horarioentrada = request.getParameter("Horario_Entrada");
             String Horariosalida = request.getParameter("Horario_Salida");
             Conexion con = new Conexion();
            //Sentencia sql para ingresar datos
            if(id == ""){
                con.setQuery("INSERT INTO turno values (null,'" + Horario + "','" + Horarioentrada + "','" + Horariosalida + "')");
                con.cerrarConexion();
            }
            else if(id != ""){
                con.setQuery("INSERT INTO departaments values ("+ id + ",'" + Horario + "''" + Horarioentrada + "''" + Horariosalida + "')");
                con.cerrarConexion();
            }
             
        %>
        <%-- Foward se utiliza para redireccionar a la pagina deseada --%>
        <jsp:forward page="Turnos.jsp">
            <jsp:param name="resultado" value="Datos Ingresados Exitosamente"/>
        </jsp:forward>
    </body>
</html>
