package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import member.service.LoginFailException;
import jdbc.ConnectionProvider;
import member.dao.MemberDao;
import member.model.Member;
import member.model.User;

public class LoginService {
	private MemberDao memberDao = new MemberDao();
	
	public User login(String memberId, String password) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			Member member = memberDao.selectById(conn, memberId);
			
			if (member == null) {
				throw new LoginFailException();
			}
		
			if (!member.matchPassword(password)) {
				throw new LoginFailException();
			}
			
			return new User(member.getMemberid(), member.getName(), member.getManager());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
