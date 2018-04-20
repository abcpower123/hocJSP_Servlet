package flwshop.model.DAO;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import flwshop.model.beans.Flower;
import flwshop.model.sqlutil.SqlUtil;


public class FlowerDAO {
	private ArrayList<Flower> listFlower;
	
	private SqlUtil sqlUtil;

	public FlowerDAO() {
		sqlUtil=new SqlUtil();
		listFlower=new ArrayList<>();
	}
	public ArrayList<Flower> listAllFlower() throws Exception {
		ArrayList<Flower> listFlower=new ArrayList<>();
		String sql="select * from Product";
		sqlUtil.connect();
		Statement st=sqlUtil.jdbcConnection.createStatement();
		ResultSet rs=st.executeQuery(sql);
		while(rs.next()) {
			Flower b=new Flower(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8));
			 
			listFlower.add(b);
		}
		rs.close();
		sqlUtil.disconnect();
		return listFlower;
	}
	public ArrayList<Flower> listFlowerWithIndex(int i) throws Exception {
		ArrayList<Flower> listAllFlower=this.listAllFlower();
		ArrayList<Flower> listFlower=new ArrayList<>();
		int start= (i-1)*4;
		int end=start+4;
		for (;start<end;start++) {
			if(start<listAllFlower.size())
			listFlower.add(listAllFlower.get(start));
			else listAllFlower.add(new Flower());
		}
		
		return listFlower;
	}
}
