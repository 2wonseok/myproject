package freeboard.service;

import java.sql.Connection;
import java.sql.SQLException;

import freeboard.dao.BoardDao;
import jdbc.ConnectionProvider;

public class FreeBoardRemoveService {
	private BoardDao boardDao = new BoardDao();
	
	public void postDelete(int post_no) {
		// TODO Auto-generated method stub
		try (Connection conn = ConnectionProvider.getConnection()) {
			boardDao.postDelete(conn, post_no);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
