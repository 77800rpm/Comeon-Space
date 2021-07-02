package review.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import common.pageInfo.model.vo.PageInfo;
import img.model.dao.ImgDAO;
import img.model.vo.Img;
import review.model.dao.ReviewDAO;
import review.model.vo.Review;

public class ReviewService {
	public int insertReview(Review review, ArrayList<Img> fileList) {
		Connection conn = getConnection();
		ReviewDAO dao = new ReviewDAO();
		
		int result = dao.insertReview(conn, review);
		
		int resultImg = new ImgDAO().insertReview(conn, fileList);
		
		if(result > 0 && resultImg > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int getListCount(int userNum) {
		Connection conn = getConnection();
		int result = new ReviewDAO().getListCount(conn, userNum);
		close(conn);
		return result;
	}

	public ArrayList<Review> selectReview(int userNum, PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Review> list = new ReviewDAO().selectReview(conn, userNum, pi);
		close(conn);
		return list;
	}

	public ArrayList<Review> detailReview(int no) {
		Connection conn = getConnection();
		ArrayList<Review> list = new ReviewDAO().detailReview(conn, no);
		close(conn);
		return list;
	}

	public int updateAddCount(int rNum) {
		Connection conn = getConnection();
		int result = new ReviewDAO().updateAddCount(conn, rNum);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public int updateDecreaseCount(int rNum) {
		Connection conn = getConnection();
		int result = new ReviewDAO().updateDecreaseCount(conn, rNum);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	
}
