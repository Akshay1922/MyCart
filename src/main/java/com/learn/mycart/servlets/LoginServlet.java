package com.learn.mycart.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.learn.mycart.dao.UserDao;
import com.learn.mycart.entities.User;
import com.learn.mycart.helper.FactoryProvider;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try {
        	
        	PrintWriter out = response.getWriter();
        	
        	String email = request.getParameter("email");
        	String password = request.getParameter("password");
        	
        	//validation
        	
        	//authenticating user
        	UserDao userDao = new UserDao(FactoryProvider.getFactory());
        	User user = userDao.getUserByEmailAndPassword(email, password);
        	
        	HttpSession httpSession = request.getSession();
        	        	
        	//System.out.println(user);
        	if(user == null)
        	{
        		httpSession.setAttribute("message", "Invalid Details, try with another user.");
            	response.sendRedirect("login.jsp");
            	return;
        	} else {
        		out.println("<h1> Welcome "+ user.getUserName()+" </h1>");
        		
        		//login
        		httpSession.setAttribute("current-user", user);
        		
        		if(user.getUserType().equals("admin"))
        		{
        			//admin 
        			response.sendRedirect("admin.jsp");
        		}else if(user.getUserType().equals("normal"))
        		{
        			//Noraml
        			response.sendRedirect("normal.jsp");
        		}else
        		{
        			out.println("We have not identified user type.");
        		}
    	
        	}    	
      	
        	}catch(Exception e) {
        	e.printStackTrace();
        }
    }

	
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}
