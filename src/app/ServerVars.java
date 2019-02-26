package app;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServerVars
 */
@WebServlet("/")
public class ServerVars extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServerVars() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String[][] serverVariables =
		      { { "AUTH_TYPE", request.getAuthType() },
		        { "CONTENT_LENGTH", String.valueOf(request.getContentLength()) },
		        { "CONTENT_TYPE", request.getContentType() },
		        { "DOCUMENT_ROOT", getServletContext().getRealPath("/") },
		        { "PATH_INFO", request.getPathInfo() },
		        { "PATH_TRANSLATED", request.getPathTranslated() },
		        { "QUERY_STRING", request.getQueryString() },
		        { "REMOTE_ADDR", request.getRemoteAddr() },
		        { "REMOTE_HOST", request.getRemoteHost() },
		        { "REMOTE_USER", request.getRemoteUser() },
		        { "REQUEST_METHOD", request.getMethod() },
		        { "SCRIPT_NAME", request.getServletPath() },
		        { "SERVER_NAME", request.getServerName() },
		        { "SERVER_PORT", String.valueOf(request.getServerPort()) },
		        { "SERVER_PROTOCOL", request.getProtocol() },
		        { "SERVER_SOFTWARE", getServletContext().getServerInfo() }
		      };
		
		request.setAttribute("serverVariables", serverVariables);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Views/ServerVars.jsp");
		
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
