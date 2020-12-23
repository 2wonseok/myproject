package member.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import jdbc.JdbcUtil;
import member.model.Member;

public class MemberDao {
	
	public void insert(Connection conn, Member m) throws SQLException {
		String sql = "INSERT INTO members VALUES (?, ?, ?, ?, ?, ?, ?, 1, SYSDATE)";
		
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, m.getMemberid());
			pstmt.setString(2, m.getPassword());
			pstmt.setString(3, m.getName());
			pstmt.setString(4, m.getBirth());
			pstmt.setString(5, m.getGender());
			pstmt.setString(6, m.getEmail());
			pstmt.setString(7, m.getPhone());
			
			pstmt.executeUpdate();
		} 
	}

	public Member selectById(Connection conn, String memberId) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member member = null;
		String sql = "SELECT memberid, name, email, password, manager FROM members WHERE memberid = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
		
			if (rs.next()) {
				member = new Member();
				member.setMemberid(rs.getString(1));
				member.setName(rs.getString(2));
				member.setEmail(rs.getString(3));
				member.setPassword(rs.getString(4));
				member.setManager(rs.getInt(5));
			}
			return member;
		} finally {
			JdbcUtil.close(rs, pstmt);
		}
	}

	public void remove(Connection conn, Member member) throws SQLException {
		String sql = "DELETE FROM members WHERE memberid = ?";
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, member.getMemberid());
			
			pstmt.executeUpdate();
			
		}
	}

	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM members";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				return rs.getInt(1);
			}
			
			return 0;
		} finally {
			JdbcUtil.close(rs, stmt);
		}
	}
	
	public int selectCountSearch(Connection conn, String searchKeyword, String searchField) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM members WHERE "+searchKeyword+" LIKE '%"+searchField+"%'";
		
		try {
			stmt = conn.createStatement();

			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				return rs.getInt(1);
			}
			
			return 0;
		} finally {
			JdbcUtil.close(rs, stmt);
		}
	}

	public List<Member> pageSelect(Connection conn, int pageNo, int size) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY regdate DESC) rn, regdate, gender, memberid, name, birth, email, phone, manager  "
															 +"FROM members) "
								+"WHERE rn  BETWEEN ? AND ?";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, (pageNo-1) * size + 1);
			pstmt.setInt(2, pageNo * size);
			rs = pstmt.executeQuery();
			List<Member> m = new ArrayList<>();
			while (rs.next()) {
				Member member = new Member();
				member.setMemberid(rs.getString("memberid"));
				member.setName(rs.getString("name"));
				member.setEmail(rs.getString("email"));
				member.setBirth(rs.getString("birth"));
				member.setManager(rs.getInt("manager"));
				member.setGender(rs.getString("gender"));
				member.setPhone(rs.getString("phone"));
				member.setRegDate(rs.getDate("regdate"));
				m.add(member);
			}
			
			return m;
			
		} finally {
			JdbcUtil.close(rs, pstmt);
		}
	}

	public Member memberFind(Connection conn, Member member) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		String sql = "SELECT memberid, name, email, password, manager FROM members WHERE email = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getEmail());
			rs = pstmt.executeQuery();
		
			if (rs.next()) {
				m = new Member();
				m.setMemberid(rs.getString(1));
				m.setName(rs.getString(2));
				m.setEmail(rs.getString(3));
				m.setPassword(rs.getString(4));
				m.setManager(rs.getInt(5));
			}
			return m;
		} finally {
			JdbcUtil.close(rs, pstmt);
		}
	}

	public List<Member> selectSearch(Connection conn, String searchKeyword, String searchField, int pageNo, int size, int total) throws SQLException {
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;
		Member m = null;
		int startPage = (pageNo-1) * size + 1;
		int endPage = pageNo * size;
		String sql = "";
		
		if (total > 10) {
			sql = "SELECT name, memberid, gender, phone, regdate FROM (SELECT ROW_NUMBER() OVER (ORDER BY regdate DESC) "
				+"rn, name, memberid, gender, phone, regdate "
				+"FROM members) "
				+"WHERE "+searchKeyword+" LIKE '%"+searchField+"%' AND rn BETWEEN "+startPage+" AND "+endPage;
		} else {
			sql = "SELECT name, memberid, gender, phone, regdate FROM (SELECT ROW_NUMBER() OVER (ORDER BY regdate DESC) "
					+"rn, name, memberid, gender, phone, regdate "
					+"FROM members) "
					+"WHERE "+searchKeyword+" LIKE '%"+searchField+"%'";
		}
		
		if (searchKeyword.equals("gender") && total > 10) {
			sql = "SELECT name, memberid, gender, phone, regdate FROM (SELECT ROW_NUMBER() OVER (ORDER BY regdate DESC) "
					+"rn, name, memberid, gender, phone, regdate "
					+"FROM members) "
					+"WHERE "+searchKeyword+" = '"+searchField+"' AND rn BETWEEN "+startPage+" AND "+endPage;
		} else if (searchKeyword.equals("gender") && total < 10) {
			sql = "SELECT name, memberid, gender, phone, regdate FROM (SELECT ROW_NUMBER() OVER (ORDER BY regdate DESC) "
					+"rn, name, memberid, gender, phone, regdate "
					+"FROM members) "
					+"WHERE "+searchKeyword+" = '"+searchField+"'";
		}
		
		List<Member> member = new ArrayList<>();
		
		try {
			stmt = conn.createStatement();
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, (pageNo-1) * size + 1);
//			pstmt.setInt(2, pageNo * size);

			rs = stmt.executeQuery(sql);
		
			while (rs.next()) {
				m = new Member();
				m.setName(rs.getString("name"));
				m.setMemberid(rs.getString("memberid"));
				m.setGender(rs.getString("gender"));
				m.setPhone(rs.getString("phone"));
				m.setRegDate(rs.getDate("regdate"));
				member.add(m);
			}
			return member;
		} finally {
			JdbcUtil.close(rs, stmt);
		}
	}

	public Member memberView(Connection conn, String id) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		
		String sql = "SELECT * FROM members WHERE memberid = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
		
			while (rs.next()) {
				m = new Member();
				m.setMemberid(rs.getString("memberid"));
				m.setName(rs.getString("name"));
				m.setPassword(rs.getString("password"));
				m.setBirth(rs.getString("birth"));
				m.setGender(rs.getString("gender"));
				m.setEmail(rs.getString("email"));
				m.setPhone(rs.getString("phone"));
				m.setManager(rs.getInt("manager"));
				m.setRegDate(rs.getDate("regdate"));
			}
			return m;
		} finally {
			JdbcUtil.close(rs, pstmt);
		}
	}

	public int managerUpdate(Connection conn, String id, int manager) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		
		String sql = "UPDATE members SET manager = ? WHERE memberid = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, manager);
			pstmt.setString(2, id);
			
			int cnt = pstmt.executeUpdate();
			
			return cnt;
			
		} finally {
			JdbcUtil.close(rs, conn);
		}
	}

	public Member selectModify(Connection conn, String id) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		String sql = "SELECT * FROM members WHERE memberid = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				m = new Member();
				m.setMemberid(rs.getString("memberid"));
				m.setName(rs.getString("name"));
				m.setPassword(rs.getString("password"));
				m.setBirth(rs.getString("birth"));
				m.setGender(rs.getString("gender"));
				m.setEmail(rs.getString("email"));
				m.setPhone(rs.getString("phone"));
				m.setManager(rs.getInt("manager"));
				m.setRegDate(rs.getDate("regdate"));
			}
		} finally {
			JdbcUtil.close(rs, pstmt);
		}
		return m;
	}

	public int memberUpdate(Connection conn, Member m) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "UPDATE members SET birth = ?, email = ?, phone = ? WHERE memberid = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getBirth());
			pstmt.setString(2, m.getEmail());
			pstmt.setString(3, m.getPhone());
			pstmt.setString(4, m.getMemberid());
			
			int cnt = pstmt.executeUpdate();
			
			return cnt;
			
		} finally {
			JdbcUtil.close(rs, conn);
		}
	}

}
