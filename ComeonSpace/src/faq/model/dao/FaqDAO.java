package faq.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import faq.model.vo.Faq;
import member.model.dao.MemberDAO;

public class FaqDAO {
	
	private Properties prop = new Properties();
	
	public FaqDAO() {
		String fileName = FaqDAO.class.getResource("/sql/faq/faq-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Faq> faqSelect(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Faq> selectBoard = null;
		
		String query = prop.getProperty("selectBoard");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			selectBoard = new ArrayList<Faq>();
			while(rset.next()) {
				Faq f = new Faq(rset.getInt("BOARDFAQ_NUM"),
								rset.getString("BOARDFAQ_TITLE"),
								rset.getString("BOARDFAQ_CONTENT"),
								rset.getInt("ADM_NUM"));
				
				selectBoard.add(f);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return selectBoard;
	}

	public int insertBoard(Connection conn, Faq f) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, f.getBoardFaqNum());
			pstmt.setString(2, f.getBoardFaqTitle());
			pstmt.setString(3, f.getBoardFaqContent());
			pstmt.setInt(4,f.getAdmNum());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
