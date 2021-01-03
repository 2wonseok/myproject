package pictureboard.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import pictureboard.dao.PictureBoardDao;

public class PictureBoardRemoveService {
	private PictureBoardDao boardDao = new PictureBoardDao(); 
	
	public void postDelete(int post_no) {
		try(Connection conn = ConnectionProvider.getConnection()) {
			boardDao.postDelete(conn, post_no);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
