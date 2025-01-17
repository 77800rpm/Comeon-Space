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

import common.pageInfo.model.vo.PageInfo;
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
			
	public ArrayList<Enroll> selectList(String productLocation, String productCategory, String productHoliday, Connection conn) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Enroll> slist = new ArrayList<Enroll>();
		String query = null;

		
		if(productCategory.equals("모든공간")) {
			query = prop.getProperty("selectSearchCategoryAll");
			try {
				pstmt = conn.prepareStatement(query);
		        pstmt.setString(1, "%"+productLocation+"%");
		        pstmt.setString(2, "%"+productHoliday+"%");
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
		         pstmt.setString(1, "%"+productLocation+"%");
		         pstmt.setString(2, "%"+productCategory+"%");
		         pstmt.setString(3, "%"+productHoliday+"%");
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
//			System.out.println("pageNo : "+pageNo);
//			System.out.println("startPageRn : "+startPageRn);
//			System.out.println("endPageRn : "+endPageRn);
			
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
	
	//공간 승인/취소 상세정보 가져오기
	public Product selectProductDetail(Integer productNum, Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Product product = null;
		String query = prop.getProperty("selectProductSpaceApproveDetail");
		try {
			pstmt = conn.prepareStatement(query);
	        pstmt.setInt(1, productNum);
	        rset = pstmt.executeQuery();
	         
	        while(rset.next()) {
	        	product=new Product();
	        	//공간 정보
	        	product.setProductNum(rset.getInt("product_num"));
	        	product.setProductName(rset.getString("product_name"));
	        	product.setProductLimit(rset.getInt("product_limit"));
	        	product.setProductPrice(rset.getInt("product_price"));
	        	product.setProductCategory(rset.getString("product_category"));
	        	product.setProductIntro(rset.getString("product_intro"));
	        	product.setProductDetail(rset.getString("Product_detail"));
	        	product.setProductLocation(rset.getString("product_location"));
	        	product.setProductFac(rset.getString("product_fac"));
	        	product.setProductCount(rset.getInt("product_count"));
	        	product.setProductHoliday(rset.getString("product_holiday"));
	        	product.setUserNum(rset.getInt("USER_NUM"));
	        	//썸네일 정보
	        	product.setImgChange(rset.getString("IMG_CHANGE"));
	         }
	        
	        System.out.println("DB에서 가져온 PRODUCT : "+product);
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return product;
	}
	
	
	//공간 승인/취소 상세정보 이미지 리스트 가져오기
	public ArrayList<Img> selectProductImgList(Integer productNum, Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Img> slist = new ArrayList<Img>();
		String query = null;

		query = prop.getProperty("selectProductImgList");
		try {
			pstmt = conn.prepareStatement(query);
	        pstmt.setInt(1, productNum);
	        rset = pstmt.executeQuery();
	         
	        while(rset.next()) {
	        	Img vo=new Img();
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

	public ArrayList<Enroll> selectEnroll(Connection conn, int userNum, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Enroll> list = new ArrayList<Enroll>();
		Enroll en = null;
		
		int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getPageLimit() - 1;
		
		String query = prop.getProperty("selectEnroll");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userNum);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				en = new Enroll();
				en.setpNum(rset.getInt("PRODUCT_NUM"));
				en.setpName(rset.getString("PRODUCT_NAME"));
				en.setProductPrice(rset.getInt("PRODUCT_PRICE"));
				en.setpCategory(rset.getString("PRODUCT_CATEGORY"));
				en.setpIntro(rset.getString("PRODUCT_INTRO"));
				en.setpDetail(rset.getString("PRODUCT_DETAIL"));
				en.setpLocation(rset.getString("PRODUCT_LOCATION"));
				en.setpFacility(rset.getString("PRODUCT_FAC"));
				en.setUserNum(rset.getInt("USER_NUM"));
				en.setpLimit(rset.getInt("PRODUCT_LIMIT"));
				en.setHoliday(rset.getString("PRODUCT_HOLIDAY"));
				
				list.add(en);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
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

	//공간 승인 처리
	public Integer updateProductApproveSuccess(Integer productNum, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateProductSpaceApprove");	
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, productNum);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	//공간 삭제 처리
	public Integer updateProductSpaceDelete(Integer productNum, Connection conn){
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateProductSpaceDelete");	
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, productNum);
			result = pstmt.executeUpdate();
			System.out.println("삭제 여부 :"+result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


	public ArrayList<Enroll> selectTop3(Connection conn, int[] top3) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Enroll> topList = new ArrayList<Enroll>();
		Enroll en = null;
		
		String query = prop.getProperty("selectTop3");
		
		for(int i = 0; i < top3.length; i++) {
			if(top3[i] != 0) {
				try {
					pstmt = conn.prepareStatement(query);
					pstmt.setInt(1, top3[i]);
					
					rset = pstmt.executeQuery();
					if(rset.next()) {
						en = new Enroll();
						en.setpNum(rset.getInt("PRODUCT_NUM"));
						en.setpName(rset.getString("PRODUCT_NAME"));
						en.setProductPrice(rset.getInt("PRODUCT_PRICE"));
						en.setpCategory(rset.getString("PRODUCT_CATEGORY"));
						en.setpIntro(rset.getString("PRODUCT_INTRO"));
						en.setpDetail(rset.getString("PRODUCT_DETAIL"));
						en.setpLocation(rset.getString("PRODUCT_LOCATION"));
						en.setpFacility(rset.getString("PRODUCT_FAC"));
						en.setUserNum(rset.getInt("USER_NUM"));
						en.setpLimit(rset.getInt("PRODUCT_LIMIT"));
						en.setHoliday(rset.getString("PRODUCT_HOLIDAY"));
						
						topList.add(en);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					close(rset);
					close(pstmt);
				}
				
			}
			
		}
		
		return topList;
	}
}