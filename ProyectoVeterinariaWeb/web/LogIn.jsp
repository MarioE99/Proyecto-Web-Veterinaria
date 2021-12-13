<%-- 
    Document   : LogIn
    Created on : 12-05-2021, 09:05:55 AM
    Author     : meev9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INICIAR SESION</title>
        <style>

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



        </style>
    </head>
    <body>
        <div>
            <div>
                <div>
                    <h2>Inicio de Sesión</h2>
                    <%
                        if (request.getParameter("error") != null) {
                    %>
                    <div class="alert alert-danger">
                        <strong>Error!</strong>
                        <%= request.getParameter("error")%>
                        <br>
                    </div>
                    <%
                        }
                    %>
                    <form action="LogInControl.jsp" method="post">
                  
                        <div>
                            <label for="usuario">Usuario</label>
                            <input type="text" class="form-control" id="usuario" placeholder="Usuario" name="usuario" required>
                        </div>
                        <div>
                            <label for="clave">Password</label>
                            <input type="password" class="form-control" id="clave" placeholder="Password" name="clave" required>
                        </div>

                        <div>
                            <button class="btn btn-lg btn-primary btn-block" type="submit">Iniciar Sesión</button>
                        </div>                                
                    </form>                               
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
