package order.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import order.model.dao.OrderDAO;
import order.model.vo.Order;

public class OrderService {
	public int insertOrder(Order order) {
		Connection conn = getConnection();
		OrderDAO dao = new OrderDAO();
		
		int result = dao.insertOrder(conn, order);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public ArrayList<Order> selectList() {
		
			Connection conn = getConnection();
			
			ArrayList<Order> list = new OrderDAO().selectList(conn);
			
			close(conn);
			
			return list;
		}
}
