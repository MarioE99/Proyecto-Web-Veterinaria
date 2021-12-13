
<%@ page import="java.util.*" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="edu.ujmd.conexiones.Conexion" %>
<%
 String usuario = "";
 HttpSession sesionOk = request.getSession();
 if (sesionOk.getAttribute("usuario") == null) {
%>
<jsp:forward page="LogIn.jsp">
    <jsp:param name="error" value="Es obligatorio identificarse" />
</jsp:forward>
<%
 }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Turnos</title>

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

            button {
                background-color: #4CAF50; /* Green */
                border: none;
                color: white;
                padding: 15px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
            }

            button:hover {
                background-color: black;
                color: white;
            }





        </style>
    </head>
    <body>
        <h1>Formulario de turnos</h1>

        <div class="row col-md-5">
                <form role="form" action="turnocontrol.jsp" method="post">
                    <div class="col-md-10">
                        
                        <div class="well well-sm">
                            <strong><span class="glyphicon glyphicon-asterisk"></span>Campos requeridos</strong>
                        </div>
                        <div class="form-group">
                            <label for="id">Id</label>
                            <div class="input-group">
                                <input type="text" class="form-control" name="id"  placeholder="Ingrese el ID">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="Horario">Escriba si es Diurno(D) o Nocturno(N)</label>
                            <div class="input-group">
                                <input type="text" class="form-control" name="Horario" id="Horario" placeholder="Ingrese la hora" required>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                        
                         <div class="form-group">
                            <label for="Horario_Entrada">Seleccione el horario de entrada</label>
                            <div class="input-group">
                                <input type="date" class="form-control" name="Horario_Entrada" id="entrada" required>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="Horario_Salida">Seleccione el horario de salida</label>
                            <div class="input-group">
                                <input type="date" class="form-control" name="Horario_Salida" id="entrada" required>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                        <input type="submit" class="btn btn-info" value="Guardar">
                        
                    </div>
                </form>
             
                <%-- Verificando si la variable resultado esta vacia --%>
                <% if(request.getParameter("resultado") != null){ %>
            <div class="alert alert-success col-md-10">
                <b> <%= request.getParameter("resultado") %> </b>
            </div>
                <%
                    }
                %>                  
            </div>
        
        <!--TABLA DE TURNOS-->
        <div class ="row col-md-6" style="margin-left: 400px; margin-top: -200px;">
    <table class="table table-striped table-bordered table-hover">
        <thead>
            <tr>
                <th>Id</th>
                <th>Horario</th>
                <th>Horario de entrada</th>
                <th>Horario de salida</th>
            </tr>
        </thead>
        <tbody>
            <%
                Conexion con = new Conexion();
                con.setRs("SELECT * FROM turno");
                ResultSet rs = con.getRs();
                while(rs.next()){         
            %>
            <tr>
                <td><%=rs.getString("id") %></td>
                <td><%=rs.getString("Horario") %></td>
                 <td><%=rs.getString("Horario_Entrada") %></td>
                 <td><%=rs.getString("Horario_Salida") %></td>
                <td><a class="btn btn-danger" href="eliminarturno.jsp?id=<%=rs.getString("id") %>">Eliminar</a></td>
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
