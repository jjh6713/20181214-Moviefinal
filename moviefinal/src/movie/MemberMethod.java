package movie;
 
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import movie.MovieMember;
 
public class MemberMethod
{
    // 유저 삽입
    public static void insertMember(MovieMember bean) {
        
        Connection conn = null;
        PreparedStatement stmt = null;
 
        try {
        	String sql = "INSERT INTO MOVIE_MEMBER VALUES(?,?,?,?,?)";
            conn = ConnectionDb.getConnection();
            stmt = conn.prepareStatement(sql);
            
            stmt.setString(1, bean.getMember_id());
            stmt.setString(2, bean.getMember_pw());
            stmt.setString(3, bean.getMember_name());
            stmt.setString(4, bean.getMember_tel());
            stmt.setString(5, "2"); // 2 일반 유저 1 어드민
            
            stmt.executeUpdate();
 
        } catch (Exception sqle) {
        	System.out.println("insert fail");
        } finally {
            ConnectionDb.close(stmt);
            ConnectionDb.close(conn);
        }
    }
    
    // 로그인 체크
    public static int loginCheck(String id, String pw) 
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
 
        String dbPW = ""; // db�뿉�꽌 爰쇰궦 鍮꾨�踰덊샇瑜� �떞�쓣 蹂��닔
        int ck = 0;
 
        try {
            String sql = "SELECT member_pw FROM movie_member WHERE member_id=?";

            conn = ConnectionDb.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, id);
            rs = stmt.executeQuery();
 
            if (rs.next())
            {
                dbPW = rs.getString("member_pw");
                if (dbPW.equals(pw)) ck = 1; //媛숈쑝硫� �씤利앹꽦怨�
                else ck = 0; //�떎瑜대㈃ �씤利앹떎�뙣
            } else {
                ck = -1; //�빐�떦 �븘�씠�뵒媛� �뾾�쓣 寃쎌슦
            }
            System.out.println("ck ok!!");
            return ck;
            
        } catch (Exception sqle) {
            System.out.println("ck fail!!");
        } finally {
            ConnectionDb.close(rs);
            ConnectionDb.close(stmt);
            ConnectionDb.close(conn);
        }
		return ck;
    }
    
    // 중복 검사
    public static boolean overlapCheck(String id) {
    	Connection conn = null;
    	PreparedStatement stmt = null;
		ResultSet rs = null;
    	
    	try {
        	conn = ConnectionDb.getConnection();
        	String sql = "SELECT member_id FROM movie_member";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				if(rs.getString("member_id").equals(id)) {//留뚯빟 媛숈� 以묐났�릺�뒗 �븘�씠�뵒媛��엳�떎硫�!!
					System.out.println("overlapCheck ok overlap!!");
					return false;
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("overlapCheck fail!!");
		}
		System.out.println("overlapCheck no overlap!!");
    	return true;
    }
    
	// 유저 삭제
	public static void DeleteMember(String key) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {			
			String sql = "DELETE FROM movie_member WHERE member_id=?";
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
	
	// 유저 검색
	@SuppressWarnings("null")
	public static MovieMember SearchMember(String key) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		MovieMember temp = new MovieMember();
		
		String member_id = "";
		String member_pw = "";
		String member_name = "";
		String member_tel = "";
		String member_lv = "";
		
		try {			
			String sql = "SELECT * FROM movie_member WHERE member_id=?";
			conn = ConnectionDb.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, key);
			
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			
			member_id = rs.getString(1);
			member_pw = rs.getString(2);
			member_name = rs.getString(3);
			member_tel = rs.getString(4);
			member_lv = rs.getString(5);
			
			temp.setMember_id(member_id);
			temp.setMember_pw(member_pw);
			temp.setMember_name(member_name);
			temp.setMember_tel(member_tel);
			temp.setMember_lv(member_lv);

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
	
	//유저 수정
	public static void UpdateMember(HttpServletRequest request) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {			
			String sql = "UPDATE movie_member SET member_id=?,member_pw=?,member_name=?,member_tel=? WHERE member_id=?";
			conn = ConnectionDb.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, request.getParameter("member_id"));
			pstmt.setString(2, request.getParameter("member_pw"));
			pstmt.setString(3, request.getParameter("member_name"));
			pstmt.setString(4, request.getParameter("member_tel"));
			pstmt.setString(5, request.getParameter("member_id"));
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
        	System.out.println("Update fail");
		} finally {
            ConnectionDb.close(pstmt);
            ConnectionDb.close(conn);
        }
		
	}
}
