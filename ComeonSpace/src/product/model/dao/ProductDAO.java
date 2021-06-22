package product.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
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
}
