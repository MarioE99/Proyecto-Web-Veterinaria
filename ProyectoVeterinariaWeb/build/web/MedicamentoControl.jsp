<%-- 
    Document   : MedicamentoControl
    Created on : 12-13-2021, 02:50:45 PM
    Author     : meev9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="edu.ujmd.conexiones.Conexion" import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Medicamento Control</title>
    </head>
    <body>
          <%
            
             String id = request.getParameter("id");
             String Nom_Comercial = request.getParameter("Nom_Comercial");
             String Nom_Generico = request.getParameter("Nom_Generico");
             String Descripcion = request.getParameter("Descripcion");
             String Reacciones_Adversas = request.getParameter("Reacciones_Adversas");
             String Dosis = request.getParameter("Dosis");
             Conexion con = new Conexion();
            //Sentencia sql para ingresar datos
            if(id == ""){
                con.setQuery("INSERT INTO medicamentos values (null,'" + id +"','"+Nom_Comercial+"','"+Nom_Generico+ "','" + Descripcion + "','" + Reacciones_Adversas + "','" + Dosis + "')");
                con.cerrarConexion();
            }
            else if(id != ""){
                con.setQuery("INSERT INTO medicamentos ("+ id + ",'" + Nom_Comercial + "''" + Nom_Generico + "''" + Descripcion + "''" + Reacciones_Adversas + "','" + Dosis + "')");
                con.cerrarConexion();
            }
             
        %>
        <%-- Foward se utiliza para redireccionar a la pagina deseada --%>
        <jsp:forward page="Medicamentos.jsp">
            <jsp:param name="resultado" value="Datos Ingresados Exitosamente"/>
        </jsp:forward>
    </body>
</html>
