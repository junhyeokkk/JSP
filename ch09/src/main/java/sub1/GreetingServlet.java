package sub1;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//anonotation 자동 주소 맵핑 (web.xml에서 해줄 필요 없음)
@WebServlet("/greeting.do")
public class GreetingServlet extends HttpServlet {

	private static final long serialVersionUID = 7256300011072658008L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 클라이언트 요청이 GET일 경우
				System.out.println("GreetingServlet doGet ...");
				
				// HTML 출력
				resp.setContentType("text/html;charset=utf-8");
				
				PrintWriter writer = resp.getWriter();
				writer.println("<html>");
				writer.println("<head>");
				writer.println("<meta charset='UTF-8'/>");
				writer.println("<title>GreetingServlet</title>");
				writer.println("</head>");
				writer.println("<body>");
				writer.println("<h3>GreetingServlet</h3>");
				writer.println("<a href='/ch09/1.ServletTest.jsp'>Servlet 메인</a>");
				writer.println("<a href='/ch09/hello.do'>hello</a>");
				writer.println("<a href='/ch09/welcome.do'>welcome</a>");
				writer.println("<a href='/ch09/greeting.do'>greeting</a>");
				writer.println("</body>");
				writer.println("</html>");
				writer.close();
	}
	
	
}
