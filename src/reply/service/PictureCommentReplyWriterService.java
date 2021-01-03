package reply.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import reply.dao.ReplyDao;

public class PictureCommentReplyWriterService {
	private ReplyDao dao = new ReplyDao();

	public void add(String replyid, String userId, String body, int post_no) throws SQLException {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			dao.pictureCommentReplyInsert(conn, replyid, userId, body, post_no);
		} finally {
			JdbcUtil.close(conn);
		}
	}

}
