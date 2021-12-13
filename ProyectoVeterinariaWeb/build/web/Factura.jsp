<%-- 
    Document   : Factura
    Created on : 12-08-2021, 06:29:39 PM
    Author     : meev9
--%>

<%@ page import="java.util.*" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="edu.ujmd.conexiones.Conexion" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Factura</title>

        <style>

            input[type=text], select {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            input[type=password], select {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }


            input[type=submit] {
                width: 100%;
                background-color: #4CAF50;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            input[type=submit]:hover {
                background-color: #45a049;
            }

            div {
                border-radius: 5px;
                background-color: #f2f2f2;
                padding: 20px;
            }

            .button {
                background-color: #4CAF50; /* Green */
                border: none;
                color: white;
                padding: 15px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
            }

            .button:hover {
                background-color: black;
                color: white;
            }   


        </style>	
    </head>
    <body>
        <h1>Facturas</h1>

        <form action="facturacontrol.jsp" method="post">
            <div>
                <label for="id">Código de la factura generado automaticamente</label>

            </div>

            <div>
                <label for="codcliente">Escoja el cliente a realizar la factura:</label>
                <select name="codcliente" id="cargo">
                    <option value="F1">Mario</option>
                    <option value="F2">Daniel</option>
                </select>
            </div>

            <div>
                <label for="codsucursal">Escoja la sucursal:</label>
                <select name="Forma" id="forma">
                    <option value="S1">Sucursal1</option>
                    <option value="S2">Sucursal2</option>
                </select>
            </div>


            <div>
                <label for="Numero">Digite el numero de la factura:</label>
                <input type="number" name="Numero">

            </div>

            <div>
                <label for="Fechapago">Fecha de la factura:</label>
                <input type="date" name="Fechapago">

            </div>



            <input class="button" type="button" value="Enviar">

        </form>

        <!--TABLA DE facturas-->
        <div class ="row col-md-6" style="margin-left: 400px; margin-top: -200px;">
            <table class="table table-striped table-bordered table-hover">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nombre de cliente</th>
                        <th>Numero de sucursal</th>
                        <th>Numero de factura</th>
                        <th>Fecha</th>

                    </tr>
                </thead>
                <tbody>
                    <%
                        Conexion con = new Conexion();
                        con.setRs("SELECT * FROM factura");
                        ResultSet rs = con.getRs();
                        while (rs.next()) {
                    %>
                    <tr>
                        <td><%=rs.getString("id")%></td>
                        <td><%=rs.getString("id_cliente")%></td>
                        <td><%=rs.getString("id_sucursal")%></td>
                        <td><%=rs.getString("numFactura")%></td>
                        <td><%=rs.getString("fecha")%></td>

                        <td><a class="btn btn-danger" href="eliminarfactura.jsp?id=<%=rs.getString("id")%>">Eliminar</a></td>
                    </tr>
                    <%
                        }
                        con.cerrarConexion();
                    %>
                </tbody>
            </table>
        </div>



    </body>
</html>
