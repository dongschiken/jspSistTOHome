package java_days07.guestbook.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java_days07.guestbook.domain.Message;
import java_days07.guestbook.service.GetMessageListService;
import java_days07.guestbook.service.UpdateMessageService;



//       update.do?messageId=3
public class UpdateMessageHandler  implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // request.setCharacterEncoding("UTF-8");   필터 
		
		System.out.println("> update.do 요청 : UpdateMessageHandler.process() GET 호출됨...");
		
		if( request.getMethod().equalsIgnoreCase("GET") ) {
			GetMessageListService messageService = GetMessageListService.getInstance();
			int messageId = Integer.parseInt(request.getParameter("messageId") );
			Message msg = messageService.getMessage(messageId );
			request.setAttribute("msg", msg);
			return "/days07/webapp_days07/guestbook/update.jsp";  // 포워딩.
			
		}else if(request.getMethod().equalsIgnoreCase("POST")) {			
			 
			System.out.println("> update.do 요청 : UpdateMessageHandler.process() POST 호출됨...");
			
			Message message = new Message();
				  message.setMessage_id( Integer.parseInt( request.getParameter("h_id") ));
				  message.setGuest_name(request.getParameter("guest_name"));  
				  message.setPassword(request.getParameter("password"));  
				  message.setMessage(request.getParameter("message"));
		    
			// 서비스클래스 -> DAO -> update
			UpdateMessageService messageService = 	UpdateMessageService.getInstance();			//
			messageService.update(message);
			// return "list.do";
			response.sendRedirect("list.do?update=success");  
			 
		} 
		return null;
	}

}
