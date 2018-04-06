package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
public class BookDAO {
	//default value
	private String jdbcURL="jdbc:sqlserver://localhost:1433;databaseName=BookStore";
	private String jdbcUsername="sa";
	private String jdbcPassword="suhao123";
	private Connection jdbcConnection=null;
	public BookDAO() {	
	}
	
	public BookDAO(String jdbcURL, String jdbcUsername, String jdbcPassword, Connection jdbcConnection) {
		this.jdbcURL = jdbcURL;
		this.jdbcUsername = jdbcUsername;
		this.jdbcPassword = jdbcPassword;
		this.jdbcConnection = jdbcConnection;
	}

	private void connect() throws Exception {
		if(!(jdbcConnection==null||jdbcConnection.isClosed())) return;
		
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		jdbcConnection=DriverManager.getConnection(jdbcURL,jdbcUsername,jdbcPassword);
		
	}
	public void disconnect() throws Exception{
		if(jdbcConnection!=null&&!jdbcConnection.isClosed()) {
			jdbcConnection.close();
		}
	}
	public boolean insertBook(Book book) throws Exception {
		String sql="INSERT INTO dbo.book VALUES  ( ?, ?, ? )";
		connect();
		PreparedStatement st=jdbcConnection.prepareStatement(sql);
		st.setString(1, book.getTitle());
		st.setString(2, book.getAuthor());
		st.setFloat(3, book.getPrice());
		boolean rowInserted=st.executeUpdate()>0;
		st.close();
		disconnect();
		return rowInserted;
	}
	
	public List<Book> listAllBooks() throws Exception {
		List<Book> listBook=new ArrayList<>();
		String sql="select * from book";
		connect();
		Statement st=jdbcConnection.createStatement();
		ResultSet rs=st.executeQuery(sql);
		while(rs.next()) {
			Book b=new Book();
			 b.setId(rs.getInt(1));
			b.setTitle(rs.getString(2));
			b.setAuthor(rs.getString(3));
			b.setPrice(rs.getFloat(4));
			listBook.add(b);
		}
		rs.close();
		disconnect();
		return listBook;
	}
	
	public boolean deleteBook(Book book) throws Exception{
		String sql="delete from book where book_id =?";
		connect();
		PreparedStatement ps=jdbcConnection.prepareStatement(sql);
		ps.setInt(1, book.getId());
		boolean rowAffected=ps.executeUpdate()>0;
		ps.close();
		disconnect();
		return rowAffected;
	}
	public boolean updateBook(Book book) throws Exception{
		String sql="UPDATE dbo.book " + 
				"SET title=?,author=?,price=? " + 
				" WHERE book_id=? ";
		connect();
		PreparedStatement ps=jdbcConnection.prepareStatement(sql);
		ps.setString(1, book.getTitle());
		ps.setString(2, book.getAuthor());
		ps.setFloat(3, book.getPrice());
		ps.setInt(4, book.getId());
		boolean rowAffected=ps.executeUpdate()>0;
		ps.close();
		disconnect();
		return rowAffected;
	}
	public Book getBook(int id) throws Exception {
		connect();
		Book b=null;
		PreparedStatement ps= jdbcConnection.prepareStatement("select * from book where book_id=?");
		ps.setInt(1, id);
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			b=new Book(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4));
		}
		rs.close();
		disconnect();
		return b;
	}
}
