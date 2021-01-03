package pictureboard.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import jdbc.JdbcUtil;
import pictureboard.model.PictureBoard;

public class PictureBoardDao {

	public void insert(Connection conn, PictureBoard pb) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "INSERT INTO pictureboard (memberid, name, title, body, regdate, moddate, read_cnt, like_cnt, uploadfile) "
				+"VALUES (?, ?, ?, ?, SYSDATE, SYSDATE, 0, 0, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pb.getMemberid());
			pstmt.setString(2, pb.getName());
			pstmt.setString(3, pb.getTitle());
			pstmt.setString(4, pb.getBody());
			pstmt.setString(5, pb.getUploadFile());
			
			rs = pstmt.executeQuery();
			
		} finally {
			JdbcUtil.close(rs, pstmt);
		}
	}

	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM pictureboard";
		
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

	public List<PictureBoard> select(Connection conn, int pageNo, int size) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY regdate DESC) rn, uploadfile, post_no, memberid, name, title, "
				+"body, regdate, read_cnt, like_cnt, moddate FROM pictureboard) "
				+"WHERE rn BETWEEN ? AND ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (pageNo-1) * size + 1);
			pstmt.setInt(2, pageNo * size);
			
			rs = pstmt.executeQuery();
			
			List<PictureBoard> boardContents = new ArrayList<>();
			
			while (rs.next()) {
				PictureBoard pb = new PictureBoard();
				pb.setPost_no(rs.getInt("post_no"));
				pb.setMemberid(rs.getString("memberid"));
				pb.setName(rs.getString("name"));
				pb.setTitle(rs.getString("title"));
				pb.setBody(rs.getString("body"));
				pb.setRegDate(rs.getDate("regdate"));
				pb.setModDate(rs.getDate("moddate"));
				pb.setReadCnt(rs.getInt("read_cnt"));
				pb.setLikeCnt(rs.getInt("like_cnt"));
				pb.setUploadFile(rs.getString("uploadfile"));
				
				boardContents.add(pb);
			}
			return boardContents;
		} finally {
			JdbcUtil.close(rs, pstmt);
		}
		
	}

	public void likeCountUpdate(Connection conn, int post_no) throws SQLException {
		String sql = "UPDATE pictureboard SET like_cnt = like_cnt + 1 WHERE post_no = ? ";
		
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, post_no);
			pstmt.executeUpdate();
		}
	}

	public void readCountUpdate(Connection conn, int post_no) throws SQLException {
		String sql = "UPDATE pictureboard SET read_cnt = read_cnt + 1 WHERE post_no = ? ";
		
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, post_no);
			pstmt.executeUpdate();
		}
	}

	public PictureBoard pictureBoardPost(Connection conn, int post_no) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PictureBoard pb = null;
		
		String sql = "SELECT post_no, memberid, name, title, body, regdate, moddate, read_cnt, like_cnt, uploadfile FROM pictureboard WHERE post_no = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, post_no);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				pb = new PictureBoard();
				pb.setPost_no(rs.getInt(1));
				pb.setMemberid(rs.getString(2));
				pb.setName(rs.getString(3));
				pb.setTitle(rs.getString(4));
				pb.setBody(rs.getString(5));
				pb.setRegDate(rs.getDate(6));
				pb.setModDate(rs.getDate(7));
				pb.setReadCnt(rs.getInt(8));
				pb.setLikeCnt(rs.getInt(9));
				pb.setUploadFile(rs.getString(10));
				
			}
			return pb;
			
		} finally {
			JdbcUtil.close(rs, pstmt);
		}
	}

	public void postDelete(Connection conn, int post_no) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "DELETE FROM pictureboard WHERE post_no ="+post_no;
		
		try {
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
		} finally {
			JdbcUtil.close(rs, stmt);
		}
	}

	public void postUpdate(Connection conn, PictureBoard pb) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		if (pb.getUploadFile() == null) {
			sql = "UPDATE pictureboard SET title = ?, body = ?, moddate = SYSDATE WHERE post_no = ?";
		} else {
			sql = "UPDATE pictureboard SET title = ?, body = ?, moddate = SYSDATE, uploadfile = '"+pb.getUploadFile()+"' WHERE post_no = ?";
		}
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pb.getTitle());
			pstmt.setString(2, pb.getBody());
			pstmt.setInt(3, pb.getPost_no());
			
			rs = pstmt.executeQuery();
			
		} finally {
			JdbcUtil.close(rs, pstmt);
		}
	}

}
