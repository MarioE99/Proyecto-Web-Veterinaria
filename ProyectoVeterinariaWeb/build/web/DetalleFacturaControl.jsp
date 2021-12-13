<%-- 
    Document   : DetalleFacturaControl
    Created on : 12-13-2021, 02:08:48 PM
    Author     : meev9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="edu.ujmd.conexiones.Conexion" import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalles Factura Control</title>
    </head>
    <body>
        <%

            String id = request.getParameter("id");
            String id_factura = request.getParameter("id_factura");
            String id_formapago = request.getParameter("id_formapago");
            String precio = request.getParameter("precio");
            String formapago = request.getParameter("formapago");
            String detalle = request.getParameter("detalle");
            Conexion con = new Conexion();
            //Sentencia sql para ingresar datos
            if (id == "") {
                con.setQuery("INSERT INTO detallefactura values (null,'" + id + "','" + id_factura + "','" + id_formapago + "','" + precio + "','" + formapago + "''" + detalle + "')");
                con.cerrarConexion();
            } else if (id != "") {
                con.setQuery("INSERT INTO detallefactura (" + id + ",'" + id_factura + "''" + id_formapago + "''" + precio + "''" + formapago + "''" + detalle + "')");
                con.cerrarConexion();
            }

        %>
        <%-- Foward se utiliza para redireccionar a la pagina deseada --%>
        <jsp:forward page="DetalleFactura.jsp">
            <jsp:param name="resultado" value="Datos Ingresados Exitosamente"/>
        </jsp:forward>
    </body>
</html>
