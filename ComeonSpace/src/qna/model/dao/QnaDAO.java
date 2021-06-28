package qna.model.dao;

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

import qna.model.vo.Qna;

public class QnaDAO {
	private Properties prop = new Properties();
	
	public QnaDAO() {
		String fileName = QnaDAO.class.getResource("/sql/qna/qna-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertQna(Connection conn, Qna q) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertQna");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, q.getUserNick());
			pstmt.setString(2, q.getUserProfile());
			pstmt.setString(3, q.getQnaContent());
			pstmt.setInt(4, q.getUserNum());
			pstmt.setInt(5, q.getHostNum());
			pstmt.setInt(6, q.getpNum());
			pstmt.setString(7, q.getpName());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Qna> selectQna(Connection conn, Qna q) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Qna qna = null;
		ArrayList<Qna> list = new ArrayList<Qna>();
		
		String query = prop.getProperty("selectQna");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, q.getpNum());
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				qna = new Qna();
				qna.setHostNum(rset.getInt("HOST_NUM"));
				qna.setUserNum(rset.getInt("USER_NUM"));
				qna.setpNum(rset.getInt("PRODUCT_NUM"));
				qna.setUserNick(rset.getString("USER_NICK"));
				qna.setQnaContent(rset.getString("QUESTION_CONTENT"));
				qna.setQnaAnswer(rset.getString("QUESTION_ANSWER"));
				qna.setUserProfile(rset.getString("USER_PROFILE"));
				qna.setQnaDate(rset.getDate("QUESTION_DATE"));
				qna.setAnsDate(rset.getDate("ANSWER_DATE"));
				
				list.add(qna);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Qna> selectQna(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Qna qna = null;
		ArrayList<Qna> list = new ArrayList<Qna>();
		
		String query = prop.getProperty("selectQna");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				qna = new Qna();
				qna.setHostNum(rset.getInt("HOST_NUM"));
				qna.setUserNum(rset.getInt("USER_NUM"));
				qna.setpNum(rset.getInt("PRODUCT_NUM"));
				qna.setUserNick(rset.getString("USER_NICK"));
				qna.setQnaContent(rset.getString("QUESTION_CONTENT"));
				qna.setQnaAnswer(rset.getString("QUESTION_ANSWER"));
				qna.setUserProfile(rset.getString("USER_PROFILE"));
				qna.setQnaDate(rset.getDate("QUESTION_DATE"));
				qna.setAnsDate(rset.getDate("ANSWER_DATE"));
				qna.setpName(rset.getString("PRODUCT_NAME"));
				
				list.add(qna);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Qna> selectAllQna(Connection conn, int hostNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Qna qna = null;
		ArrayList<Qna> list = new ArrayList<Qna>();
		
		String query = prop.getProperty("selectAllQna");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, hostNum);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				qna = new Qna();
				
				qna.setQnaNum(rset.getInt("QUESTION_NUM"));
				qna.setHostNum(rset.getInt("HOST_NUM"));
				qna.setUserNum(rset.getInt("USER_NUM"));
				qna.setpNum(rset.getInt("PRODUCT_NUM"));
				qna.setUserNick(rset.getString("USER_NICK"));
				qna.setQnaContent(rset.getString("QUESTION_CONTENT"));
				qna.setQnaAnswer(rset.getString("QUESTION_ANSWER"));
				qna.setUserProfile(rset.getString("USER_PROFILE"));
				qna.setQnaDate(rset.getDate("QUESTION_DATE"));
				qna.setAnsDate(rset.getDate("ANSWER_DATE"));
				qna.setpName(rset.getString("PRODUCT_NAME"));
				
				list.add(qna);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
	
		
		return list;
	}

	
	
	
	
	
	
	
	
	
	
}
