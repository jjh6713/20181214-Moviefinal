package movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardMethod {

	//contentSub1,2 게시물 표출
	public static ArrayList<MovieItem> ItemCreate() {
		MovieItem temp = new MovieItem();
		ArrayList<MovieItem> item = new ArrayList<MovieItem>();

		String item_name = "";
		String item_director ="";
		String item_actor="";
		String item_info = "";
		String item_date = "";
		String item_link = "";
		String item_image = "";
		
		try {
			Connection conn = ConnectionDb.getConnection();
			String sql = "SELECT COUNT(*) FROM movie_item";
			PreparedStatement pstmt;
			pstmt = conn.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			int noCheck = 0; // ��ü �� ����
			
			if(rs.next()){
				noCheck = rs.getInt(1); // ��ü �� ���� ����
			}

			sql = "SELECT * FROM movie_item ORDER BY item_name ASC";
			rs = pstmt.executeQuery(sql);

			if(noCheck==0){
				return item;
			}else{
				while(rs.next()){
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
					item.add(temp);
					temp = new MovieItem();
				}
			}
				ConnectionDb.close(rs);
				ConnectionDb.close(pstmt);
				ConnectionDb.close(conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return item;
	}
	
	
	//contentSub3 게시물 표출
	public static ArrayList<MovieBoard> BoardCreate(int st,int ed) {
		MovieBoard temp = new MovieBoard();
		ArrayList<MovieBoard> board = new ArrayList<MovieBoard>();
		String no = "";
		String rating = "";
		String review = "NO REVIEW.";
		String date = "";
		
		try {
			Connection conn = ConnectionDb.getConnection();
			String sql = "SELECT COUNT(*) FROM movie_board";
			String id, item;
			PreparedStatement pstmt;
			pstmt = conn.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			int noCheck = 0; // ��ü �� ����
			
			if(rs.next()){
				noCheck = rs.getInt(1); // ��ü �� ���� ����
			}
			
			sql = "SELECT * FROM movie_board ORDER BY board_no ASC";
			rs = pstmt.executeQuery(sql);

			if(noCheck==0){
				return board;
			}else{
				while(rs.next()){
					no = rs.getString(1);
					rating = rs.getString(2);
					review = rs.getString(3);
					date = rs.getString(4);
					id = rs.getString(5);
					item = rs.getString(6);

					if(Integer.parseInt(no)>=st&&Integer.parseInt(no)<=ed) {
						temp.setBoard_no(no);
						temp.setBoard_rating(rating);
						temp.setBoard_review(review);
						temp.setBoard_date(date);
						temp.setMember_id(id);
						temp.setItem_name(item);
						board.add(temp);
						temp = new MovieBoard();
					}
				}
			}
				ConnectionDb.close(rs);
				ConnectionDb.close(pstmt);
				ConnectionDb.close(conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return board;
	}
	
	//contentSub3 게시물 삽입
	public static Boolean BoardInsert(String board_comment, String board_rating, String id, String item) {
		Boolean ck=true;
		try {
			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
			String board_today = formatter.format(new java.util.Date());
			//현재날짜
			String board_no = "";
			//개시물 넘버
			Connection conn = ConnectionDb.getConnection();	
			
			String sql = "SELECT COUNT(*) FROM movie_board";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) { board_no = rs.getString(1); }

			sql = "INSERT INTO movie_board VALUES(?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, board_no);
			pstmt.setString(2, board_rating);
			pstmt.setString(3, board_comment);
			pstmt.setString(4, board_today);
			pstmt.setString(5, id);
			pstmt.setString(6, item);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			ck = false;
			return ck;
		}
		return ck;
	}
	

	//contentSub3 게시물 삭제
	public static void DeleteBoard(String key) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {			
			String sql = "DELETE FROM movie_board WHERE board_no=?";
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
	
	//contentSub4 게시물 표출
	public static ArrayList<MovieItem> ItemCreate(int st, int ed) {
		MovieItem temp = new MovieItem();
		ArrayList<MovieItem> item = new ArrayList<MovieItem>();

		String item_name = "";
		String item_director ="";
		String item_actor="";
		String item_info = "";
		String item_date = "";
		String item_link = "";
		String item_image = "";
		
		try {
			Connection conn = ConnectionDb.getConnection();
			String sql = "SELECT COUNT(*) FROM movie_item";
			PreparedStatement pstmt;
			pstmt = conn.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			int noCheck = 0; // ��ü �� ����
			int count = 0;
			
			if(rs.next()){
				noCheck = rs.getInt(1); // ��ü �� ���� ����
			}

			sql = "SELECT * FROM movie_item ORDER BY item_name ASC";
			rs = pstmt.executeQuery(sql);

			if(noCheck==0){
				return item;
			}else{

				while(rs.next()){
					item_name = rs.getString(1);
					item_director = rs.getString(2);
					item_actor = rs.getString(3);
					item_info = rs.getString(4);
					item_date = rs.getString(5);
					item_link = rs.getString(6);
					item_image = rs.getString(7);
					//갱신
					if(count>=st&&count<=ed) {
						temp.setItem_name(item_name);
						temp.setItem_director(item_director);
						temp.setItem_actor(item_actor);
						temp.setItem_info(item_info);
						temp.setItem_date(item_date);
						temp.setItem_link(item_link);
						temp.setItem_image(item_image);
						item.add(temp);
						temp = new MovieItem();
					}
					count++;	
				}
			}
				ConnectionDb.close(rs);
				ConnectionDb.close(pstmt);
				ConnectionDb.close(conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return item;
	}
	

	
	//contentSub5 게시물 표출
	public static ArrayList<MovieMember> MemberCreate(int st, int ed) {
		MovieMember temp = new MovieMember();
		ArrayList<MovieMember> member = new ArrayList<MovieMember>();

		String member_id;
		String member_pw;
		String member_name;
		String member_tel;
		
		try {
			Connection conn = ConnectionDb.getConnection();
			String sql = "SELECT COUNT(*) FROM movie_member";
			PreparedStatement pstmt;
			pstmt = conn.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			int noCheck = 0; // ��ü �� ����
			int count = 0;
			
			if(rs.next()){
				noCheck = rs.getInt(1); // ��ü �� ���� ����
			}

			sql = "SELECT * FROM movie_member ORDER BY member_id ASC";
			rs = pstmt.executeQuery(sql);

			if(noCheck==0){
				return member;
			}else{

				while(rs.next()){
					member_id = rs.getString(1);
					member_pw = rs.getString(2);
					member_name = rs.getString(3);
					member_tel = rs.getString(4);
					
					//갱신
					if(count>=st&&count<=ed) {
						temp.setMember_id(member_id);
						temp.setMember_pw(member_pw);
						temp.setMember_name(member_name);
						temp.setMember_tel(member_tel);
						member.add(temp);
						temp = new MovieMember();
					}
					count++;	
				}
			}
				ConnectionDb.close(rs);
				ConnectionDb.close(pstmt);
				ConnectionDb.close(conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return member;
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	
}
