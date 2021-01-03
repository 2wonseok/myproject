package reply.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import reply.dao.ReplyDao;

public class ReplyWriterService {
	private ReplyDao dao = new ReplyDao();
	
	public void add(String userId, int post_no, String body) throws SQLException {
		Connection conn = null;
		
		try {
			
			conn = ConnectionProvider.getConnection();
			dao.insert(conn, userId, post_no, body);
		
		} finally {
			JdbcUtil.close(conn);
		}
	}

}
