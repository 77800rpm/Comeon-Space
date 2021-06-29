package center.myQ.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import center.myQ.model.dao.MyQuestionDAO;
import center.myQ.model.vo.MyQuestion;
import common.pageInfo.model.vo.PageInfo;
import img.model.dao.ImgDAO;
import img.model.vo.Img;

public class MyQuestionService {

	public int insertQuestion(MyQuestion myQ, Img img) {
		Connection conn = getConnection();
		int result = 0;
		int resultMyQ = new MyQuestionDAO().insertQuestion(conn, myQ);
		
		int resultImg = 0;
		if(img != null) {
			
			resultImg = new ImgDAO().insertMyQ(conn, img);
			
			if(resultMyQ > 0 && resultImg > 0) {
				commit(conn);
				result = resultImg + resultMyQ;
			} else {
				rollback(conn);
			} 
		} else {
			if(resultMyQ > 0) {
				commit(conn);
				result = resultMyQ;
			} else {
				rollback(conn);
			}
		}
		close(conn);
		
		return result;
	}

	public ArrayList<MyQuestion> selectMyQ(int userNum, PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<MyQuestion> list = new MyQuestionDAO().selectMyQ(conn, userNum, pi);
		
		close(conn);
		
		return list;
	}

	public MyQuestion detailMyQuestion(int bId) {
		Connection conn = getConnection();
		MyQuestion my = new MyQuestionDAO().detailMyQuestion(conn, bId);
		close(conn);
		
		return my;
	}

	public int selectListCount(int userNum) {
		Connection conn = getConnection();
		int result = new MyQuestionDAO().selectListCount(userNum, conn);
		close(conn);
		
		return result;
	}



}
