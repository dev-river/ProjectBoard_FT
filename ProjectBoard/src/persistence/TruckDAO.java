package persistence;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import domain.TruckDTO;
import domain.TruckPageTO;

public class TruckDAO {

	private DataSource dataFactory;
	
	public TruckDAO() {
		try {
			Context ctx = new InitialContext();
			dataFactory = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle11g");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void closeAll(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<TruckDTO> tctlist(String foodCategory) {
		List<TruckDTO> tctlist = new ArrayList<TruckDTO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select * from truckinfo where foodCategory='"+foodCategory+"'";
		
//데이터 확인용		System.out.println(">> sql = "+sql);
		
		ResultSet rs = null;
		
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int tNum = rs.getInt("tNum");
				String tPhone = rs.getString("tPhone");
				String tIntro = rs.getString("tIntro");
				String tInfo = rs.getString("tInfo");
				String tName = rs.getString("tName");
				String tTime = rs.getString("tTime");
				int tOpen = rs.getInt("tOpen");
				String tAddress = rs.getString("tAddress");
				String tNotice = rs.getString("tNotice");
				String tMenu = rs.getString("tMenu");
				
				TruckDTO dto = new TruckDTO(tNum, tPhone, tIntro, tInfo, tName, tTime, tOpen, foodCategory, tAddress, tNotice, tMenu);	
				tctlist.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, conn);
		}
		
		return tctlist;
	}

	public TruckPageTO list(int page, String foodCategory) {
		
		TruckPageTO to = new TruckPageTO(page);
		
		List<TruckDTO> list = new ArrayList<TruckDTO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select * from(select rownum rnum, tNum, tName, tTime, tOpen, tAddress from (select * from truckinfo where foodCategory=?)) where rnum between ? and ?";
		ResultSet rs = null;
		
		try {
			conn = dataFactory.getConnection();
			
			int amount = getAmount(conn);
			to.setAmount(amount);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, foodCategory);
			pstmt.setInt(2, to.getStartNum());
			pstmt.setInt(3, to.getEndNum());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int tNum = rs.getInt("tNum");
				String tName = rs.getString("tName");
				String tTime = rs.getString("tTime");
				int tOpen = rs.getInt("tOpen");
				String tAddress = rs.getString("tAddress");
				
				
				list.add(new TruckDTO(tNum, null, null, null, tName, tTime, tOpen, foodCategory, tAddress, null, null));
				
				to.setList(list);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, conn);
		}
		
		return to;
	}

	private int getAmount(Connection conn) {
		PreparedStatement pstmt = null;
		String sql = "select count(tNum) from truckinfo";
		ResultSet rs = null;
		int count = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, null);
		}
		
		return count;
	}

// 	08-13 강기훈 list_tNum tNum을 기준으로 데이터 뽑아오는 메서드 생성
	public List<TruckDTO> list_tNum(int tNum) {
		List<TruckDTO> list_tNum = new ArrayList<TruckDTO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select tNum, tPhone, tIntro, tInfo, tName, tTime, tOpen, foodCategory, tAddress, tNotice, tMenu from truckinfo where tNum=?";
		
//데이터 확인용		System.out.println(">> sql = "+sql);
		
		ResultSet rs = null;
		
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String tPhone = rs.getString("tPhone");
				String tIntro = rs.getString("tIntro");
				String tInfo = rs.getString("tInfo");
				String tName = rs.getString("tName");
				String tTime = rs.getString("tTime");
				int tOpen = rs.getInt("tOpen");
				String foodCategory = rs.getString("foodCategory");
				String tAddress = rs.getString("tAddress");
				String tNotice = rs.getString("tNotice");
				String tMenu = rs.getString("tMenu");
				
				TruckDTO dto = new TruckDTO(tNum, tPhone, tIntro, tInfo, tName, tTime, tOpen, foodCategory, tAddress, tNotice, tMenu);	
				list_tNum.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, conn);
		}
		
		return list_tNum;
	}
	
	
}
