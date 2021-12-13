<%-- 
    Document   : HistorialMedicoControl
    Created on : 12-13-2021, 02:34:31 PM
    Author     : meev9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="edu.ujmd.conexiones.Conexion" import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Historial Medico Control</title>
    </head>
    <body>
         <%
            
             String id = request.getParameter("id");
             String id_mascotas = request.getParameter("id_mascotas");
             String id_medicamento = request.getParameter("id_medicamento");
             String id_empleados = request.getParameter("id_empleados");
             String Fecha = request.getParameter("Fecha");
             String Motivo = request.getParameter("Motivo");
             Conexion con = new Conexion();
            //Sentencia sql para ingresar datos
            if(id == ""){
                con.setQuery("INSERT INTO historialmedico values (null,'" + id +"','"+id_mascotas+"','"+id_medicamento+ "','" + id_empleados + "','" + Fecha + "','" + Motivo +  "')");
                con.cerrarConexion();
            }
            else if(id != ""){
                con.setQuery("INSERT INTO historialmedico ("+ id + ",'" + id_mascotas + "''" + id_medicamento + "''" + id_empleados + "','" + Fecha + "','" + Motivo + "')");
                con.cerrarConexion();
            }
             
        %>
        <%-- Foward se utiliza para redireccionar a la pagina deseada --%>
        <jsp:forward page="HistorialMedico.jsp">
            <jsp:param name="resultado" value="Datos Ingresados Exitosamente"/>
        </jsp:forward>
    </body>
</html>
