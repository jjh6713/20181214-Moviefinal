package movie;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ItemMethod {
	
	//영화 삽입
	public static void InsertItem(HttpServletRequest request) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {			
			String sql = "INSERT INTO movie_item VALUES(?,?,?,?,?,?,?)";
			conn = ConnectionDb.getConnection();
			pstmt = conn.prepareStatement(sql);

			String uploadPath = "D:\\workspace\\moviefinal\\WebContent\\MovieReview\\img"; //파일 경로
			int maxSize = 1024 * 1024 * 10; // 한번에 올릴 수 있는 파일 용량 : 10M로 제한
			MultipartRequest multi = new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
			
			pstmt.setString(1, multi.getParameter("item_name"));
			pstmt.setString(2, multi.getParameter("item_director"));
			pstmt.setString(3, multi.getParameter("item_actor"));
			pstmt.setString(4, multi.getParameter("item_info"));
			pstmt.setString(5, multi.getParameter("item_date"));
	        pstmt.setString(6, multi.getParameter("item_link").split("=")[1]);
			pstmt.setString(7, multi.getFilesystemName("item_image"));
			
			pstmt.executeUpdate();
		} catch (SQLException | IOException e) {
        	System.out.println("insert fail");
		} finally {
            ConnectionDb.close(pstmt);
            ConnectionDb.close(conn);
        }
		
	}

	//영화 삭제
	public static void DeleteItem(String key) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {			
			String sql = "DELETE FROM movie_item WHERE item_name=?";
			conn = ConnectionDb.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, key);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
        	System.out.println("delete fail");
		} finally {
            ConnectionDb.close(pstmt);
            ConnectionDb.close(conn);
        }
	}
	
	//영화 검색
	@SuppressWarnings("null")
	public static MovieItem SearchItem(String key) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		MovieItem temp = new MovieItem();
		
		String item_name = "";
		String item_director ="";
		String item_actor="";
		String item_info = "";
		String item_date = "";
		String item_link = "";
		String item_image = "";
		
		try {			
			String sql = "SELECT * FROM movie_item WHERE item_name=?";
			conn = ConnectionDb.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, key);
			
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			
			item_name = rs.getString(1);
			item_director = rs.getString(2);
			item_actor = rs.getString(3);
			item_info = rs.getString(4);
			item_date = rs.getString(5);
			item_link = rs.getString(6);
			item_image = rs.getString(7);
			
			
			temp.setItem_name(item_name);
			temp.setItem_director(item_director);
			temp.setItem_actor(item_actor);
			temp.setItem_info(item_info);
			temp.setItem_date(item_date);
			temp.setItem_link(item_link);
			temp.setItem_image(item_image);

			return temp;
		} catch (SQLException e) {
        	System.out.println("search fail");
        	System.out.println(e.getMessage());
        	return temp;
		} finally {
            ConnectionDb.close(pstmt);
            ConnectionDb.close(conn);
        }
	}
	
	//영화 수정
	public static void UpdateItem(HttpServletRequest request) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {			
			String sql = "UPDATE movie_item SET item_name=?,item_director=?,item_actor=?,item_info=?,item_date=?,item_link=?,item_image=? WHERE item_name=?";
			conn = ConnectionDb.getConnection();
			pstmt = conn.prepareStatement(sql);

			String uploadPath = "D:\\workspace\\moviefinal\\WebContent\\MovieReview\\img"; //�뙆�씪 寃쎈줈
			int maxSize = 1024 * 1024 * 10; // �븳踰덉뿉 �삱由� �닔 �엳�뒗 �뙆�씪 �슜�웾 : 10M濡� �젣�븳
			MultipartRequest multi = new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());

			pstmt.setString(1, multi.getParameter("item_name"));
			pstmt.setString(2, multi.getParameter("item_director"));
			pstmt.setString(3, multi.getParameter("item_actor"));
			pstmt.setString(4, multi.getParameter("item_info"));
			pstmt.setString(5, multi.getParameter("item_date"));
			pstmt.setString(6, multi.getParameter("item_link").split("=")[1]);
			pstmt.setString(7, multi.getFilesystemName("item_image"));
			pstmt.setString(8, multi.getParameter("item_name"));
			
			pstmt.executeUpdate();
		} catch (SQLException | IOException e) {
        	System.out.println("Update fail");
		} finally {
            ConnectionDb.close(pstmt);
            ConnectionDb.close(conn);
        }
		
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
}
