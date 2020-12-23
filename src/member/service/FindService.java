package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import member.dao.MemberDao;
import member.model.Member;

public class FindService {
	private MemberDao memberDao = new MemberDao();
	
	public Member memberFind(Member member) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			Member find = memberDao.memberFind(conn, member);

			if (find == null) {
				throw new LoginFailException();
			}
			
			return find;
					
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
	}
	
}
