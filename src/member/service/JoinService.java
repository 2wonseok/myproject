package member.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import member.dao.MemberDao;
import member.model.Member;

public class JoinService {
	private MemberDao memberDao = new MemberDao();
	
	public void join(JoinRequest joinReq) {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			Member member = memberDao.selectById(conn, joinReq.getMemberId());
			
			if (member != null) {
				JdbcUtil.rollback(conn);
				throw new DuplicateIdException();
			}
			
			Member m = new Member();
			m.setMemberid(joinReq.getMemberId());
			m.setPassword(joinReq.getPassword());
			m.setName(joinReq.getName());
			m.setBirth(joinReq.getBirth());
			m.setGender(joinReq.getGender());
			m.setEmail(joinReq.getEmail());
			m.setPhone(joinReq.getPhone());
			m.setRegDate(new Date());
			
			memberDao.insert(conn, m);
			
			conn.commit();
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}
	}

}
