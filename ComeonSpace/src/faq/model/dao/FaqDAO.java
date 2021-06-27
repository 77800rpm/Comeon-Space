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
import notice.model.vo.Notice;

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
				Faq fo = new Faq(rset.getInt("BOARDFAQ_NUM"),
								rset.getString("BOARDFAQ_TITLE"),
								rset.getDate("CREATE_DATE"),
								rset.getInt("BOARD_COUNT"));
				
				selectBoard.add(fo);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return selectBoard;
	}

	public int admInsertFaq(Connection conn, Faq fo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("admInsertFaq");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, fo.getBoardFaqTitle());
			pstmt.setString(2, fo.getBoardFaqContent());
//			pstmt.setString(3, f.getAdmName());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Faq admDetailFaq(Connection conn, int bId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Faq fo = null;
		
		String query = prop.getProperty("admDetailFaq");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bId);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				fo = new Faq();
				fo.setBoardFaqNum(rset.getInt("BOARDFAQ_NUM"));
				fo.setBoardFaqTitle(rset.getString("BOARDFAQ_TITLE"));
				fo.setBoardFaqContent(rset.getString("BOARDFAQ_CONTENT"));
				fo.setCreateDate(rset.getDate("CREATE_DATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return fo;
	}

	public int admDeleteFaq(Connection conn, int bId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("admDeleteFaq");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
}
