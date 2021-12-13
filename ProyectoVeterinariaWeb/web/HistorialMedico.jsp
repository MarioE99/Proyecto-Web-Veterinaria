<%-- 
    Document   : HistorialMedico
    Created on : 12-08-2021, 06:33:26 PM
    Author     : meev9
--%>

<%@ page import="java.util.*" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="edu.ujmd.conexiones.Conexion" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Historial Medico</title>

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
        <h1>Historial medico</h1>

        <form action="historialcontrol.jsp" method="post">
            <div>
                <label for="id">Código del historial generado automaticamente</label>

            </div>

            <div>
                <label for="codmascota">Escoja la mascota</label>
                <select name="codmascota" id="cargo">
                    <option value="P1">Riley</option>
                    <option value="P2">Sparky</option>
                </select>
            </div>

            <div>
                <label for="codmedicamento">Escoja el medicamento de la mascota:</label>
                <select name="codmedicamento" id="forma">
                    <option value="M1">Rabia</option>
                    <option value="M2">Pulgas</option>
                </select>
            </div>

            <div>
                <label for="codempleado">Escoja el empleado encargado:</label>
                <select name="codempleado" id="forma">
                    <option value="E1">Daniel</option>
                    <option value="E2">Mario</option>
                </select>
            </div>

            <div>
                <label for="Fecha">Fecha:</label>
                <input type="date" name="Fecha">

            </div>

            <div>
                <label for="Motivo">Motivo de la consulta:</label>
                <input type="text" name="Motivo">

            </div>



            <input class="button" type="button" value="Enviar">

        </form>




        <!--TABLA DE historial medico -->
        <div class ="row col-md-6" style="margin-left: 400px; margin-top: -200px;">
            <table class="table table-striped table-bordered table-hover">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nombre de mascota</th>
                        <th>Nombre del medicamento</th>
                        <th>Nombre del empleado</th>
                        <th>Fecha</th>
                        <th>Motivo de visita</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Conexion con = new Conexion();
                        con.setRs("SELECT * FROM historialmedico");
                        ResultSet rs = con.getRs();
                        while (rs.next()) {
                    %>
                    <tr>
                        <td><%=rs.getString("id")%></td>
                        <td><%=rs.getString("id_mascotas")%></td>
                        <td><%=rs.getString("id_medicamento")%></td>
                        <td><%=rs.getString("id_empleados")%></td>
                        <td><%=rs.getString("Fecha")%></td>
                        <td><%=rs.getString("Motivo")%></td>

                        <td><a class="btn btn-danger" href="eliminarhistorialmedico.jsp?id=<%=rs.getString("id")%>">Eliminar</a></td>
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
