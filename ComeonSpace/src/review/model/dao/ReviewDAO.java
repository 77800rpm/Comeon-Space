package review.model.dao;

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

import common.pageInfo.model.vo.PageInfo;
import review.model.vo.Review;

public class ReviewDAO {
	private Properties prop = new Properties();
	
	public ReviewDAO() {
		String fileName = ReviewDAO.class.getResource("/sql/review/review-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public int insertReview(Connection conn, Review review) {
		PreparedStatement pstmt = null;
		int result = 0;
		 
		String query = prop.getProperty("insertReview");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, review.getUserNum());
			pstmt.setInt(2, review.getProdNum());
			pstmt.setInt(3, review.getOrderNum());
			pstmt.setString(4, review.getBuyerName());
			pstmt.setString(5, review.getBuyerNic());
			pstmt.setString(6, review.getRevContent());
			pstmt.setString(7, review.getRevTitle());
			pstmt.setString(8, review.getProdName());
			pstmt.setInt(9, review.getStar());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int getListCount(Connection conn, int userNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getListCount");
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
	public ArrayList<Review> selectReview(Connection conn, int userNum, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Review> list = new ArrayList<Review>();
		Review re = null;
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		String query = prop.getProperty("selectReview");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userNum);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				re = new Review();
				re.setReviewNum(rset.getInt("REVIEW_NUM"));
				re.setUserNum(rset.getInt("USER_NUM"));
				re.setProdNum(rset.getInt("PROD_NUM"));
				re.setOrderNum(rset.getInt("ORDER_NUM"));
				re.setBuyerName(rset.getString("USER_NAME"));
				re.setBuyerNic(rset.getString("USER_NIC"));
				re.setRevContent(rset.getString("REVIEW_CONTENT"));
				re.setRevTitle(rset.getString("REVIEW_TITLE"));
				re.setProdName(rset.getString("PROD_NAME"));
				re.setRevDate(rset.getDate("REVIEW_DATE"));
				re.setStar(rset.getInt("REVIEW_STAR"));
				
				list.add(re);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	public ArrayList<Review> detailReview(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Review> list = new ArrayList<Review>();
		Review re = null;
		
		String query = prop.getProperty("detailReview");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				re = new Review();
				re.setReviewNum(rset.getInt("REVIEW_NUM"));
				re.setUserNum(rset.getInt("USER_NUM"));
				re.setProdNum(rset.getInt("PROD_NUM"));
				re.setOrderNum(rset.getInt("ORDER_NUM"));
				re.setBuyerName(rset.getString("USER_NAME"));
				re.setBuyerNic(rset.getString("USER_NIC"));
				re.setRevContent(rset.getString("REVIEW_CONTENT"));
				re.setRevTitle(rset.getString("REVIEW_TITLE"));
				re.setProdName(rset.getString("PROD_NAME"));
				re.setRevDate(rset.getDate("REVIEW_DATE"));
				re.setStar(rset.getInt("REVIEW_STAR"));
				
				list.add(re);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	public int updateAddCount(Connection conn, int rNum) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateAddCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, rNum);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int updateDecreaseCount(Connection conn, int rNum) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateDecreaseCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, rNum);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
<<<<<<< HEAD
	public ArrayList<Review> selectList(Connection conn, String userName, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Review> list = new ArrayList<Review>();
		Review re = null;
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		String query = prop.getProperty("selectReview2");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userName);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				re = new Review();
				re.setReviewNum(rset.getInt("REVIEW_NUM"));
				re.setUserNum(rset.getInt("USER_NUM"));
				re.setProdNum(rset.getInt("PROD_NUM"));
				re.setOrderNum(rset.getInt("ORDER_NUM"));
				re.setBuyerName(rset.getString("USER_NAME"));
				re.setBuyerNic(rset.getString("USER_NIC"));
				re.setRevContent(rset.getString("REVIEW_CONTENT"));
				re.setRevTitle(rset.getString("REVIEW_TITLE"));
				re.setProdName(rset.getString("PROD_NAME"));
				re.setRevDate(rset.getDate("REVIEW_DATE"));
				re.setStar(rset.getInt("REVIEW_STAR"));
				
				list.add(re);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
=======
	public Review selectTop(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		Review re = null;
		
		String query = prop.getProperty("selectTop");
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next()) {
				re = new Review();
				re.setReviewNum(rset.getInt("REVIEW_NUM"));
				re.setUserNum(rset.getInt("USER_NUM"));
				re.setProdNum(rset.getInt("PROD_NUM"));
				re.setOrderNum(rset.getInt("ORDER_NUM"));
				re.setBuyerName(rset.getString("USER_NAME"));
				re.setBuyerNic(rset.getString("USER_NIC"));
				re.setRevContent(rset.getString("REVIEW_CONTENT"));
				re.setRevTitle(rset.getString("REVIEW_TITLE"));
				re.setProdName(rset.getString("PROD_NAME"));
				re.setRevDate(rset.getDate("REVIEW_DATE"));
				re.setStar(rset.getInt("REVIEW_STAR"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}				
		
		return re;
	}
	public Review scoreRe(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Review scoreRe = null;
		
		String query = prop.getProperty("scoreRe");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				scoreRe = new Review();
				scoreRe.setAvgStar(rset.getDouble("A_STAR"));
				scoreRe.setCountReview(rset.getInt("COUNT"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return scoreRe;
>>>>>>> branch 'main' of https://github.com/seunghyun93/Comeon-Space.git
	}
}
