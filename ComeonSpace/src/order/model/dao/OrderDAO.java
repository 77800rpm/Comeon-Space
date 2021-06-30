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

	public ArrayList<Order> selectList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Order> list = new ArrayList<Order>();
	
		String query = prop.getProperty("selectOrderList");
		
		try {
			stmt = conn.createStatement();			
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Order or = new Order(rset.getString("PROD_NAME"),
									   rset.getInt("TOTAL_PRICE"),
									   rset.getString("BUYER_NAME"),
									   rset.getString("REV_DATE"),
									   rset.getInt("PROD_NUM"),
									   rset.getDate("ORDER_DATE"),
									   rset.getInt("ORDER_NUM"));
				list.add(or);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		

		return list;
	}
}
