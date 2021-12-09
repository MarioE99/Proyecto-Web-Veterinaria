<%-- 
    Document   : Turnos
    Created on : 11-28-2021, 08:59:23 PM
    Author     : meev9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <h1>Formulario de turnos</h1>

        <form action="turnocontrol.jsp" method="post">

            <label for="id">Código de turnos generado automáticamente</label>
            <input type="number" id="id" name="id" />
            <div>
                <label for="Horario">Horario:</label>
                <input type="text" id="Horario" name="Horario" />
            </div>
            <div>
                <label for="Horario_Entrada">Horario de entrada:</label>
                <input type="date" name="Horario_Entrada">
            </div>

            <div>
                <label for="Horario_Salida">Horario de salida:</label>
                <input type="date" name="Horario_Salida">

            </div>

            <input class="button" type="button" value="Enviar">

        </form>
    </body>
</html>
