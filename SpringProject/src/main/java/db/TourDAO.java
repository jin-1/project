package db;

import static util.DbUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class TourDAO {
	Connection con = null;
	
	public TourDAO(Connection con) {
		super();
		this.con = con;
	}
	
	public List<TourDTO> getTour(String searchName){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<TourDTO> tour = null;
		try {
			String sql = "select * from local where local_name like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + searchName + "%");
			tour = new ArrayList();
			rs = pstmt.executeQuery();
			TourDTO tourdata = null;
			while(rs.next()) {
				tourdata = new TourDTO();
				tourdata.setLocalCode(rs.getString("local_code"));
				tourdata.setCorpID(rs.getString("corp_ID"));
				tourdata.setLocalName(rs.getString("local_name"));
				tourdata.setLocalPhone(rs.getString("local_phone"));
				tourdata.setLocalAddr(rs.getString("local_addr"));
				tourdata.setLocalCategory(rs.getString("local_category"));
				tourdata.setLocalContent(rs.getString("local_content"));
				tourdata.setRequestStauts(rs.getInt("request_status"));
				tourdata.setTravelCoord(rs.getString("travel_coord"));
				tour.add(tourdata);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return tour;
	}
	
	/*public int getListCount() {
		int x = 0;
		try {
			con = ds.getConnection();
			System.out.println("getConnection");
			pstmt = con.prepareStatement("select count(*) from local where local_name like ?");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				x = rs.getInt(1);
			}
			
		} catch(Exception e) {
			System.out.println("getListCount ¿¡·¯: " + e);
		} finally {
			if(rs != null) try {rs.close();} catch(SQLException e) {}
			if(pstmt != null) try{pstmt.close();} catch(SQLException e) {}
			if(con != null) try{con.close();} catch(SQLException e) {}
		}
		return x;
	}*/
}
