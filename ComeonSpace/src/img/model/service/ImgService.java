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



	public Img selectMyQ(int bId, int userNum) {
		Connection conn = getConnection();
		
		Img img = new ImgDAO().selectMyQ(conn, bId, userNum);
		close(conn);
		return img;
	}


}
