package login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LogAcc
 */
@WebServlet("/LogAcc")
public class LogAcc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogAcc() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter pw=response.getWriter();
		String html="<head>\r\n" + 
				"	<title>Result</title>\r\n" + 
				"	<meta charset=\"utf-8\">\r\n" +
				"	<link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\">\r\n" + 
				"</head>\r\n<body>";
		pw.println(html+"<h1>"+request.getParameter("email")+" login successfully</h1></body>");
		pw.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
