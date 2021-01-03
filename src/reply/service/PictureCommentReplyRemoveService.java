package reply.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import reply.dao.ReplyDao;

public class PictureCommentReplyRemoveService {
	private ReplyDao dao = new ReplyDao();

	public void remove(int replyid) {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			dao.pictureCommentDelete(conn, replyid);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(conn);
		}
	}

	public void postCommentReplyremove(int post_no) {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			dao.postCommentReplyRemove(conn, post_no);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(conn);
		}
	}

}
