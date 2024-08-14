package sub1;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet{
	
	//서블릿 식별 버전ID (선언해주는게 좋음)
	private static final long serialVersionUID = 4234852702204424689L;

	@Override
	public void init() throws ServletException {
		// 서블릿이 최초로 실행될때 (초기화메서드)
		System.out.println("HelloServlet init ...");
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 클라이언트 요청이 GET일 경우
		System.out.println("HelloServlet doGet ...");
		
		// HTML 출력
		resp.setContentType("text/html;charset=utf-8");
		
		PrintWriter writer = resp.getWriter();
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<meta charset='UTF-8'/>");
		writer.println("<title>HelloServlet</title>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<h3>HelloServlet</h3>");
		writer.println("<a href='/ch09/1.ServletTest.jsp'>Servlet 메인</a>");
		writer.println("<a href='/ch09/hello.do'>hello</a>");
		writer.println("<a href='/ch09/welcome.do'>welcome</a>");
		writer.println("<a href='/ch09/greeting.do'>greeting</a>");
		writer.println("</body>");
		writer.println("</html>");
		writer.close();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 클라이언트 요청이 POST일 경우
		System.out.println("HelloServlet doPost ...");
	}
	@Override
	public void destroy() {
		// 서블릿이 종료될때 
		System.out.println("HelloServlet destory ...");
	}
}
