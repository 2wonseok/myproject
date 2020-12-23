package freeboard.service;

import java.sql.Connection;
import java.sql.SQLException;

import freeboard.dao.BoardDao;
import freeboard.model.FreeBoard;
import jdbc.ConnectionProvider;

public class FreeBoardModifyService {
	private BoardDao boardDao = new BoardDao();
	
	public void postUpdate(FreeBoard fb) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			boardDao.postUpdate(conn, fb);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
