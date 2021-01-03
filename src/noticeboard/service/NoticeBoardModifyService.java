package noticeboard.service;

import java.sql.Connection;

import java.sql.SQLException;

import freeboard.model.FreeBoard;
import jdbc.ConnectionProvider;
import noticeboard.dao.NoticeBoardDao;

public class NoticeBoardModifyService {
	private NoticeBoardDao boardDao = new NoticeBoardDao();
	
	public void postUpdate(FreeBoard fb) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			boardDao.postUpdate(conn, fb);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
