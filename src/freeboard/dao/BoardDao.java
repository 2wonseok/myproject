package freeboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import freeboard.model.FreeBoard;
import jdbc.JdbcUtil;

public class BoardDao {

	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM freeboard";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				return rs.getInt(1);
			}
			
			return 0;
		} finally {
			JdbcUtil.close(rs, stmt);
		}
	}

	public List<FreeBoard> select(Connection conn, int pageNo, int size) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY regdate DESC) rn, notice, post_no, memberid, name, title, "
				+"body, regdate, read_cnt, like_cnt, moddate, "
				+"(SELECT COUNT(*) FROM boardreply A WHERE A.post_no = B.post_no) as replycnt "
				+ "FROM freeboard B ORDER BY notice ASC, rn ASC) "
				+"WHERE rn BETWEEN ? AND ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (pageNo-1) * size + 1);
			pstmt.setInt(2, pageNo * size);
			rs = pstmt.executeQuery();
			
			List<FreeBoard> boardContents = new ArrayList<>();
			while (rs.next()) {
				FreeBoard content = new FreeBoard();
				content.setPost_no(rs.getInt("post_no"));
				content.setMemberid(rs.getString("memberid"));
				content.setName(rs.getString("name"));
				content.setTitle(rs.getString("title"));
				content.setBody(rs.getString("body"));
				content.setRegDate(rs.getDate("regdate"));
				content.setModDate(rs.getDate("moddate"));
				content.setReadCnt(rs.getInt("read_cnt"));
				content.setLikeCnt(rs.getInt("like_cnt"));
				content.setNotice(rs.getInt("notice"));
				content.setReplyCnt(rs.getInt("replycnt"));
				
				boardContents.add(content);
			}
			
			return boardContents;
			
		} finally {
			JdbcUtil.close(rs, pstmt);
		}
	}

	public void write(Connection conn, FreeBoard fb) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int notice = fb.getNotice();
		String sql = "";
		
		if (notice == 1) {
			sql = "INSERT INTO freeboard "
					+"(memberid, name, title, body, regdate, moddate, read_cnt, like_cnt, notice) "
					+"VALUES (?, ?, ?, ?, SYSDATE, SYSDATE, 0, 0, 1) ";
		} else {
			sql = "INSERT INTO freeboard "
					+"(memberid, name, title, body, regdate, moddate, read_cnt, like_cnt, notice) "
					+"VALUES (?, ?, ?, ?, SYSDATE, SYSDATE, 0, 0, 0) ";
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fb.getMemberid());
			pstmt.setString(2, fb.getName());
			pstmt.setString(3, fb.getTitle());
			pstmt.setString(4, fb.getBody());
			
			rs = pstmt.executeQuery();

		} finally {
			JdbcUtil.close(rs, pstmt);
		}
		
	}

	public FreeBoard freeBoardPost(Connection conn, int post_no) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		FreeBoard fb = null;
		
		String sql = "SELECT post_no, memberid, name, title, body, regdate, moddate, read_cnt, like_cnt, notice FROM freeboard WHERE post_no = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, post_no);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				fb = new FreeBoard();
				fb.setPost_no(rs.getInt(1));
				fb.setMemberid(rs.getString(2));
				fb.setName(rs.getString(3));
				fb.setTitle(rs.getString(4));
				fb.setBody(rs.getString(5));
				fb.setRegDate(rs.getDate(6));
				fb.setModDate(rs.getDate(7));
				fb.setReadCnt(rs.getInt(8));
				fb.setLikeCnt(rs.getInt(9));
				fb.setNotice(rs.getInt(10));
				
			}
			return fb;
			
		} finally {
			JdbcUtil.close(rs, pstmt);
		}
		
	}

	public void postUpdate(Connection conn, FreeBoard fb) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		if (fb.getNotice() == 0) {
			sql = "UPDATE freeboard SET title = ?, body = ?, moddate = SYSDATE, notice = 0 WHERE post_no = ?";
		} else {
			sql = "UPDATE freeboard SET title = ?, body = ?, moddate = SYSDATE, notice = 1 WHERE post_no = ?";
		}
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fb.getTitle());
			pstmt.setString(2, fb.getBody());
			pstmt.setInt(3, fb.getPost_no());
			
			rs = pstmt.executeQuery();
			
		} finally {
			JdbcUtil.close(rs, pstmt);
		}
		
	}

	public void postDelete(Connection conn, int post_no) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "DELETE FROM freeboard WHERE post_no ="+post_no;
		
		try {
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
		} finally {
			JdbcUtil.close(rs, stmt);
		}
	}

	public int selectContentCount(Connection conn, String searchKeyword, String searchField) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM freeboard WHERE UPPER ("+searchKeyword+") LIKE UPPER ('%"+searchField+"%')";
		
		try {
			stmt = conn.createStatement();

			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				return rs.getInt(1);
			}
			
			return 0;
		} finally {
			JdbcUtil.close(rs, stmt);
		}
	}

	public List<FreeBoard> searchContent(Connection conn, String searchKeyword, String searchField, int pageNo, int size,
			int total) throws SQLException {

		Statement stmt = null;
		ResultSet rs = null;
		FreeBoard fb = null;
		
		int startPage = (pageNo-1) * size + 1;
		int endPage = pageNo * size;
		String sql = "";
		
		if (total > 10) {
			sql = "SELECT post_no, memberid, name, title, body, regdate, moddate, read_cnt, like_cnt, notice, replycnt "
				+"FROM (SELECT ROW_NUMBER() OVER (ORDER BY regdate DESC) "
				+"rn, post_no, memberid, name, title, body, regdate, moddate, read_cnt, like_cnt, notice, "
				+"(SELECT COUNT(*) FROM boardreply A WHERE A.post_no = B.post_no) as replycnt "
				+"FROM freeboard B ORDER BY notice ASC, rn ASC) "
				+"WHERE UPPER ("+searchKeyword+") LIKE UPPER ('%"+searchField+"%') AND rn BETWEEN "+startPage+" AND "+endPage;
			
		} else {
			sql = "SELECT post_no, memberid, name, title, body, regdate, moddate, read_cnt, like_cnt, notice, replycnt "
					+"FROM (SELECT ROW_NUMBER() OVER (ORDER BY regdate DESC) "
					+"rn, post_no, memberid, name, title, body, regdate, moddate, read_cnt, like_cnt, notice, "
					+"(SELECT COUNT(*) FROM boardreply A WHERE A.post_no = B.post_no) as replycnt "
					+"FROM freeboard B ORDER BY notice ASC, rn ASC) "
					+"WHERE UPPER ("+searchKeyword+") LIKE UPPER ('%"+searchField+"%')";
		}
		
		List<FreeBoard> freeBoard = new ArrayList<FreeBoard>();
		
		try {
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				fb = new FreeBoard();
				fb.setPost_no(rs.getInt(1));
				fb.setMemberid(rs.getString(2));
				fb.setName(rs.getString(3));
				fb.setTitle(rs.getString(4));
				fb.setBody(rs.getString(5));
				fb.setRegDate(rs.getDate(6));
				fb.setModDate(rs.getDate(7));
				fb.setReadCnt(rs.getInt(8));
				fb.setLikeCnt(rs.getInt(9));
				fb.setNotice(rs.getInt(10));
				fb.setReplyCnt(rs.getInt(11));
				freeBoard.add(fb);
			}
			return freeBoard;
		} finally {
			JdbcUtil.close(rs, stmt);
		}
	}

	public void readCountUpdate(Connection conn, int post_no) throws SQLException {
		String sql = "UPDATE freeboard SET read_cnt = read_cnt + 1 WHERE post_no = ? ";
		
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, post_no);
			pstmt.executeUpdate();
		}
	}

	public void likeCountUpdate(Connection conn, int post_no) throws SQLException {
		String sql = "UPDATE freeboard SET like_cnt = like_cnt + 1 WHERE post_no = ? ";
		
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, post_no);
			pstmt.executeUpdate();
		}
	}

	public List<FreeBoard> getMainPage(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT title, regdate, post_no FROM freeboard WHERE ROWNUM <= 8 AND notice=0  ORDER BY regdate DESC";

		try {
			stmt = conn.createStatement();

			rs = stmt.executeQuery(sql);
			
			List<FreeBoard> mainList = new ArrayList<>();
			while (rs.next()) {
				FreeBoard main = new FreeBoard();
				main.setTitle(rs.getString(1));
				main.setRegDate(rs.getDate(2));
				main.setPost_no(rs.getInt(3));
				
				mainList.add(main);
			}
			
			return mainList;
			
		} finally {
			JdbcUtil.close(rs, stmt);
		}
	}

	public List<FreeBoard> getSubPage(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT title, regdate, post_no FROM freeboard WHERE ROWNUM <= 8 AND notice=1  ORDER BY regdate DESC";

		try {
			stmt = conn.createStatement();

			rs = stmt.executeQuery(sql);
			
			List<FreeBoard> mainList = new ArrayList<>();
			while (rs.next()) {
				FreeBoard main = new FreeBoard();
				main.setTitle(rs.getString(1));
				main.setRegDate(rs.getDate(2));
				main.setPost_no(rs.getInt(3));
				
				mainList.add(main);
			}
			
			return mainList;
			
		} finally {
			JdbcUtil.close(rs, stmt);
		}
	}

}
