package app;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
@MultipartConfig(location="/")
public class Login extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	
    private User[] users = {
    	new User("casas222@gmail.com", "1234"),
    	new User("jcasas@icons.es", "1234"),
    	new User("jcasas@mundofranquicia.com", "1234"),
    	new User("casas222@hotmail.com", "1234")
    };
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		request.getSession().setAttribute("test", "test sesion");
		request.setAttribute("__SELF",request.getRequestURI());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Views/Login.jsp");

		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean canLogin = false;
		String email = (String) request.getParameter("email");
		String password = (String) request.getParameter("password");
		
		User user = new User(email, password);
	
		if(request.getParameter("logout") == null) {
			for(User u : users) {
				System.out.println(u.compareTo(user));
				if(u.compareTo(user) == 1) canLogin = true;
			}
			
			if(canLogin) {
				Cookie userCookie = new Cookie("user", user.serialize());
				userCookie.setMaxAge(6000);
				System.out.println(userCookie);
				response.addCookie(userCookie);
				request.getSession().setAttribute("user", user.serialize());
			} else {
				request.setAttribute("error","Incorret email or password");
			}
		} else {
			System.out.println("logout");
			for( Cookie c : request.getCookies() ) {
				if(c.getName().equals("user")) {
					c.setMaxAge(0);
					response.addCookie(c);
					
				}
			}
			canLogin = true;
		}
		
		request.setAttribute("canLogin",Boolean.toString(canLogin));
		request.setAttribute("email",email);
		request.setAttribute("password", password);
		
		
		
		doGet(request, response);
	}

}
