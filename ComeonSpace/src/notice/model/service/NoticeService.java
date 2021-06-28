package notice.model.service;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import notice.model.dao.NoticeDAO;
import notice.model.vo.Notice;

public class NoticeService {
	
	public ArrayList<Notice> selectNotice() {
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDAO().selectNotice(conn);
		
		close(conn);
		
		return list;
	}

	public int insertNotice(Notice no) {
		Connection conn = getConnection();
		
		int result = new NoticeDAO().insertNotice(conn, no);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public Notice detailNotice(int num) {
		Connection conn = getConnection();
		
		Notice no = new NoticeDAO().detailNotice(conn, num);
		
		close(conn);
		
		return no;
	}

	public int updateNotice(Notice no) {
		Connection conn = getConnection();
		
		int result = new NoticeDAO().updateNotice(conn, no);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		} 
		close(conn);
		
		return result;
	}

	public int deleteNotice(int num) {
		Connection conn = getConnection();
		
		int result = new NoticeDAO().deleteNotice(conn, num);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	//관리자 공지사항 
	public ArrayList<Notice> admselectList() {
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDAO().admselectNotice(conn);
		
		close(conn);
		
		return list;
	}

	public int getListCount() {
		Connection conn = getConnection();
		int result = new NoticeDAO().getListCount(conn);
		close(conn);
		return result;
	}



}
