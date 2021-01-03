package reply.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import freeboard.model.FreeBoard;
import jdbc.ConnectionProvider;
import reply.dao.ReplyDao;
import reply.model.Reply;

public class ReplyService {
	private ReplyDao dao = new ReplyDao();
	
	public List<Reply> getReplyList(int post_no) {
		Connection conn = ConnectionProvider.getConnection();
		List<Reply> list;
		
		try {
			list = dao.listReply(conn, post_no);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		return list;
	}

	public List<Reply> getPictureReplyList(int post_no) {
		Connection conn = ConnectionProvider.getConnection();
		List<Reply> list;
		
		try {
			list = dao.pictureListReply(conn, post_no);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		return list;
	}

	public List<Reply> getCommentReply(int post_no) {
		Connection conn = ConnectionProvider.getConnection();
		List<Reply> list;
		
		try {
			list = dao.getCommentReply(conn, post_no);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		return list;
	}
	
	public List<Reply> getPictureCommentReply(int post_no) {
		Connection conn = ConnectionProvider.getConnection();
		List<Reply> list;
		
		try {
			list = dao.getPictureCommentReply(conn, post_no);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		return list;
	}

}
