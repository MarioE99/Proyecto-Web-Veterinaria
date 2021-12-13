<%-- 
    Document   : Menu
    Created on : 12-05-2021, 09:11:34 AM
    Author     : meev9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            ul {
                list-style-type: none;
                margin: 0;
                padding: 0;
                width: 200px;
                background-color: #f1f1f1;
            }

            li a {
                display: block;
                color: #000;
                padding: 8px 16px;
                text-decoration: none;
            }

            /* Change the link color on hover */
            li a:hover {
                background-color: #555;
                color: white;
            }
        </style>
        <title>MENU DE INICIO</title>
    </head>
    <body>
        <h1>Bienvenid al menu de veterinaria</h1>

        <ul>
            <li><a href="Turnos.jsp">Menu de turno</a></li>
            <li><a href="news.asp">News</a></li>
            <li><a href="contact.asp">Contact</a></li>
            <li><a href="about.asp">About</a></li>
        </ul>
    </body>
</html>
