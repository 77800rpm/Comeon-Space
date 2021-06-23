package product.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import enroll.model.vo.Enroll;
import img.model.vo.Img;
import static common.JDBCTemplate.close;

public class ProductDAO {

	private Properties prop = new Properties();
	
	public ProductDAO() {
		String fileName = ProductDAO.class.getResource("/sql/product/product-query.properties").getPath(); 
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	
	public ArrayList<Enroll> selectList(Connection conn) {
		
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Enroll> list = new ArrayList<Enroll>();
		
		String query = prop.getProperty("selectList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Enroll pro = new Enroll(rset.getInt("PRODUCT_NUM"),
										rset.getString("PRODUCT_NAME"),
										rset.getInt("PRODUCT_PRICE"),
										rset.getString("PRODUCT_CATEGORY"),
										rset.getString("PRODUCT_INTRO"),
										rset.getString("PRODUCT_LOCATION"),
										rset.getInt("PRODUCT_COUNT"));
				
				list.add(pro);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}


	public ArrayList<Img> selectFList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Img> list = new ArrayList<Img>();
		
		String query = prop.getProperty("selectFList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				list.add(new Img(rset.getString("IMG_CHANGE"), rset.getInt("IMG_BOARDID")));
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


	public int updateCount(Connection conn, int no) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");	
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public Enroll selectProduct(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Enroll product = null;
		
		String query = prop.getProperty("selectProduct");	
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
					  product = new Enroll(rset.getInt("product_num"),
										rset.getString("product_name"),
										rset.getInt("product_limit"),
										rset.getInt("product_price"),
										rset.getString("product_category"),
										rset.getString("product_intro"),
										rset.getString("Product_detail"),
										rset.getString("product_location"),
										rset.getString("product_fac"),
										rset.getInt("product_count"),
										rset.getString("product_holiday"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return product;
	}
}
