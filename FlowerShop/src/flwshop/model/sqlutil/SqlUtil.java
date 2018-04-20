package flwshop.model.sqlutil;

import java.sql.Connection;
import java.sql.DriverManager;

public class SqlUtil {
	private String jdbcURL="jdbc:sqlserver://localhost:1433;databaseName=BanHoa";
	private String jdbcUsername="sa";
	private String jdbcPassword="suhao123";
	public Connection jdbcConnection=null;
	
	public void connect() throws Exception {
		if(!(jdbcConnection==null||jdbcConnection.isClosed())) return;
		
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		jdbcConnection=DriverManager.getConnection(jdbcURL,jdbcUsername,jdbcPassword);
		
	}
	public void disconnect() throws Exception{
		if(jdbcConnection!=null&&!jdbcConnection.isClosed()) {
			jdbcConnection.close();
		}
	}
}
