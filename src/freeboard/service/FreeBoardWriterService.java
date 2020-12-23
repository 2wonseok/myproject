package freeboard.service;

import java.sql.Connection;
import java.sql.SQLException;

import freeboard.dao.BoardDao;
import freeboard.model.FreeBoard;
import jdbc.ConnectionProvider;

public class FreeBoardWriterService {
	private BoardDao boardDao = new BoardDao();
	
	public void insert(FreeBoard fb) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			
			boardDao.write(conn, fb);
			
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
