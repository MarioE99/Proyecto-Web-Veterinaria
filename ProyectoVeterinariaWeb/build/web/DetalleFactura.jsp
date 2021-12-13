<%-- 
    Document   : DetalleFactura
    Created on : 12-08-2021, 06:24:41 PM
    Author     : meev9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import="java.sql.*"%>
<%@page import="edu.ujmd.conexiones.Conexion" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalle factura</title>
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

        <form action="detallecontrol.jsp" method="post">
            <div>
                <label for="id">Código del detalle generado automaticamente</label>

            </div>

            <div>
                <label for="Factura">Escoja la factura:</label>
                <select name="Factura" id="cargo">
                    <option value="F1">Factura1</option>
                    <option value="F2">Factura2</option>
                </select>
            </div>

            <div>
                <label for="Forma">Escoja la forma de pago:</label>
                <select name="Forma" id="forma">
                    <option value="F1">Tarjeta</option>
                    <option value="F2">Efectivo</option>
                </select>
            </div>


            <div>
                <label for="Precio">Digite el precio:</label>
                <input type="number" name="Precio">

            </div>

            <div>
                <label for="Fechapago">Fecha del pago:</label>
                <input type="date" name="Fechapago">

            </div>

            <div>
                <label for="Detalle">Detalle de la factura:</label>
                <input type="text" name="Detalle">

            </div>


            <input class="button" type="button" value="Enviar">

        </form>
        
           <!--TABLA DE detalle facturas-->
        <div class ="row col-md-6" style="margin-left: 400px; margin-top: -200px;">
    <table class="table table-striped table-bordered table-hover">
        <thead>
            <tr>
                <th>Id</th>
                <th>Numero de factura</th>
                <th>Forma de pago</th>
                <th>Precio</th>
                <th>Fecha de pago</th>
                <th>Detalle</th>
            </tr>
        </thead>
        <tbody>
            <%
                Conexion con = new Conexion();
                con.setRs("SELECT * FROM detallefactura");
                ResultSet rs = con.getRs();
                while(rs.next()){         
            %>
            <tr>
                <td><%=rs.getString("id") %></td>
                <td><%=rs.getString("id_factura") %></td>
                 <td><%=rs.getString("id_formapago") %></td>
                 <td><%=rs.getString("precio") %></td>
                 <td><%=rs.getString("fechapago") %></td>
                 <td><%=rs.getString("detalle") %></td>
                <td><a class="btn btn-danger" href="eliminardetallefactura.jsp?id=<%=rs.getString("id") %>">Eliminar</a></td>
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
