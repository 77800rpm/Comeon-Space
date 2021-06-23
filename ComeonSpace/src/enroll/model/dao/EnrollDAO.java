package enroll.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import enroll.model.vo.Enroll;

public class EnrollDAO {
	private Properties prop = new Properties();
	
	public EnrollDAO() {
		String fileName = EnrollDAO.class.getResource("/sql/enroll/enroll-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertSpace(Connection conn, Enroll en) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertSpace");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, en.getpName());
			pstmt.setInt(2, en.getProductPrice());
			pstmt.setString(3, en.getpCategory());
			pstmt.setString(4, en.getpIntro());
			pstmt.setString(5, en.getpDetail());
			pstmt.setString(6, en.getpLocation());
			pstmt.setString(7, en.getpFacility());
			pstmt.setInt(8, en.getUserNum());
			pstmt.setInt(9, en.getpLimit());
			pstmt.setString(10, en.getHoliday());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	
}
