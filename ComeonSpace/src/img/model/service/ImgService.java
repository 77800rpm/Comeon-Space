package img.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

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

}
