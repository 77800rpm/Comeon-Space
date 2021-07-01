package order.model.dao;

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
import order.model.vo.Order;

public class OrderDAO {
	private Properties prop = new Properties();
	
	public OrderDAO() {
		String fileName = OrderDAO.class.getResource("/sql/order/order-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertOrder(Connection conn, Order order) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertOrder");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, order.getBuyerEmail());
			pstmt.setString(2, order.getBuyerName());
			pstmt.setString(3, order.getBuyerPhone());
			pstmt.setString(4, order.getProdName());
			pstmt.setString(5, order.getRevDate());
			pstmt.setInt(6, order.getHostNum());
			pstmt.setInt(7, order.getProdNum());
			pstmt.setInt(8, order.getTotalPrice());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Order> selectSalesHistory(Connection conn, int userNum, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Order order = null;
		ArrayList<Order> list = new ArrayList<Order>();
		
		int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() -1;
		
		String query = prop.getProperty("selectSalesHistory");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userNum);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				order = new Order();
				order.setBuyerEmail(rset.getString("BUYER_EMAIL"));
				order.setOrderNum(rset.getInt("ORDER_NUM"));
				order.setBuyerName(rset.getString("BUYER_NAME"));
				order.setBuyerPhone(rset.getString("BUYER_PHONE"));
				order.setHostNum(rset.getInt("H_NUM"));
				order.setProdName(rset.getString("PROD_NAME"));
				order.setProdNum(rset.getInt("PROD_NUM"));
				order.setTotalPrice(rset.getInt("TOTAL_PRICE"));
				order.setRevDate(rset.getString("REV_DATE"));
				order.setOrderDate(rset.getDate("ORDER_DATE"));
				
				list.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
				
		
		
		return list;
	}

	public Order selctDetail(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Order order = null;
		
		String query = prop.getProperty("selectDetail");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				order = new Order();
				order.setBuyerEmail(rset.getString("BUYER_EMAIL"));
				order.setOrderNum(rset.getInt("ORDER_NUM"));
				order.setBuyerName(rset.getString("BUYER_NAME"));
				order.setBuyerPhone(rset.getString("BUYER_PHONE"));
				order.setHostNum(rset.getInt("HOST_NUM"));
				order.setProdName(rset.getString("PROD_NAME"));
				order.setProdNum(rset.getInt("PROD_NUM"));
				order.setTotalPrice(rset.getInt("TOTAL_PRICE"));
				order.setRevDate(rset.getString("REV_DATE"));
				order.setOrderDate(rset.getDate("ORDER_DATE"));
			}
					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return order;
	}

	public int getHostListCount(Connection conn, int userNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getHostListCount");
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
	
	public ArrayList<Order> selectList(Connection conn, String userName, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Order order = null;
		ArrayList<Order> list = new ArrayList<Order>();
		
		int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() -1;
				
		String query = prop.getProperty("selectOrderList");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userName);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				order = new Order();
				order.setBuyerEmail(rset.getString("BUYER_EMAIL"));
				order.setOrderNum(rset.getInt("ORDER_NUM"));
				order.setBuyerName(rset.getString("BUYER_NAME"));
				order.setBuyerPhone(rset.getString("BUYER_PHONE"));
				order.setHostNum(rset.getInt("H_NUM"));
				order.setProdName(rset.getString("PROD_NAME"));
				order.setProdNum(rset.getInt("PROD_NUM"));
				order.setTotalPrice(rset.getInt("TOTAL_PRICE"));
				order.setRevDate(rset.getString("REV_DATE"));
				order.setOrderDate(rset.getDate("ORDER_DATE"));
				
				list.add(order);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
				
		
		
		return list;
	}

	public Order selctOrderDetail(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Order order = null;
		
		String query = prop.getProperty("selectDetail");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				order = new Order();
				order.setBuyerEmail(rset.getString("BUYER_EMAIL"));
				order.setOrderNum(rset.getInt("ORDER_NUM"));
				order.setBuyerName(rset.getString("BUYER_NAME"));
				order.setBuyerPhone(rset.getString("BUYER_PHONE"));
				order.setHostNum(rset.getInt("HOST_NUM"));
				order.setProdName(rset.getString("PROD_NAME"));
				order.setProdNum(rset.getInt("PROD_NUM"));
				order.setTotalPrice(rset.getInt("TOTAL_PRICE"));
				order.setRevDate(rset.getString("REV_DATE"));
				order.setOrderDate(rset.getDate("ORDER_DATE"));
			}
					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return order;
	}

	public int getHostListCount(Connection conn, String userName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getGuestListCount");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userName);
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
