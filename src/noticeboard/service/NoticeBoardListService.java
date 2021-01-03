package noticeboard.service;

import java.sql.Connection;

import java.sql.SQLException;
import java.util.List;

import freeboard.model.BoardPage;
import freeboard.model.FreeBoard;
import jdbc.ConnectionProvider;
import noticeboard.dao.NoticeBoardDao;

public class NoticeBoardListService {
	private NoticeBoardDao boardDao = new NoticeBoardDao();
	private int size = 10;
	
	public BoardPage getBoardPage(int pageNo) {
		
		try (Connection conn = ConnectionProvider.getConnection()){
			int total = boardDao.selectCount(conn);
			
			List<FreeBoard> content = boardDao.select(conn, pageNo, size);
			
			return new BoardPage(total, pageNo, size, content);
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}

		
	}

	public BoardPage searchContent(int pageNo, String searchKeyword, String searchField) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			int total = boardDao.selectContentCount(conn, searchKeyword, searchField);

			List<FreeBoard> content = boardDao.searchContent(conn, searchKeyword, searchField, pageNo, size, total);
			
			return new BoardPage(total, pageNo, size, content);
			
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public BoardPage getMainPage(int pageNo) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			int total = 0;
			
			List<FreeBoard> content = boardDao.getMainPage(conn);
			
			return new BoardPage(total, pageNo, size, content);
			
		} catch (SQLException e)  {
			throw new RuntimeException(e);
		}
		
	}

	public BoardPage getSubPage(int pageNo) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			int total = 0;
			
			List<FreeBoard> content = boardDao.getSubPage(conn);
			
			return new BoardPage(total, pageNo, size, content);
			
		} catch (SQLException e)  {
			throw new RuntimeException(e);
		}
	}

}
