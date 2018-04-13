package controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.net.httpserver.Filter.Chain;

import model.BookDAO;

/**
 * Servlet implementation class LogFilter
 */

public class LogFilter extends HttpServlet implements Filter {
	private static final long serialVersionUID = 1L;
    
    public LogFilter() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("vao filter");
		HttpServletRequest rq=(HttpServletRequest) request;
		HttpServletResponse rs=(HttpServletResponse) response;
		HttpSession session=rq.getSession();
		
		//check da login chua
				String action=rq.getServletPath();
				if (action.equals("/Log")) {
					BookDAO bd=new BookDAO();
					try {
					boolean d=(boolean) session.getAttribute("login");
					if(d) rs.sendRedirect("list");
					}
					
					catch (Exception e) {
						
					}
						try {
							if(bd.checklogin(rq.getParameter("username"), rq.getParameter("password"))) {	//check ok
								session.setAttribute("login", true);
								rs.sendRedirect("list");
								chain.doFilter(request, response); //cho qua
								System.out.println("Cho qua");
								
							
							}
							else {
								RequestDispatcher rd=request.getRequestDispatcher("Error.jsp");
								rd.forward(rq, rs);
								
							}
						} catch (Exception e) {
							
							e.printStackTrace();
							
						}
						
					return;
				}
				
		try {
			boolean a=(boolean) session.getAttribute("login");
			if(a==false) dologin(rq,rs);
			else {
			System.out.println(rq.getServletPath());
			
			if(rq.getServletPath().equals("/Login.jsp")) rs.sendRedirect("list");
			else chain.doFilter(request, response);
			
			return;}
			}
			catch (Exception e) {
				dologin(rq,rs);
				
			}	
		
		
	}


	private void dologin(HttpServletRequest request,HttpServletResponse responses) throws ServletException, IOException {
		RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
		rd.forward(request, responses);
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}

}
