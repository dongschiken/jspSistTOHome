<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2023. 12. 15. 오후 12:45:29</title>
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>
</style>
</head>
<body>
<h3>ex00_guestbook.jsp</h3>

<a href="/jspPro/webapp_days07/guestbook/list.do">방명록 목록 list.do</a>

<pre>
   20장(읽기.)
   p 427 Chapter 15  웹 어플리케이션의 일반적인 구성
                             + 방명록 구현
                             + MVC 패턴으로 구현
   1. 웹 어플리케이션을 개발할 때 [전형적인 구조]가 있다.
   2. 웹 어플리케이션의 전형적인 구성 요소 ( MVC )
     - 컨트롤러
     - 핸들러
     - jsp 뷰페이지
     - 서비스 클래스 
     - DAO 클래스
     
      - 한 번 개발 완료 !!! + 지속적으로 유지 보수.
                 X                      관리( 유지보수 )  쉽도록 구성 => MVC 패턴
     p 429  그림 15.5
     - JSP  - MVC 프레임워크 - 서비스클래스 -> DAO 클래스   
       JSP                               - 서비스클래스 -> DAO 클래스   
       JSP                               - 서비스클래스 -> DAO 클래스   
       JSP                               - 서비스클래스 -> DAO 클래스
       
       list.do -> [ MVC         ]
                       C  -M(핸들러)- 서비스클래스 -> DAO 클래스    
                  <-  V[list.jsp]
                       
      [1]  com.util.JdbcUtil.java   p 435   
      [2]  방명록 구현.....  p 444
             MessageDTO
             MessageDAO
             
             GetMessageService
             WriteMessageService
             DeleteMessageService
             
             ConnectionProvider     O
             JdbcUtil                        O
             
             [MVC 패턴]
             1. 컨트롤러
             2. comm
             andHandler.properties
        
       [3] web.xml       -> web_days10.xml  복사 붙이기.
             web.xml 사용
                 1. DBCP 설정부분
                 2. 인코딩 필터
                 
        [4]. days10 폴더
                   ㄴ guestbook        폴더 생성
                            ㄴ images     폴더 추가.
                    
        [5] 방명록 테이블 생성.     p 446  MySQL 
		        ㄱ. 
		       create table guestbook_message
			   (
			       message_id number not null primary key
			      , guest_name varchar2(50) not null
			      , password varchar2(10) not null
			      , message clob not  null
			   ) ;    
		       ㄴ.
		       create sequence seq_guestbook_message;         \
		       
		        Table          GUESTBOOK_MESSAGE                  이(가) 생성되었습니다.
		       Sequence    SEQ_GUESTBOOK_MESSAGE          이(가) 생성되었습니다.
           
          [6] MVC 패턴   
                 commandHandler.properties
                 요청URL = 핸들러                
                 요청URL = 핸들러       
          [7] 각종 패키지 추가 + 컨트롤러 생성 + 컨트롤러 web.xml 등록
                 1) days10.guestbook.command 패키지
                      ㄴ CommandHandler.java 인터페이스  + 복사 붙이기.
                      ㄴ GetMessageListHandler implements CommandHandler
                      
                 2) 컨트롤러 생성   
                     days10.guestbook.controller.DispatcherServlet    패키지만 생성하고 클래스는 어제 컨트롤러 그대로 복사 붙이기. 
                 3) web.xml 컨트롤러 등록...
                     web_days09_mvc.xml 파일 안에 서블릿 등록 복사 붙익.
                          
          [8] web.xml 등등 설정 확인 - 서버 시작.
          java.lang.ClassCastException: 
          class days10.guestbook.command.WriteMessageHandler cannot be cast to 
          class days09.mvc.command.CommandHandler 
          (days10.guestbook.command.WriteMessageHandler and days09.mvc.command.CommandHandler are in unnamed module of loader org.apache.catalina.loader.ParallelWebappClassLoader @437f33f9)            
           
          at days10.guestbook.controller.DispatcherServlet.init(DispatcherServlet.java:62)      
          
          3:09 수업 시작~~
          [9]  DTO 등록
          days10.guestbook.domain 패키지 
               ㄴ Message.java                p 448
          
          [10]  DAO 등록
          days10.guestbook.persistence 패키지 
               ㄴ IMessage.java 인터페이스
               ㄴ MessageImpl.java 클래스    p 450
               
          [11] 각종 Service 등록                            p 453
          days10.guestbook.service 패키지 
               ㄴ (1) p 454  서비스 에서 예외가 발생할 때 사용자 예외클래스 : ServiceException
               ㄴ (2) GetMessageListService.java 클래스   p 455
                         ㄴ   GetMessageListHandler  구현
          
          4:04 수업~
          [12] 방명록 목록 
              days10 폴더
                  ㄴ guestbook 폴더
                           ㄴ list.jsp 파일 추가
                           
          [13] 방명록 쓰기   
              list.jsp에서
              "방명록 쓰기 열기 " 클릭           
              "메시지 남기기 " 클릭       
              (1) WriteMessageService.java
              (2) WriteMessageHandler.java
              
          [14] 방명록 삭제.    
              확인: list.jsp.
              "메시지 삭제하기"  
              location.href="delete.do?messageId="+del_messageId+"&password="+del_password;
              (1) DeleteMessageService  구현
              (2) DeleteMessageHandler 구현
              
              (테스트)
              http://localhost/jspPro/days10/guestbook/delete.do?messageId=3&password=1234
             ㄱ) DB 삭제 확인  X
             
             delete.do => DeleteMessageHandler => DeleteMessageService => MessageImpl -> DB 
                 
           [15] 방명록 수정
              list.jsp
              "수정하기"  제일 우측에 있는 버튼 클릭     
              <a href="update.do?messageId=${ message.message_id }">[수정하기]</a>	  
              => days10.guestbook.command.UpdateMessageHandler  .process(){} 
              => days10.guestbook.service.UpdateMessageService  추가.
              =>                            update.jsp 포워딩.
              => "메시지 수정하기 " 버튼 클릭.
                  <form action="update.do" method="post">
             => days10.guestbook.command.UpdateMessageHandler  .process(){
                        GET
                           ㄴ  update.jsp 포워딩.
                        POST
                            ㄴ 새로 수정된 값
                                dao.update( con, message);
                                list.do. 포워딩.   
             }      
             
             .카톡.  : . 수정 처리 했습니다.
             
             내일 :  답변형 게시판 + MVC 
</pre> 

<script>
</script>
</body>
</html>