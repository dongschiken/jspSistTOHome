package days02;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*@WebServlet(
		description = "서블릿 어노테이션 방식", 
		urlPatterns = { 
				"/hello", 
				"/days02/hello.html"
		})*/
public class Hello extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	
    public Hello() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter()
		.append("hello world~<br>")
		.append("Served at: ")
		.append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);	
	}

}
