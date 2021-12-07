<%@page session="true" language="java" import="java.util.*" %>
<%@page import="edu.ujmd.ProyectoVeterinariaWeb.controladores.UsuariosJpaController" import="java.sql.*" %>
<%@page import="edu.ujmd.ProyectoVeterinariaWeb.entidades.Usuarios" import="java.sql.*" %>
<%@page import="edu.ujmd.conexion.Conexion" %>
<%
    Usuarios usuent = new Usuarios();
    UsuariosJpaController usucontrol = new UsuariosJpaController();
    usuent.setUsuario(request.getParameter("usuario"));
    usuent.setContraseña(request.getParameter("clave"));
    usucontrol.create(usuent);
    String resultado = "";

    if (resultado == null || resultado.isEmpty()) {

        //Se asignan parametros de sesión
        HttpSession sesionOk = request.getSession();
        sesionOk.setAttribute("usuario", usuent.getUsuario());
%>
<jsp:forward page="Menu.jsp" />
<%
} else {
%>
<jsp:forward page="LogIn.jsp">
    <jsp:param name="error" value="Usuario y/o clave Incorrecto. Vuelve a intentarlo" />
</jsp:forward>
<%
    }

%>
