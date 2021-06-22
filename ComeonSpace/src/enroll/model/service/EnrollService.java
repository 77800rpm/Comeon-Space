package enroll.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import enroll.model.dao.EnrollDAO;
import enroll.model.vo.Enroll;
import img.model.dao.ImgDAO;
import img.model.vo.Img;

public class EnrollService {

	public int insertSpace(Enroll en, ArrayList<Img> fileList) {
		Connection conn = getConnection();
		
		int result = new EnrollDAO().insertSpace(conn, en);
		
		int resultImg = new ImgDAO().insertSpace(conn, fileList);
		
		if(result > 0 && resultImg > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	
}
