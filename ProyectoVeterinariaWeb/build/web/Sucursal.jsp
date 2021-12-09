<%-- 
    Document   : Sucursal
    Created on : 12-08-2021, 06:56:30 PM
    Author     : meev9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sucursal</title>
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
        <h1>Sucursal</h1>
        
         <form action="sucursalcontrol.jsp" method="post">
            <div>
                <label for="id">Código de la sucursal generado automaticamente</label>

            </div>

            <div>
                <label for="Sucursal">Nombre de la sucursal:</label>
                <input type="text" name="Sucursal">

            </div>

            <div>
                <label for="Direccion">Direccion de la sucursal:</label>
                <input type="text" name="Direccion">

            </div>

            <div>
                <label for="Telefono">Telefono de la sucursal:</label>
                <input type="number" name="Telefono">

            </div>

            <div>
                <label for="Departamento">Departamento donde esta ubicado la sucursal:</label>
                <input type="text" name="Departamento">

            </div>

            <div>
                <label for="Municipio">Municipio donde se encuentra la sucursal:</label>
                <input type="text" name="Municipio">

            </div>
             
               <div>
                <label for="Encargado">Encargado de la sucursal:</label>
                <input type="text" name="Encargado">

            </div>


            <input class="button" type="button" value="Enviar">

        </form>
    </body>
</html>
