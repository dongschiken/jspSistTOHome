package java_days07.guestbook.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java_days07.guestbook.service.DeleteMessageService;


public class DeleteMessageHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("> delete.do 요청 : DeleteMessageHandler.process() 호출됨...");
		
		int messageId = Integer.parseInt(request.getParameter("messageId") ); 
		String password = request.getParameter("password"); 
		  
		DeleteMessageService messageService =	DeleteMessageService.getInstance(); 
		messageService.delete(messageId, password); 
		
		response.sendRedirect("list.do?delete=success");  
		
		return null;
	}

}