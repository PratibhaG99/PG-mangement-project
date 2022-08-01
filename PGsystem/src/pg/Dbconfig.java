package pg;

import java.sql.*;

public class Dbconfig {
	public static Connection connect() throws Exception{
		Class.forName("com.mysql.jdbc.Driver");
		final String url="jdbc:mysql://localhost/PGproject";
		Connection con=DriverManager.getConnection(url,"root","");
		return con;
	}
	
	public static int getOwnerID() throws Exception{
		Connection c=connect();
		Statement s=c.createStatement();
		ResultSet rs=s.executeQuery("select max(ownerid) from owner");
		rs.next();
		int ownerid=0;
		if(rs.getInt(1)==0)
			ownerid=101;
		else
			ownerid=rs.getInt(1)+1;
		
		c.close();
		return ownerid;
	}
	
	public static int countRecords(String table) throws Exception{
		Connection con=connect();
		final String sql="select count(*) from "+table;
		ResultSet rs=con.createStatement().executeQuery(sql);
		rs.next();
		int result=rs.getInt(1);
		con.close();
		return result;
	}
}