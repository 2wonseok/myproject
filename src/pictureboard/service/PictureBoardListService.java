package pictureboard.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import jdbc.ConnectionProvider;
import pictureboard.dao.PictureBoardDao;
import pictureboard.model.PictureBoard;
import pictureboard.model.PictureBoardPage;

public class PictureBoardListService {
	private PictureBoardDao boardDao = new PictureBoardDao();
	private int size = 8;
	
	public PictureBoardPage getBoardPage(int pageNo) {
		try (Connection conn = ConnectionProvider.getConnection()){
			int total = boardDao.selectCount(conn);
			
			List<PictureBoard> content = boardDao.select(conn, pageNo, size);
			
			return new PictureBoardPage(total, pageNo, size, content);
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
