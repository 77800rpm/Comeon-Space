package img.model.service;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import common.pageInfo.model.vo.PageInfo;
import enroll.model.vo.Enroll;
import img.model.dao.ImgDAO;
import img.model.vo.Img;
import review.model.vo.Review;

public class ImgService {

	public Img selectMember(int userNum) {
		Connection conn = getConnection();
		
		Img profileImg = new ImgDAO().selectMember(conn, userNum);
		
		close(conn);
		return profileImg;
	}



	public Img selectMyQ(int bId, int userNum) {
		Connection conn = getConnection();
		
		Img img = new ImgDAO().selectMyQ(conn, bId, userNum);
		close(conn);
		return img;
	}



	public int updateProfile(Img img) {
		Connection conn = getConnection();
		
		int result = new ImgDAO().updateProfile(conn, img);
		
		if(result > 0) {
			commit(conn);
			close(conn);
			return result;
		} else {
			rollback(conn);
			
			int resultImg = new ImgDAO().insertMember(conn, img);
			
			if(resultImg >0) {
				commit(conn);
				close(conn);
				return resultImg;
			} else {
				rollback(conn);
				close(conn);
				return resultImg;
			}
		}
		
	}



	public ArrayList<Img> selectEnroll(int userNum) {
		Connection conn = getConnection();
		ArrayList<Img> imgList = new ImgDAO().selectEnroll(conn, userNum);
		close(conn);
		return imgList;
	}



	public ArrayList<Img> selectEnroll(ArrayList<Enroll> topList) {
		Connection conn = getConnection();
		ArrayList<Img> topImg = new ImgDAO().selectEnroll(conn, topList);
		close(conn);
		return topImg;
	}



	public ArrayList<Img> selectReview(int userNum, ArrayList<Review> re) {
		Connection conn = getConnection();
		ArrayList<Img> img = new ImgDAO().selectReview(conn, userNum, re);
		close(conn);
		
		return img;
	}



	public ArrayList<Img> detailReview(ArrayList<Review> reList) {
		Connection conn = getConnection();
		ArrayList<Img> list = new ImgDAO().detailReview(conn, reList);
		close(conn);
		return list;
	}



	public Img selectTop(Review review) {
		Connection conn = getConnection();
		Img img = new ImgDAO().selectTop(conn,review);
		close(conn);
		return img;
	}



}
