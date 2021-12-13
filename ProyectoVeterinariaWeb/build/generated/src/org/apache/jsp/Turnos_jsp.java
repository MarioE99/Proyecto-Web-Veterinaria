package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.sql.*;
import java.*;
import edu.ujmd.conexiones.Conexion;

public final class Turnos_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

 String usuario = "";
 HttpSession sesionOk = request.getSession();
 if (sesionOk.getAttribute("usuario") == null) {

      out.write('\n');
      if (true) {
        _jspx_page_context.forward("LogIn.jsp" + "?" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("error", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("Es obligatorio identificarse", request.getCharacterEncoding()));
        return;
      }
      out.write('\n');

 }

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Turnos</title>\n");
      out.write("\n");
      out.write("        <style>\n");
      out.write("\n");
      out.write("            input[type=text], select {\n");
      out.write("                width: 100%;\n");
      out.write("                padding: 12px 20px;\n");
      out.write("                margin: 8px 0;\n");
      out.write("                display: inline-block;\n");
      out.write("                border: 1px solid #ccc;\n");
      out.write("                border-radius: 4px;\n");
      out.write("                box-sizing: border-box;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            input[type=password], select {\n");
      out.write("                width: 100%;\n");
      out.write("                padding: 12px 20px;\n");
      out.write("                margin: 8px 0;\n");
      out.write("                display: inline-block;\n");
      out.write("                border: 1px solid #ccc;\n");
      out.write("                border-radius: 4px;\n");
      out.write("                box-sizing: border-box;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("\n");
      out.write("            input[type=submit] {\n");
      out.write("                width: 100%;\n");
      out.write("                background-color: #4CAF50;\n");
      out.write("                color: white;\n");
      out.write("                padding: 14px 20px;\n");
      out.write("                margin: 8px 0;\n");
      out.write("                border: none;\n");
      out.write("                border-radius: 4px;\n");
      out.write("                cursor: pointer;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            input[type=submit]:hover {\n");
      out.write("                background-color: #45a049;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            div {\n");
      out.write("                border-radius: 5px;\n");
      out.write("                background-color: #f2f2f2;\n");
      out.write("                padding: 20px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            button {\n");
      out.write("                background-color: #4CAF50; /* Green */\n");
      out.write("                border: none;\n");
      out.write("                color: white;\n");
      out.write("                padding: 15px 32px;\n");
      out.write("                text-align: center;\n");
      out.write("                text-decoration: none;\n");
      out.write("                display: inline-block;\n");
      out.write("                font-size: 16px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            button:hover {\n");
      out.write("                background-color: black;\n");
      out.write("                color: white;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Formulario de turnos</h1>\n");
      out.write("\n");
      out.write("        <div class=\"row col-md-5\">\n");
      out.write("                <form role=\"form\" action=\"turnocontrol.jsp\" method=\"post\">\n");
      out.write("                    <div class=\"col-md-10\">\n");
      out.write("                        \n");
      out.write("                        <div class=\"well well-sm\">\n");
      out.write("                            <strong><span class=\"glyphicon glyphicon-asterisk\"></span>Campos requeridos</strong>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label for=\"id\">Id</label>\n");
      out.write("                            <div class=\"input-group\">\n");
      out.write("                                <input type=\"text\" class=\"form-control\" name=\"id\"  placeholder=\"Ingrese el ID\">\n");
      out.write("                                <span class=\"input-group-addon\"><span class=\"glyphicon glyphicon-asterisk\"></span></span>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label for=\"Horario\">Escriba si es Diurno(D) o Nocturno(N)</label>\n");
      out.write("                            <div class=\"input-group\">\n");
      out.write("                                <input type=\"text\" class=\"form-control\" name=\"Horario\" id=\"Horario\" placeholder=\"Ingrese la hora\" required>\n");
      out.write("                                <span class=\"input-group-addon\"><span class=\"glyphicon glyphicon-asterisk\"></span></span>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        \n");
      out.write("                         <div class=\"form-group\">\n");
      out.write("                            <label for=\"Horario_Entrada\">Seleccione el horario de entrada</label>\n");
      out.write("                            <div class=\"input-group\">\n");
      out.write("                                <input type=\"date\" class=\"form-control\" name=\"Horario_Entrada\" id=\"entrada\" required>\n");
      out.write("                                <span class=\"input-group-addon\"><span class=\"glyphicon glyphicon-asterisk\"></span></span>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        \n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label for=\"Horario_Salida\">Seleccione el horario de salida</label>\n");
      out.write("                            <div class=\"input-group\">\n");
      out.write("                                <input type=\"date\" class=\"form-control\" name=\"Horario_Salida\" id=\"entrada\" required>\n");
      out.write("                                <span class=\"input-group-addon\"><span class=\"glyphicon glyphicon-asterisk\"></span></span>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <input type=\"submit\" class=\"btn btn-info\" value=\"Guardar\">\n");
      out.write("                        \n");
      out.write("                    </div>\n");
      out.write("                </form>\n");
      out.write("             \n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
 if(request.getParameter("resultado") != null){ 
      out.write("\n");
      out.write("            <div class=\"alert alert-success col-md-10\">\n");
      out.write("                <b> ");
      out.print( request.getParameter("resultado") );
      out.write(" </b>\n");
      out.write("            </div>\n");
      out.write("                ");

                    }
                
      out.write("                  \n");
      out.write("            </div>\n");
      out.write("        \n");
      out.write("        <!--TABLA DE TURNOS-->\n");
      out.write("        <div class =\"row col-md-6\" style=\"margin-left: 400px; margin-top: -200px;\">\n");
      out.write("    <table class=\"table table-striped table-bordered table-hover\">\n");
      out.write("        <thead>\n");
      out.write("            <tr>\n");
      out.write("                <th>Id</th>\n");
      out.write("                <th>Horario</th>\n");
      out.write("                <th>Horario de entrada</th>\n");
      out.write("                <th>Horario de salida</th>\n");
      out.write("            </tr>\n");
      out.write("        </thead>\n");
      out.write("        <tbody>\n");
      out.write("            ");

                Conexion con = new Conexion();
                con.setRs("SELECT * FROM turno");
                ResultSet rs = con.getRs();
                while(rs.next()){         
            
      out.write("\n");
      out.write("            <tr>\n");
      out.write("                <td>");
      out.print(rs.getString("id") );
      out.write("</td>\n");
      out.write("                <td>");
      out.print(rs.getString("Horario") );
      out.write("</td>\n");
      out.write("                 <td>");
      out.print(rs.getString("Horario_Entrada") );
      out.write("</td>\n");
      out.write("                 <td>");
      out.print(rs.getString("Horario_Salida") );
      out.write("</td>\n");
      out.write("                <td><a class=\"btn btn-danger\" href=\"eliminarturno.jsp?id=");
      out.print(rs.getString("id") );
      out.write("\">Eliminar</a></td>\n");
      out.write("            </tr>\n");
      out.write("            ");
 
                }
            con.cerrarConexion();
            
      out.write("\n");
      out.write("        </tbody>\n");
      out.write("    </table>\n");
      out.write("</div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
