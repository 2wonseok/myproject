package member.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import jdbc.ConnectionProvider;
import member.dao.MemberDao;
import member.model.Member;

public class MemberListService {
	private MemberDao memberDao = new MemberDao();
	private int size = 10;
	
	public ListPage getListPage(int pageNo) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			int total = memberDao.selectCount(conn);
			
			List<Member> content = memberDao.pageSelect(conn, pageNo, size);

			return new ListPage(total, pageNo, size, content);
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public ListPage searchList(int pageNo, String searchKeyword, String searchField) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			int total = memberDao.selectCountSearch(conn, searchKeyword, searchField);

			List<Member> list = memberDao.selectSearch(conn, searchKeyword, searchField, pageNo, size, total);
			
			return new ListPage(total, pageNo, size, list);
			
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
}
