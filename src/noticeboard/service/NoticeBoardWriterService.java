package noticeboard.service;

import java.sql.Connection;

import java.sql.SQLException;

import freeboard.model.FreeBoard;
import jdbc.ConnectionProvider;
import noticeboard.dao.NoticeBoardDao;

public class NoticeBoardWriterService {
	private NoticeBoardDao boardDao = new NoticeBoardDao();
	
	public void insert(FreeBoard fb) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			
			boardDao.write(conn, fb);
			
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
