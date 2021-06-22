package faq.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.close;
import java.sql.Connection;
import java.util.ArrayList;

import faq.model.dao.FaqDAO;
import faq.model.vo.Faq;

public class FaqService {

	public ArrayList<Faq> faqSelect() {
		Connection conn = getConnection();
		ArrayList<Faq> selectBoard = new FaqDAO().faqSelect(conn);
		close(conn);
		
		return selectBoard;
	}

	public int insertBoard(Faq f) {
		Connection conn = getConnection();
		
		int result = new FaqDAO().insertBoard(conn, f);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
}
