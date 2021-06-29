package center.myQ.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import center.myQ.model.vo.MyQuestion;
import common.pageInfo.model.vo.PageInfo;

public class MyQuestionDAO {
	
	private Properties prop = new Properties();
	
	public MyQuestionDAO() {
		String fileName = MyQuestionDAO.class.getResource("/sql/myQ/myQ-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertQuestion(Connection conn, MyQuestion myQ) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertMyQ");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, myQ.getMyQTitle());
			pstmt.setString(2, myQ.getMyQContent());
			pstmt.setString(3, myQ.getMyQCategory());
			pstmt.setInt(4, myQ.getUserNum());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} close(pstmt);
		
		return result;
	}

	public ArrayList<MyQuestion> selectMyQ(Connection conn, int userNum, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<MyQuestion> list = new ArrayList<MyQuestion>();
		
		int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;  
		int endRow = startRow + pi.getBoardLimit() -1;

		String query = prop.getProperty("selectMyQ");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userNum);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				MyQuestion myQ = new MyQuestion();
				
				myQ.setMyQNum(rset.getInt("MYQ_NUM"));
				myQ.setMyQTitle(rset.getString("MYQ_TITLE"));
				myQ.setMyQContent(rset.getString("MYQ_CONTENT"));
				myQ.setMyQCategory(rset.getString("MYQ_CATEGORY"));
				myQ.setMyQAnswer(rset.getString("MYQ_ANSWER"));
				myQ.setMyQCreate(rset.getDate("MYQ_DATE"));
				myQ.setUserNum(rset.getInt("USER_NUM"));
				myQ.setAdmNum(rset.getInt("ADM_NUM"));
				myQ.setStatus(rset.getString("MYQ_STATUS"));
				
				list.add(myQ);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}

	public MyQuestion detailMyQuestion(Connection conn, int bId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		MyQuestion my = new MyQuestion();
		String query = prop.getProperty("detailMyQ");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bId);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				my.setMyQNum(rset.getInt("MYQ_NUM"));
				my.setMyQTitle(rset.getString("MYQ_TITLE"));
				my.setMyQContent(rset.getString("MYQ_CONTENT"));
				my.setMyQCategory(rset.getString("MYQ_CATEGORY"));
				my.setMyQAnswer(rset.getString("MYQ_ANSWER"));
				my.setMyQCreate(rset.getDate("MYQ_DATE"));
				my.setUserNum(rset.getInt("USER_NUM"));
				my.setAdmNum(rset.getInt("ADM_NUM"));
				my.setStatus(rset.getString("MYQ_STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return my;
	}

	public int selectListCount(int userNum, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("selectListCount");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userNum);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
				
		
		return result;
	}

}
