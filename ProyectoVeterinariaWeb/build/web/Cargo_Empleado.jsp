<%-- 
    Document   : Cago_Empleado
    Created on : 11-28-2021, 08:09:56 PM
    Author     : meev9
--%>

<%@ page import="java.util.*" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="edu.ujmd.conexiones.Conexion" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cargo del empleado</title>

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
        <h1>Formulario de cargo del empleado</h1>

        <div>

            <form action="" method="post">

                <label for="CodCargo">El codigo del cargo se genera automaticamente</label><br>
                <label for="Cargo">Digite el cargo del empleado</label><br>
                <input type="text">

                <input class="button" type="button" value="Enviar">

            </form>

        </div>
        
          <!--TABLA DE EMPLEADO-->
        <div class ="row col-md-6" style="margin-left: 400px; margin-top: -200px;">
    <table class="table table-striped table-bordered table-hover">
        <thead>
            <tr>
                <th>Id</th>
                <th>Cargo del empleado</th>
            </tr>
        </thead>
        <tbody>
            <%
                Conexion con = new Conexion();
                con.setRs("SELECT * FROM cargo_empleado");
                ResultSet rs = con.getRs();
                while(rs.next()){         
            %>
            <tr>
                <td><%=rs.getString("id") %></td>
                <td><%=rs.getString("cargo_empleado") %></td>
                <td><a class="btn btn-danger" href="eliminarcargo.jsp?id=<%=rs.getString("id") %>">Eliminar</a></td>
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
