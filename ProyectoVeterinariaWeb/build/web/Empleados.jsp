<%-- 
    Document   : Empleados
    Created on : 12-08-2021, 05:48:41 PM
    Author     : meev9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empleados</title>

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

        <form action="empleadocontrol.jsp" method="post">
            <div>
                <label for="id">Código del empleado generado automaticamente</label>

            </div>

            <div>
                <label for="id">Código del turno</label>
                <label for="Turno">Seleccione el turno del empleado:</label>
                <select name="Turno" id="cargo">
                    <option value="Horarioentrada">Horario entrada</option>
                    <option value="HorarioSalida">Horario de salida</option>
                </select>
            </div>
            <div>
                <label for="idcargo">Cargo del empleadp:</label>
                <select name="Cargo" id="cargo">
                    <option value="Programador">Programador</option>
                    <option value="Gerenteventas">Gerente de ventas</option>
                </select>
            </div>
            <div>
                <label for="Nombre">Nombre del empleado:</label>
                <input type="text" name="Nombre">
            </div>

            <div>
                <label for="Apellido">Apellido del empleado:</label>
                <input type="text" name="Apellido">

            </div>



            <div>
                <label for="Telefono">Numero de telefono:</label>
                <input type="number" name="Telefono">

            </div>

            <div>
                <label for="DUI">Numero de DUI:</label>
                <input type="number" name="DUI">

            </div>

            <div>
                <label for="Cargo">Digite el cargo del empleado:</label>
                <input type="text" name="Cargo">

            </div>

            <input class="button" type="button" value="Enviar">

        </form>
    </body>
</html>
