package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import member.dao.MemberDao;
import member.model.Member;

public class MemberModifyService {
	private MemberDao memberDao = new MemberDao();
	
	public Member selectModify(String id) {
		try(Connection conn = ConnectionProvider.getConnection()) {
			
			Member mem = memberDao.selectModify(conn, id);
			
			return mem;
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
		
		
	}

	public void memberUpdate(Member m) {
		try(Connection conn = ConnectionProvider.getConnection()) {
			
			memberDao.memberUpdate(conn, m);
			
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
