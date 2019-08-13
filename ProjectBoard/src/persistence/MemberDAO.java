package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import domain.MemberDTO;

public class MemberDAO {
	private DataSource dataFatoer;
	
	public MemberDAO() {
		try {
			Context ctx = new InitialContext();
			dataFatoer = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle11g");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void closeAll(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void insert(MemberDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into sing(acc,id,password,name,nickname,birth,email,address,phone) values(?,?,?,?,?,?,?,?,?)";
		
		try {
			conn = dataFatoer.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getAccess());
	         pstmt.setString(2, dto.getId());
	         pstmt.setString(3, dto.getPassword());
	         pstmt.setString(4, dto.getName());
	         pstmt.setString(5, dto.getNickname());
	         pstmt.setString(6, dto.getBirth());
	         pstmt.setString(7, dto.getEmail());
	         pstmt.setString(8, dto.getAddress());
	         pstmt.setString(9, dto.getPhone());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, null);
		}
	}

	public boolean login(String id, String password) {
		boolean check = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select * from sing where id=? and password=?";
		ResultSet rs = null;
		
		try {
			conn = dataFatoer.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			int result = pstmt.executeUpdate();
			if(result == 1) {
				check = false;
			}else {
				check = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, rs);
		}
		return check;
	}

	public boolean idcheck(String id) {
		boolean check = true;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select id from sing where id=?";
		ResultSet rs = null;
		
		try {
			conn = dataFatoer.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			int num = pstmt.executeUpdate();
			if(num == 1) {
				check = true;
			}else {
				check = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, rs);
		}
		return check;
	}
	
	public String idfind(String name, String birth) {
		String id = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select id from sing where name=? and birth=?";
		ResultSet rs = null;
		
		try {
			conn = dataFatoer.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, birth);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				id = rs.getString("id");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, rs);
		}
		return id;
	}
	
	public String pwfind(String id, String email) {
		String pw = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select password from sing where id=? and email=?";
		ResultSet rs = null;
		
		try {
			conn = dataFatoer.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				pw = rs.getString("password");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, rs);
		}
		return pw;
	}

	public MemberDTO profile(String id) {
		MemberDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select * from sing where id=?";
		ResultSet rs = null;
		
		try {
			conn = dataFatoer.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				id = rs.getString("id");
				int access = rs.getInt("acc");
				String name = rs.getString("name");
				String nickname = rs.getString("nickname");
				String password = rs.getString("password");
				String birth = rs.getString("birth");
				String email = rs.getString("email");
				String address = rs.getString("address");
				String phone = rs.getString("phone");
				dto = new MemberDTO(access, id, name, nickname, password, birth, email, address, phone, null);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, rs);
		}
		return dto;
	}
}
