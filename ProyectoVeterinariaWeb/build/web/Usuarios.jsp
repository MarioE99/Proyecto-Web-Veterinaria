<%-- 
    Document   : Usuarios
    Created on : 11-28-2021, 08:25:25 PM
    Author     : meev9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios</title>

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
        <h1>Formulario de usuarios</h1>

        <form action="enviar" method="post">

            <label for="codusuario">El codigo se genera automaticamente</label>

            <div>


                <label for="Idrol">Escoje el Rol del usuario</label>
                <!--Aqui ira referenciado el rol del usuario de la tabla rol-->
                <select name="choice">
                    <option value="first">Administrador</option>
                    <option value="second">Cliente</option>

                </select>


            </div>

            <div>

                <label for="usuario">Digite el nombre del usuario</label>
                <input type="text" name="usuario">

            </div>

            <div>
                <label for="Contraseña">Digite la contraseña del usuario</label>
                <input type="password" name=Contraseña>
            </div>
            <input class="button" type="button" value="Enviar">



        </form>
    </body>
</html>
