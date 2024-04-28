package days02;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(
		description = "서블릿 - get / post 요청 방식", 
		urlPatterns = { 
				"/days02/info.htm"
		})
public class Info extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	
    public Info() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("Info.doGet()~~~");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		out.print(" > 이름 :" + name + "<br>");
		out.print(" > 나이 :" + age + "<br>");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		out.print("Info.doPost()~~~");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		out.print(" > 이름 :" + name + "<br>");
		out.print(" > 나이 :" + age + "<br>");
	}

}
