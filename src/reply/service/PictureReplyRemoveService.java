package reply.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import reply.dao.ReplyDao;

public class PictureReplyRemoveService {
	private ReplyDao dao = new ReplyDao();
	
	public void remove(int replyid) {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			dao.pictureReplyDelete(conn, replyid);
		
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(conn);
		}
	}

	public void postReplyRemove(int post_no) {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			dao.picturePostReplyDelete(conn, post_no);
		
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(conn);
		}
	}

}
