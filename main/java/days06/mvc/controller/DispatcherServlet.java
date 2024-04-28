package days06.mvc.controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days06.mvc.command.CommandHandler;


//@WebServlet("/DispatcherServlet")
public class DispatcherServlet extends HttpServlet  {
	private static final long serialVersionUID = 1L;
	
	
	public Map<String, CommandHandler> commandHandlerMap = new HashMap<String, CommandHandler>();
	

	public DispatcherServlet() {
		super();
	}
	
    @Override
	public void destroy() {
		super.destroy();
	}


	@Override
	public void init() throws ServletException {
		super.init();
		
		String path = this.getInitParameter("path");
		
		String realPath = this.getServletContext().getRealPath(path);
		
		Properties properties = new Properties();
		
		try (FileReader fr = new FileReader(realPath)){
			properties.load(fr);
		} catch (Exception e) {
			throw new ServletException();
		}
		
		
		Set<Entry<Object, Object>> se = properties.entrySet();
		Iterator ir = se.iterator();
		while (ir.hasNext()) {
			Entry entry = (Entry) ir.next();
			
			String url = (String)entry.getKey();
			String className = (String)entry.getValue();
			
			
			
			Class commandClass = null;
			
			try {
				commandClass = Class.forName(className);
				
				CommandHandler commandHandler = (CommandHandler)commandClass.newInstance();
				
				this.commandHandlerMap.put(url, commandHandler);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
			
		}
		
	}




	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		String realURI = request.getRequestURI();
		
		String context = request.getContextPath();
		
		int contextLeng = context.length();
		
		
		realURI = realURI.substring(contextLeng);
		
		
		CommandHandler commandHandler = this.commandHandlerMap.get(realURI);
		
		String view = null;
		
		try {
			view = commandHandler.process(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if( view != null ) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
