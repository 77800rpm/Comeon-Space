package product.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;
import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;

import enroll.model.vo.Enroll;
import img.model.vo.Img;
import product.model.dao.ProductDAO;

public class ProductService {
	
	public ArrayList<Enroll> selectList() {
		
		Connection conn = getConnection();
		
		ArrayList<Enroll> list = new ProductDAO().selectList(conn);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Img> selectFList() {
		
		Connection conn = getConnection();
		
		ArrayList<Img> list = new ProductDAO().selectFList(conn);
		
		close(conn);
		
		return list;
	}

	public Enroll selectProduct(int no) {
		Connection conn = getConnection();
		
		ProductDAO dao = new ProductDAO();
		
		int result = dao.updateCount(conn, no);
		
		Enroll product = null;
		
		if(result > 0) {
			product = dao.selectProduct(conn, no);
			
			if(product != null) 
			commit(conn);
			else rollback(conn);
			
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return product;
	}
}
