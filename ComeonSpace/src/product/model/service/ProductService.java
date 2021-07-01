package product.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import common.pageInfo.model.vo.PageInfo;
import enroll.model.vo.Enroll;
import img.model.vo.Img;
import product.model.dao.ProductDAO;
import product.model.vo.Product;

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
		
		int result = new ProductDAO().updateCount(conn, no);
		
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

	public ArrayList<Img> selectThumbnail(int no) {
		Connection conn = getConnection();
		
		ArrayList<Img> list = new ProductDAO().selectThumbnail(conn, no);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Enroll> selectCategory(String category) {
		Connection conn = getConnection();
		
		ArrayList<Enroll> list = new ProductDAO().selectCategory(conn, category);
		
		close(conn);
		return list;
	}

	public ArrayList<Enroll> mainCategory() {
		Connection conn = getConnection();
		
		ArrayList<Enroll> list = new ProductDAO().mainCategory(conn);
		
		return list;
	}
	
	public ArrayList<Enroll> selectList(String PRODUCT_LOCATION, String PRODUCT_CATEGORY, String PRODUCT_HOLIDAY) {
		
		Connection conn = getConnection();
		
		ArrayList<Enroll> slist = new ProductDAO().selectList(PRODUCT_LOCATION, PRODUCT_CATEGORY, PRODUCT_HOLIDAY, conn);
		
		close(conn);
		
		return slist;
	}
	
	public ArrayList<Product> selectProductList(Integer pageNo){
		Connection conn=getConnection();
		ArrayList<Product> resultList=new ProductDAO().selectProductList(pageNo, conn);
		close(conn);
		return resultList;
	}
	
	public Integer selectProductListCnt(){
		Connection conn=getConnection();
		Integer resultCnt=new ProductDAO().selectProductListCnt(conn);
		close(conn);
		return resultCnt;
	}
	
	public Product selectProductDetail(Integer productNum){
		Connection conn=getConnection();
		Product product=new ProductDAO().selectProductDetail(productNum, conn);
		close(conn);
		return product;
	}
	
	public ArrayList<Img> selectProductImgList(Integer productNum){
		Connection conn=getConnection();
		ArrayList<Img> productImgList=new ProductDAO().selectProductImgList(productNum, conn);
		close(conn);
		return productImgList;
	}

	public ArrayList<Enroll> selectEnroll(int userNum, PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Enroll> list = new ProductDAO().selectEnroll(conn, userNum, pi);
		close(conn);
		return list;
	}

	public int getListCount(int userNum) {
		Connection conn = getConnection();
		int result = new ProductDAO().getListCount(conn, userNum);
		close(conn);
		
		return result;
	}

	
	public Integer updateProductApproveSuccess(Integer productNum){
		Connection conn = getConnection();
		Integer successCnt=new ProductDAO().updateProductApproveSuccess(productNum, conn);
		close(conn);
		return successCnt;
	}
	
	public Integer updateProductSpaceDelete(Integer productNum){
		Connection conn = getConnection();
		Integer deleteCnt=new ProductDAO().updateProductSpaceDelete(productNum, conn);
		close(conn);
		return deleteCnt;
	}
}
