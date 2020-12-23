package member.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import jdbc.ConnectionProvider;
import member.dao.MemberDao;
import member.model.Member;

public class MemberViewService {
	private MemberDao memberDao = new MemberDao();
	
	public Member getMember(String id) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			
			Member memberView = memberDao.memberView(conn, id);

			return memberView;
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void updateMember(String id, int manager) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			
			memberDao.managerUpdate(conn, id, manager);

		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
