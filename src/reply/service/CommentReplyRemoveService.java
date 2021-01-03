package reply.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import reply.dao.ReplyDao;

public class CommentReplyRemoveService {
	private ReplyDao dao = new ReplyDao();
	
	public void remove(int replyid) {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			dao.commentDelete(conn, replyid);
			
		
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(conn);
		}
	}

	public void postRemove(int post_no) {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			dao.postCommentDelete(conn, post_no);
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(conn);
		}
	}

}
