package reply.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import reply.dao.ReplyDao;

public class CommentReplyWriterService {
	private ReplyDao dao = new ReplyDao();
	
	public void add(String replyid, String userId, String body, int post_no) {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			dao.commentReplyInsert(conn, replyid, userId, body, post_no);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}
	}

}
