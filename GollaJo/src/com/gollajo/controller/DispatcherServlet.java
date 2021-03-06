package com.gollajo.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet(urlPatterns = "*.do", loadOnStartup = 1)
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String requestURI = request.getRequestURI(); // project/command.do
		System.out.println("RequestURI :: "+requestURI);
		
		String contextPath = request.getContextPath();
		System.out.println("ContextPath :: "+contextPath);// project
		
		String command = requestURI.substring(contextPath.length() + 1);// command.do
		System.out.println("Command "+command);
		
		String path = "index.html";
		ModelAndView mv = null;
		
		Controller controller = HandlerMapping.getInstance().createController(command);
		
		try {
			mv = controller.execute(request, response);
			path = mv.getPath();
			
		}catch(Exception e) {
			
		}
		if(mv != null) {
			if(mv.isRedirect()) response.sendRedirect(path);
			else request.getRequestDispatcher(path).forward(request, response);
		}		
	}
}


















