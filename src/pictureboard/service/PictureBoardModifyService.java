package pictureboard.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import pictureboard.dao.PictureBoardDao;
import pictureboard.model.PictureBoard;

public class PictureBoardModifyService {
	private PictureBoardDao boardDao = new PictureBoardDao();
	public void postUpdate(PictureBoard pb) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			boardDao.postUpdate(conn, pb);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
