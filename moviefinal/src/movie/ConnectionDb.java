package movie;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.sql.*;

public class ConnectionDb {
	public static Connection getConnection(){
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/moviereview?serverTimezone=Asia/Seoul&useSSL=false"; 
			String userId ="";
			String userPw ="";
			conn = DriverManager.getConnection(url,userId,userPw); 
			System.out.println("Connection ok!!");
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			System.out.println("Connection fail!!");
		}
		return conn;
	}
	//connection close
	public static void close(Connection conn) {
		try {
			if(conn!=null) {conn.close();}
		} catch(Exception e) {
			System.out.println("Connection close");
		}
	}
	//preparedstatement close
	public static void close(PreparedStatement stmt) {
		try {
			if(stmt!=null) {stmt.close();}
		} catch(Exception e) {
			System.out.println("PreparedStatement close");
		}
	}
	//resultset close
	public static void close(ResultSet rs) {
		try {
			if(rs!=null) {rs.close();}
		} catch(Exception e) {
			System.out.println("Connection close");
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
