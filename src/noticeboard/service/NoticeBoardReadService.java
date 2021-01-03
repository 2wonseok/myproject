package noticeboard.service;

import java.sql.Connection;

import java.sql.SQLException;

import freeboard.model.FreeBoard;
import jdbc.ConnectionProvider;
import noticeboard.dao.NoticeBoardDao;

public class NoticeBoardReadService {
	private NoticeBoardDao boardDao = new NoticeBoardDao();
	
	public FreeBoard postRead(int post_no) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			
			FreeBoard boardPost = boardDao.noticeBoardPost(conn, post_no);

			return boardPost;
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

	public void likeCount(int post_no, boolean likeCount) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			if (likeCount) {
				boardDao.likeCountUpdate(conn, post_no);
			}

		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
