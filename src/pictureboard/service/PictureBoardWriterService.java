package pictureboard.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import pictureboard.dao.PictureBoardDao;
import pictureboard.model.PictureBoard;

public class PictureBoardWriterService {
	private PictureBoardDao pictureDao = new PictureBoardDao();
	
	public void insert(PictureBoard pb) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			
			pictureDao.insert(conn, pb);
			
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}

}
