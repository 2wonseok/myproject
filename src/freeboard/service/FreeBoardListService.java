package freeboard.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import freeboard.dao.BoardDao;
import freeboard.model.BoardPage;
import freeboard.model.FreeBoard;
import jdbc.ConnectionProvider;
import member.model.Member;
import member.service.ListPage;

public class FreeBoardListService {
	private BoardDao boardDao = new BoardDao();
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

}
