package reply.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import freeboard.model.FreeBoard;
import jdbc.JdbcUtil;
import reply.model.Reply;

public class ReplyDao {

	public void insert(Connection conn, String userId, int post_no, String body) throws SQLException {
		String sql = "INSERT INTO boardreply "
				+"(memberid, post_no, body, regdate) "
				+"VALUES (?, ?, ?, SYSDATE) ";

		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
		pstmt.setString(1, userId);
		pstmt.setInt(2, post_no);
		pstmt.setString(3, body);
		
		pstmt.executeUpdate();
		}
		
	}

	public List<Reply> listReply(Connection conn, int post_no) throws SQLException {
		String sql = "SELECT replyid, memberid, post_no, body, regdate "
				+"FROM boardreply " 
				+"WHERE post_no=? " 
				+"ORDER BY replyid DESC";

		List<Reply> list = new ArrayList<>();
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
		pstmt.setInt(1, post_no);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Reply r = new Reply();
			r.setId(rs.getInt(1));
			r.setMemberId(rs.getString(2));
			r.setPost_no(rs.getInt(3));
			r.setBody(rs.getString(4));
			r.setRegDate(rs.getTimestamp(5));
			
			list.add(r);
			}
		}
		return list;
	}

	public void delete(Connection conn, int replyid) throws SQLException {
		String sql = "DELETE FROM boardreply WHERE replyid = ? ";
		
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, replyid);
			
			pstmt.executeUpdate();
		} 
	}

	public void pictureReplyInsert(Connection conn, String userId, int post_no, String body) throws SQLException {
		String sql = "INSERT INTO pictureboardreply "
				+"(memberid, post_no, body, regdate) "
				+"VALUES (?, ?, ?, SYSDATE) ";

		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
		pstmt.setString(1, userId);
		pstmt.setInt(2, post_no);
		pstmt.setString(3, body);
		
		pstmt.executeUpdate();
		}
	}

	public List<Reply> pictureListReply(Connection conn, int post_no) throws SQLException {
		String sql = "SELECT replyid, memberid, post_no, body, regdate "
				+"FROM pictureboardreply " 
				+"WHERE post_no=? " 
				+"ORDER BY replyid DESC";

		List<Reply> list = new ArrayList<>();
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
		pstmt.setInt(1, post_no);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Reply r = new Reply();
			r.setId(rs.getInt(1));
			r.setMemberId(rs.getString(2));
			r.setPost_no(rs.getInt(3));
			r.setBody(rs.getString(4));
			r.setRegDate(rs.getTimestamp(5));
			
			list.add(r);
			}
		}
		return list;
	}

	public void pictureReplyDelete(Connection conn, int replyid) throws SQLException {
		String sql = "DELETE FROM pictureboardreply WHERE replyid = ? ";
		
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, replyid);
			
			pstmt.executeUpdate();
		}
	}

	public void commentReplyInsert(Connection conn, String replyid,  String userId, String body, int post_no) throws SQLException {
		String sql = "INSERT INTO boardcommentreply "
				+"(replyid, memberid, body, post_no, regdate) "
				+"VALUES (?, ?, ?, ?, SYSDATE) ";

		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, replyid);
			pstmt.setString(2, userId);
			pstmt.setString(3, body);
			pstmt.setInt(4, post_no);
			
			pstmt.executeUpdate();
		}
	}

	public List<Reply> getCommentReply(Connection conn, int post_no) throws SQLException {
		String sql = "SELECT cmtreplyid, replyid, memberid, body, regdate, post_no "
				+"FROM boardcommentreply WHERE post_no="+post_no+" ORDER BY regdate DESC"; 

		List<Reply> list = new ArrayList<>();
		try (Statement stmt = conn.createStatement()) {
		
			ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next()) {
			Reply r = new Reply();
			r.setCommentReplyId(rs.getInt(1));
			r.setId(rs.getInt(2));
			r.setMemberId(rs.getString(3));
			r.setBody(rs.getString(4));
			r.setRegDate(rs.getTimestamp(5));
			r.setPost_no(rs.getInt(6));
			
			list.add(r);
			}
		}
		return list;
	}

	public void commentDelete(Connection conn, int replyid) throws SQLException {
		String sql = "DELETE FROM boardcommentreply WHERE cmtreplyid = ? ";
		
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, replyid);
			
			pstmt.executeUpdate();
		} 
	}

	public void pictureCommentReplyInsert(Connection conn, String replyid, String userId, String body, int post_no) throws SQLException {
		String sql = "INSERT INTO pictureboardcommentreply "
				+"(replyid, memberid, body, post_no, regdate) "
				+"VALUES (?, ?, ?, ?, SYSDATE) ";

		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, replyid);
			pstmt.setString(2, userId);
			pstmt.setString(3, body);
			pstmt.setInt(4, post_no);
			
			pstmt.executeUpdate();
		}
	}

	public void pictureCommentDelete(Connection conn, int replyid) throws SQLException {
		String sql = "DELETE FROM pictureboardcommentreply WHERE cmtreplyid = ? ";
		
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, replyid);
			
			pstmt.executeUpdate();
		} 
	}

	public List<Reply> getPictureCommentReply(Connection conn, int post_no) throws SQLException {
		String sql = "SELECT cmtreplyid, replyid, memberid, body, regdate, post_no "
				+"FROM pictureboardcommentreply WHERE post_no="+post_no+" ORDER BY regdate DESC"; 

		List<Reply> list = new ArrayList<>();
		try (Statement stmt = conn.createStatement()) {
		
			ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next()) {
			Reply r = new Reply();
			r.setCommentReplyId(rs.getInt(1));
			r.setId(rs.getInt(2));
			r.setMemberId(rs.getString(3));
			r.setBody(rs.getString(4));
			r.setRegDate(rs.getTimestamp(5));
			r.setPost_no(rs.getInt(6));
			
			list.add(r);
			}
		}
		return list;
	}

	public void postRemove(Connection conn, int post_no) throws SQLException {
		String sql = "DELETE FROM boardreply WHERE post_no = ? ";
		
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, post_no);
			
			pstmt.executeUpdate();
		} 
	}

	public void postCommentDelete(Connection conn, int post_no) throws SQLException {
		String sql = "DELETE FROM boardcommentreply WHERE post_no = ? ";
		
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, post_no);
			
			pstmt.executeUpdate();
		} 
	}

	public void picturePostReplyDelete(Connection conn, int post_no) throws SQLException {
		String sql = "DELETE FROM pictureboardreply WHERE post_no = ? ";
		
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, post_no);
			
			pstmt.executeUpdate();
		}
	}

	public void postCommentReplyRemove(Connection conn, int post_no) throws SQLException {
		String sql = "DELETE FROM pictureboardcommentreply WHERE post_no = ? ";
		
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, post_no);
			
			pstmt.executeUpdate();
		} 
	}

}
	
