package order.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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
}
