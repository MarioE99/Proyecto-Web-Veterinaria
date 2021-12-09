<%-- 
    Document   : Mascotas
    Created on : 12-08-2021, 06:39:46 PM
    Author     : meev9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mascotas</title>
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
        <h1>Mascotas</h1>

        <form action="mascotacontrol.jsp" method="post">
            <div>
                <label for="id">Código de la mascota generado automaticamente</label>

            </div>

            <div>
                <label for="codcliente">Escoja el cliente de la mascota</label>
                <select name="codcliente" id="cliente">
                    <option value="C1">Mario</option>
                    <option value="C2">Daniel</option>
                </select>
            </div>

            <div>
                <label for="Nombre">Nombre del cliente:</label>
                <input type="text" name="Nombre">

            </div>

            <div>
                <label for="Edad">Edad de la mascota:</label>
                <input type="number" name="Edad">

            </div>

            <div>
                <label for="Raza">Raza de la mascota:</label>
                <input type="text" name="Raza">

            </div>

            <div>
                <label for="Genero">Genero de la mascota:</label>
                <input type="text" name="Genero">

            </div>

            <div>
                <label for="Peso">Peso de la mascota:</label>
                <input type="number" name="Peso">

            </div>

            <div>
                <label for="Vacuna">Estado de la vacuna:</label>
                <input type="text" name="Vacuna">

            </div>





            <input class="button" type="button" value="Enviar">

        </form>
    </body>
</html>
