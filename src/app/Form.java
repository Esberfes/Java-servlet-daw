package app;


import java.awt.List;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class Form
 */
@WebServlet("/form")
@MultipartConfig(location="/")
public class Form extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Form() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		request.setAttribute("__SELF",request.getRequestURI());
	
		RequestDispatcher dispatcher = request.getRequestDispatcher("Views/Form.jsp");
		
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<String> formParameters = new ArrayList<String>();
		
		
		String email = (String) request.getParameter("email");
		String password = (String) request.getParameter("password");
		String adress = (String) request.getParameter("adress");
		String city = (String) request.getParameter("city");
		String cp = (String) request.getParameter("cp");
		String[] check = request.getParameterValues("check[]");

		String uploadPath = getServletContext().getRealPath("")  + "files";
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) uploadDir.mkdir();
		for (Part part : request.getParts()) {
		    String fileName =  getFileName(part);
		    if(fileName == null) continue;
		    System.out.println(uploadPath + File.separator + fileName);
		    part.write(uploadPath + File.separator + fileName);
		}
		
		request.setAttribute("email",email);
		request.setAttribute("password", password);
		request.setAttribute("adress",adress);
		request.setAttribute("city", city);
		request.setAttribute("email",email);
		request.setAttribute("cp", cp);
		request.setAttribute("check", check);
		request.setAttribute("__SELF",request.getRequestURI());
		
		doGet(request, response);
	}
	
	   public String getFileName(Part part) {
	        String contentHeader = part.getHeader("content-disposition");
	        String[] subHeaders = contentHeader.split(";");
	        for(String current : subHeaders) {
	            if(current.trim().startsWith("filename")) {	         	
					 String[] sub = current.replace("\\", "/").split("/");
					 String file = sub[sub.length - 1].replace("\"", "");
					 file = file.replace("filename=", "");
					 return file;
	            }
	        }
	        return null;
	    }
}
