package center.myQ.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import center.myQ.model.dao.MyQuestionDAO;
import center.myQ.model.vo.MyQuestion;

public class MyQuestionService {

	public int insertQuestion(MyQuestion myQ) {
		Connection conn = getConnection();
		
		int result = new MyQuestionDAO().insertQuestion(conn, myQ);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public ArrayList<MyQuestion> selectMyQ(int userNum) {
		Connection conn = getConnection();
		ArrayList<MyQuestion> list = new MyQuestionDAO().selectMyQ(conn, userNum);
		
		close(conn);
		
		return list;
	}

	public MyQuestion detailMyQuestion(int bId) {
		Connection conn = getConnection();
		MyQuestion my = new MyQuestionDAO().detailMyQuestion(conn, bId);
		close(conn);
		
		return my;
	}



}
