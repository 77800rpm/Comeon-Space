package product.model.dao;

import static common.JDBCTemplate.close;

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
import product.model.vo.Product;

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
					  product.setUserNum(rset.getInt("USER_NUM"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return product;
	}


	public ArrayList<Img> selectThumbnail(Connection conn, int no) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Img> list = null;
		
		String query = prop.getProperty("selectThumbnail");	
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Img>();
			
			while(rset.next()) {
				Img pro = new Img();
				pro.setImgNum(rset.getInt("img_num"));
				pro.setImgOrigin(rset.getString("img_origin"));
				pro.setImgChange(rset.getString("img_change"));
				pro.setImgPath(rset.getString("img_path"));
				pro.setImgBoardId(rset.getInt("img_boardid"));
				
				list.add(pro);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}


	public ArrayList<Enroll> selectCategory(Connection conn, String category) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Enroll product = null;
		ArrayList<Enroll> list = new ArrayList<Enroll>();
		
		String query = prop.getProperty("selectCategory");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, category);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
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
				  
				  list.add(product);

			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}


	public ArrayList<Enroll> mainCategory(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Enroll> list = new ArrayList<Enroll>();
		Enroll en = null;
		
		String query = prop.getProperty("mainCategory");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				en = new Enroll();
				en.setpCategory(rset.getString("PRODUCT_CATEGORY"));
				en.setpCount(rset.getInt(1));
				
				list.add(en);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
	
		return list;
	}
			
	public ArrayList<Enroll> selectList(String PRODUCT_LOCATION, String PRODUCT_CATEGORY, String PRODUCT_HOLIDAY, Connection conn) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Enroll> slist = new ArrayList<Enroll>();
		String query = null;

		
		if(PRODUCT_CATEGORY.equals("모든공간")) {
			query = prop.getProperty("selectSearchCategoryAll");
			try {
				pstmt = conn.prepareStatement(query);
		        pstmt.setString(1, "%"+PRODUCT_LOCATION+"%");
		        pstmt.setString(2, "%"+PRODUCT_HOLIDAY+"%");
		        rset = pstmt.executeQuery();
		         
		         while(rset.next()) {
		            Enroll pro = new Enroll(rset.getInt("PRODUCT_NUM"),
		                              rset.getString("PRODUCT_NAME"),
		                              rset.getInt("PRODUCT_PRICE"),
		                              rset.getString("PRODUCT_CATEGORY"),
		                              rset.getString("PRODUCT_INTRO"),
		                              rset.getString("PRODUCT_LOCATION"),
		                              rset.getInt("PRODUCT_COUNT"));
		            
		            slist.add(pro);
		         }				
		         
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
						
			
		} else {
			query = prop.getProperty("selectSearch");	
			try {
		         pstmt = conn.prepareStatement(query);
		         pstmt.setString(1, "%"+PRODUCT_LOCATION+"%");
		         pstmt.setString(2, "%"+PRODUCT_CATEGORY+"%");
		         pstmt.setString(3, "%"+PRODUCT_HOLIDAY+"%");
		         rset = pstmt.executeQuery();
		         
		         while(rset.next()) {
		            Enroll pro = new Enroll(rset.getInt("PRODUCT_NUM"),
		                              rset.getString("PRODUCT_NAME"),
		                              rset.getInt("PRODUCT_PRICE"),
		                              rset.getString("PRODUCT_CATEGORY"),
		                              rset.getString("PRODUCT_INTRO"),
		                              rset.getString("PRODUCT_LOCATION"),
		                              rset.getInt("PRODUCT_COUNT"));
		            
		            slist.add(pro);
		         }

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}		


		
	
		return slist;
	}
	
	
	//공간 승인/취소 위한 리스트 가져오기
	public ArrayList<Product> selectProductList(Integer pageNo, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> slist = new ArrayList<Product>();
		String query = null;

		query = prop.getProperty("selectProductSpaceApproveList");
		try {
			/*페이지 번호 받을 수 있는 쿼리로 수정할 예정*/
			int startPageRn=(pageNo-1)*10+1;
			int endPageRn=startPageRn+10-1;
			System.out.println("pageNo : "+pageNo);
			System.out.println("startPageRn : "+startPageRn);
			System.out.println("endPageRn : "+endPageRn);
			
			pstmt = conn.prepareStatement(query);
	        pstmt.setInt(1, startPageRn);
	        pstmt.setInt(2, endPageRn);
	        rset = pstmt.executeQuery();
	         
	        while(rset.next()) {
	            //Product vo = new Product(rset.getInt("PRODUCT_NUM"), rset.getString("PRODUCT_NAME"));
	        	Product vo=new Product();
	        	vo.setProductNum(rset.getInt("PRODUCT_NUM"));
	        	vo.setProductName(rset.getString("PRODUCT_NAME"));
	        	//private String imgOrigin;
	        	vo.setImgOrigin(rset.getString("IMG_ORIGIN"));
	        	vo.setImgChange(rset.getString("IMG_CHANGE"));
	        	vo.setImgPath(rset.getString("IMG_PATH"));
	            slist.add(vo);
	         }
		}catch(Exception e) {
			e.printStackTrace();
		}
		return slist;
	}
	
	//공간 승인/취소 리스트 총 갯수 가져오기
	public Integer selectProductListCnt(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Integer listCnt=0;
		String query = null;

		query = prop.getProperty("selectProductSpaceApproveListCnt");
		try {
			pstmt = conn.prepareStatement(query);
	        rset = pstmt.executeQuery();
	        while(rset.next()) {
	        	listCnt=rset.getInt("CNT");
	         }
		}catch(Exception e) {
			e.printStackTrace();
		}
		return listCnt;
	}
}