<%-- 
    Document   : Medicamento
    Created on : 12-08-2021, 06:47:59 PM
    Author     : meev9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Medicamento</title>
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
        <h1>Medicamento</h1>
        <form action="medicamentocontrol.jsp" method="post">
            <div>
                <label for="id">Código del medicamento generado automaticamente</label>

            </div>

            <div>
                <label for="Comercial">Nombre comercial del medicamento:</label>
                <input type="text" name="Comercial">

            </div>

            <div>
                <label for="Generico">Nombre generico del medicamento:</label>
                <input type="text" name="Generico">

            </div>

            <div>
                <label for="Descripcion">Descripcion del medicamento:</label>
                <input type="text" name="Descripcion">

            </div>

            <div>
                <label for="Reacciones">Reacciones del medicamento:</label>
                <input type="text" name="Reacciones">

            </div>

            <div>
                <label for="Dosis">Dosis:</label>
                <input type="text" name="Dosis">

            </div>


            <input class="button" type="button" value="Enviar">

        </form>
    </body>
</html>
