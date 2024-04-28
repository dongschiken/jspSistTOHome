package java_days07.guestbook.controller;
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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java_days07.guestbook.command.CommandHandler;

public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public DispatcherServlet() {
        super(); 
        // 초기화 작업 
    }
     
	@Override
	public void destroy() { 
		super.destroy();
	}
 
	// key = "/board/list.do" 요청URL
	// value = "days09.mvc.command.ListHandler"  X   생성된  객체 생성 
	private Map<String, CommandHandler>  commandHandlerMap = new HashMap<String, CommandHandler>();
	
	@Override
	public void init() throws ServletException {
		// 초기화 작업.
		// 1.         /WEB-INF/commandHandler.properties      
		String path = this.getInitParameter("path");
		String realPath = this.getServletContext().getRealPath(path);
		
		Properties prop = new Properties();		
		try(FileReader reader = new FileReader(realPath) ) {
			prop.load(reader);
		} catch (Exception e) {
			 throw new ServletException();
		}
		
		// commandHandlerMap<url, 실제 핸들러 객체 생성>
		Set<Entry<Object, Object>> set =  prop.entrySet();
		Iterator<Entry<Object, Object>> ir = set.iterator();
		while( ir.hasNext()) {
			Entry<Object, Object> entry = ir.next();
			String url = (String) entry.getKey();    // "/board/list.do" 
			String className = (String) entry.getValue();                    //  "days09.mvc.command.ListHandler"
			
			try {
				Class<?> handlerClass = Class.forName(className);
				CommandHandler  commandHandler = (CommandHandler) handlerClass.newInstance();				
				commandHandlerMap.put(url, commandHandler);
				System.out.println(commandHandlerMap);
			} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) { 
				e.printStackTrace();
			}
			
		} // while
		
	}  // init

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// System.out.println("> DispatcherServlet.doGet() 호출됨...");
		// [ 1 요청 URL 분석 ]
		//    [/board/list.do], edit.do, [/board/write.do] ~~   ???.do
		String requestURI =  request.getRequestURI();  //          "/jspPro/board/list.do"
		// String requestURL = request.getRequestURL().toString();  // http://localhost/jspPro/board/list.do
		
		//System.out.println(requestURI);
		//System.out.println(requestURL);
		
		//  requestURI 경로 에서 컨텍스트패스만 제거하면       commandHandlerMap  key =       "/board/list.do"
		String contextPath = request.getContextPath();   //   "/jspPro"
		
		if (   requestURI.indexOf(contextPath)  == 0 ) {
			int beginIndex = contextPath.length();
			requestURI = requestURI.substring(beginIndex);
		}
		
		System.out.println(requestURI);
		System.out.println(contextPath);
		
		// [ 2 로직 처리 - 핸들러 검색 ]
		//    1) CommandHandler 인터페이스 + process()
		//    2) [WriteHandler], WriteHandler 모델. 
		//    3) commandHandler.properties                 -> Properties 컬렉션 클래스 
		
		//    "/board/write.do"  요청URL 없는 핸들러 객체 : p536 NullHandler 클래스 선언
		CommandHandler handler = commandHandlerMap.get(requestURI);
 
		// 3 String viewpage =핸들러.process();     		
		String viewPage = null;
		
		System.out.println(handler);
		
		try {
			viewPage = handler.process(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		// 4 포워딩, 리다렉트 체크
		// request.ㅎetAttribute("포리");
		// if( 1 ) 포워딩
		// else if( 2) 리다이렉트
		
		// (정의)  포워딩.
		if( viewPage != null ) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
		
	}
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
