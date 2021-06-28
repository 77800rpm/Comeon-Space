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
import notice.model.dao.NoticeDAO;
import notice.model.vo.Notice;

public class FaqService {

	public ArrayList<Faq> faqSelect() {
		Connection conn = getConnection();
		ArrayList<Faq> selectBoard = new FaqDAO().faqSelect(conn);
		close(conn);
		
		return selectBoard;
	}


	public int admInsertFaq(Faq fo) {
		Connection conn = getConnection();
		
		int result = new FaqDAO().admInsertFaq(conn, fo);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}


	public Faq admDetailFaq(int bId) {
		Connection conn = getConnection();
		
		Faq fo = new FaqDAO().admDetailFaq(conn, bId);
		
		close(conn);
		
		return fo;
	}


	public int admDeleteFaq(int bId) {
		Connection conn = getConnection();
		
		int result = new FaqDAO().admDeleteFaq(conn, bId);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

}
