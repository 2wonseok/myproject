package noticeboard.service;

import java.sql.Connection;

import java.sql.SQLException;

import jdbc.ConnectionProvider;
import noticeboard.dao.NoticeBoardDao;

public class NoticeBoardRemoveService {
	private NoticeBoardDao boardDao = new NoticeBoardDao();
	
	public void postDelete(int post_no) {
		// TODO Auto-generated method stub
		try (Connection conn = ConnectionProvider.getConnection()) {
			boardDao.postDelete(conn, post_no);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
