package movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Paging {
	final int ROWSIZE = 6; // 한 페이지 게시물 수
	final int BLOCK = 5; // 페이지 블럭
	int start, end, startBlock, endBlock; //해당 페이지 시작 , 끝 , 시작블럭, 끝블럭
	int allPage = 0; //전체 페이지
	
	public int getStart() {
		return start;
	}

	public void setStart(int pg) {
		this.start = (pg*ROWSIZE) - (ROWSIZE);
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int pg) {
		this.end = (pg*ROWSIZE)-1;
	}

	public int getStartBlock() {
		return startBlock;
	}

	public void setStartBlock(int pg) {
		this.startBlock = ((pg-1)/BLOCK*BLOCK)+1;;
	}

	public int getEndBlock() {
		return endBlock;
	}

	public void setEndBlock(int pg) {
		this.endBlock = ((pg-1)/BLOCK*BLOCK)+BLOCK;;
	}

	public void MoreBlock() {
		this.endBlock = this.allPage;
	}
	public int getAllPage() {
		return allPage;
	}

	public void setAllPage(int total) {
		this.allPage = (int)Math.ceil(total/(double)ROWSIZE);
	}

	public int getROWSIZE() {
		return ROWSIZE;
	}

	public int getBLOCK() {
		return BLOCK;
	}

	public ArrayList<Integer> count() {
		  	ArrayList<Integer> ct = new ArrayList<Integer>();
			int memberCount = 0; //member count
			int itemCount = 0; //item count
			int boardCount = 0; //board Count
			String sql;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				Connection conn = ConnectionDb.getConnection();
				
				sql = "SELECT COUNT(*) FROM movie_member";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()) {memberCount = rs.getInt(1);}
				ct.add(memberCount);//1
				

				sql = "SELECT COUNT(*) FROM movie_item";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()) {itemCount = rs.getInt(1);}
				ct.add(itemCount);//2
				

				sql = "SELECT COUNT(*) FROM movie_board";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()) {boardCount = rs.getInt(1);}
				ct.add(boardCount);//3


				ConnectionDb.close(rs);
				ConnectionDb.close(pstmt);
				ConnectionDb.close(conn);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("count fail");
				e.printStackTrace();
			}
			return ct;
	}
}

