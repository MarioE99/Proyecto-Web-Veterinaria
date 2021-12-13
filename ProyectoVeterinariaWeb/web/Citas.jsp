<%-- 
    Document   : Citas
    Created on : 11-28-2021, 09:28:20 PM
    Author     : meev9
--%>

<%@ page import="java.util.*" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="edu.ujmd.conexiones.Conexion" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Citas</title>
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
        <h1>Formulario de citas </h1>

        <div>

            <form action="" method="post">

                <label for="CodCargo">El codigo de la cita se genera automaticamente</label>
                <label for="Cargo">Seleccione el codigo del empleado:</label>
                <select name="cargo" id="cargo">
                    <option value="Jefe">Jefe</option>
                    <option value="Recepcionista">Recepcionista</option>
                    <option value="Cajero">Cajero</option>
                </select>
                <label for="Cargo">Seleccione el codigo del cliente:</label>
                <select name="cliente" id="cliente">
                    <option value="0001">Miguel Alejandro</option>
                    <option value="0002">Arturo Bautista</option>
                    <option value="0003">Doroti Ariela</option>
                </select>
                <label for="Cargo">Digite la fecha de visita:</label>
                <input type="text">

                <input class="button" type="button" value="Enviar">

            </form>

        </div>
        
         <!--TABLA DE CITAS-->
        <div class ="row col-md-6" style="margin-left: 400px; margin-top: -200px;">
    <table class="table table-striped table-bordered table-hover">
        <thead>
            <tr>
                <th>Id</th>
                <th>Nombre del empleado</th>
                 <th>Nombre del cliente</th>
                  <th>Fecha y hora</th>
                  
            </tr>
        </thead>
        <tbody>
            <%
                Conexion con = new Conexion();
                con.setRs("SELECT * FROM citas");
                ResultSet rs = con.getRs();
                while(rs.next()){         
            %>
            <tr>
                <td><%=rs.getString("id") %></td>
                <td><%=rs.getString("id_empleado") %></td>
                 <td><%=rs.getString("id_cliente") %></td>
                <td><%=rs.getString("Fecha y Hora") %></td>
                
                <td><a class="btn btn-danger" href="eliminarcitas.jsp?id=<%=rs.getString("id") %>">Eliminar</a></td>
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
