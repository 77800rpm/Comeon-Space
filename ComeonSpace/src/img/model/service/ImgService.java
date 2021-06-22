package img.model.service;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import img.model.dao.ImgDAO;
import img.model.vo.Img;

public class ImgService {

	public Img selectMember(int userNum) {
		Connection conn = getConnection();
		
		Img profileImg = new ImgDAO().selectMember(conn, userNum);
		
		close(conn);
		return profileImg;
	}

	public int insertMyQ(Img img) {
		Connection conn = getConnection();
		
		int result = new ImgDAO().insertMyQ(conn, img);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public Img selectMyQ(int bId, int userNum) {
		Connection conn = getConnection();
		
		Img img = new ImgDAO().selectMyQ(conn, bId, userNum);
		close(conn);
		return img;
	}

//	public int insertSpace(ArrayList<Img> fileList) {
//		Connection conn = getConnection();
//		
//		int result = new ImgDAO().insertSpace(conn, fileList); 
//		if(result > 0) {
//			commit(conn);
//		} else {
//			rollback(conn);
//		}
//		close(conn);
//		
//		return result;
//	}

}
