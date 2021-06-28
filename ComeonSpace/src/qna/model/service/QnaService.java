package qna.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import qna.model.dao.QnaDAO;
import qna.model.vo.Qna;

public class QnaService {

	public ArrayList<Qna> insertQna(Qna q) {
		Connection conn = getConnection();
		ArrayList<Qna> list = null;
		QnaDAO dao = new QnaDAO();
		
		int result = dao.insertQna(conn, q);
		if(result > 0) {
			commit(conn);
			list = dao.selectQna(conn, q);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return list;
	}

	public ArrayList<Qna> selectQna(int no) {
		Connection conn = getConnection();
		ArrayList<Qna> list = new QnaDAO().selectQna(conn, no);
		
		close(conn);
		return list;
	}

	public ArrayList<Qna> selectAllQna(int hostNum) {
		Connection conn = getConnection();
		ArrayList<Qna> list = new QnaDAO().selectAllQna(conn, hostNum);
		close(conn);
		
		return list;
	}


}
