package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.media.jfxmedia.track.Track.Encoding;

import model.Book;
import model.BookDAO;


public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookDAO bd=null;
    public ControllerServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		bd=new BookDAO();
		String action=request.getServletPath();
		System.out.println(action);
		try {
			switch (action) {
			case "/logout":
				HttpSession session=request.getSession();
				session.setAttribute("login", false);
				response.sendRedirect("Login.jsp");
				break;
			case "/new":
				showNewForm(request,response);
				break;
			case "/insert":
				insertBook(request,response);
				break;
			case "/delete":
				deleteBook(request,response);
				break;
			case "/edit":
				showEditForm(request,response);
				break;
			case "/update":
				updateBook(request,response);
				break;
			default:
				listBook(request,response);
				break;
			}
		} catch (Exception e) {
			throw new ServletException(e);
		}
		
	}

	private void updateBook(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Book b=new Book(Integer.parseInt(request.getParameter("id")),
				request.getParameter("title"), request.getParameter("author"),Float.parseFloat(request.getParameter("price")));
		bd.updateBook(b);
		response.sendRedirect("/MVC_CRUD/list");
	}
	private void listBook(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Book> listBook=bd.listAllBooks();
		request.setAttribute("listBook", listBook);
		RequestDispatcher rd=request.getRequestDispatcher("BookList.jsp");
		rd.forward(request, response);
	}
	private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int id=Integer.parseInt(request.getParameter("id"));
		Book b=bd.getBook(id);
		request.setAttribute("book", b);
		RequestDispatcher rs=request.getRequestDispatcher("BookForm.jsp");
		rs.forward(request, response);
	}
	private void deleteBook(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int id=Integer.parseInt(request.getParameter("id"));
		bd.deleteBook(new Book(id, "", "", 0));
		response.sendRedirect("/MVC_CRUD/list");
		
	}
	private void insertBook(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Book b=new Book(0, request.getParameter("title"), request.getParameter("author"),Float.parseFloat(request.getParameter("price")));
		bd.insertBook(b);
		response.sendRedirect("/MVC_CRUD/list");
	}
	private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd=request.getRequestDispatcher("BookForm.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
