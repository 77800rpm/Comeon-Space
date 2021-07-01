package review.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;

import review.model.dao.ReviewDAO;
import review.model.vo.Review;

public class ReviewService {
	public int insertReview(Review review) {
		Connection conn = getConnection();
		ReviewDAO dao = new ReviewDAO();
		
		int result = dao.insertReview(conn, review);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
}
