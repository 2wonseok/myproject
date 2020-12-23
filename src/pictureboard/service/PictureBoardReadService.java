package pictureboard.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import pictureboard.dao.PictureBoardDao;
import pictureboard.model.PictureBoard;

public class PictureBoardReadService {
	private PictureBoardDao boardDao = new PictureBoardDao();
	public void likeCount(int post_no, boolean likeCount) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			if (likeCount) {
				boardDao.likeCountUpdate(conn, post_no);
			}

		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public void readCount(int post_no, boolean readCount) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			if (readCount) {
				boardDao.readCountUpdate(conn, post_no);
			}

		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public PictureBoard postRead(int post_no) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			
			PictureBoard boardPost = boardDao.pictureBoardPost(conn, post_no);

			return boardPost;
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
