package img.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import img.model.vo.Img;

public class ImgDAO {
	private Properties prop = new Properties();
	
	public ImgDAO() {
		String fileName = ImgDAO.class.getResource("/sql/img/img-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Img selectMember(Connection conn, int userNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Img profileImg = null;
		
		String query = prop.getProperty("selectMember");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userNum);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				profileImg = new Img();
				profileImg.setImgNum(rset.getInt("IMG_NUM"));
				profileImg.setUserNum(rset.getInt("USER_NUM"));
				profileImg.setImgLevel(rset.getInt("IMG_LEVEL"));
				profileImg.setImgCategory(rset.getInt("IMG_CATEGORY"));
				profileImg.setImgOrigin(rset.getString("IMG_ORIGIN"));
				profileImg.setImgChange(rset.getString("IMG_CHANGE"));
				profileImg.setImgPath(rset.getString("IMG_PATH"));
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return profileImg;
	}

	public int insertMyQ(Connection conn, Img img) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertMyQ");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, img.getImgCategory());
			pstmt.setInt(2, img.getUserNum());
			pstmt.setString(3, img.getImgOrigin());
			pstmt.setString(4, img.getImgChange());
			pstmt.setString(5, img.getImgPath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public Img selectMyQ(Connection conn, int bId, int userNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Img img = null;
		
		String query = prop.getProperty("selectMyQ");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userNum);
			pstmt.setInt(2, bId);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				img = new Img();
				img.setImgNum(rset.getInt("IMG_NUM"));
				img.setUserNum(rset.getInt("USER_NUM"));
				img.setImgLevel(rset.getInt("IMG_LEVEL"));
				img.setImgCategory(rset.getInt("IMG_CATEGORY"));
				img.setImgOrigin(rset.getString("IMG_ORIGIN"));
				img.setImgChange(rset.getString("IMG_CHANGE"));
				img.setImgPath(rset.getString("IMG_PATH"));
				img.setImgBoardId(rset.getInt("IMG_BOARDID"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return img;
	}

	public int insertSpace(Connection conn, ArrayList<Img> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertSpace");
		try {
			for(int i = 0; i < fileList.size(); i++) {
				Img img = fileList.get(i);
				
				pstmt = conn.prepareStatement(query);
				
				pstmt.setInt(1, img.getImgLevel());
				pstmt.setInt(2, img.getImgCategory());
				pstmt.setInt(3, img.getUserNum());
				pstmt.setString(4, img.getImgOrigin());
				pstmt.setString(5, img.getImgChange());
				pstmt.setString(6, img.getImgPath());
				
				result += pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int updateProfile(Connection conn, Img img) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateProfile");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, img.getImgOrigin());
			pstmt.setString(2, img.getImgChange());
			pstmt.setInt(3, img.getUserNum());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return result;
	}

	public int insertMember(Connection conn, Img img) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, img.getUserNum());
			pstmt.setString(2, img.getImgOrigin());
			pstmt.setString(3, img.getImgChange());
			pstmt.setString(4, img.getImgPath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}



}
