package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class LogIn_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>INICIAR SESION</title>\n");
      out.write("        <style>\n");
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
      out.write("\n");
      out.write("\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div>\n");
      out.write("            <div>\n");
      out.write("                <div>\n");
      out.write("                    <h2>Inicio de Sesión</h2>\n");
      out.write("                    ");

                        if (request.getParameter("error") != null) {
                    
      out.write("\n");
      out.write("                    <div class=\"alert alert-danger\">\n");
      out.write("                        <strong>Error!</strong>\n");
      out.write("                        ");
      out.print( request.getParameter("error"));
      out.write("\n");
      out.write("                        <br>\n");
      out.write("                    </div>\n");
      out.write("                    ");

                        }
                    
      out.write("\n");
      out.write("                    <form action=\"LogInControl.jsp\" method=\"post\">\n");
      out.write("                  \n");
      out.write("                        <div>\n");
      out.write("                            <label for=\"usuario\">Usuario</label>\n");
      out.write("                            <input type=\"text\" class=\"form-control\" id=\"usuario\" placeholder=\"Usuario\" name=\"usuario\" required>\n");
      out.write("                        </div>\n");
      out.write("                        <div>\n");
      out.write("                            <label for=\"clave\">Password</label>\n");
      out.write("                            <input type=\"password\" class=\"form-control\" id=\"clave\" placeholder=\"Password\" name=\"clave\" required>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div>\n");
      out.write("                            <button class=\"btn btn-lg btn-primary btn-block\" type=\"submit\">Iniciar Sesión</button>\n");
      out.write("                        </div>                                \n");
      out.write("                    </form>                               \n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
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
