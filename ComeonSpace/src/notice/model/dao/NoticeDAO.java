package notice.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import common.pageInfo.model.vo.PageInfo;
import notice.model.vo.Notice;

public class NoticeDAO {
	private Properties prop = new Properties();
	
	public NoticeDAO() {
		String fileName = NoticeDAO.class.getResource("/sql/notice/notice.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Notice> selectNotice(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Notice> list = new ArrayList<Notice>();
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		String query = prop.getProperty("selectNotice");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Notice no = new Notice(rset.getInt("BOARDNOTICE_NUM"),
						rset.getString("BOARDNOTICE_TITLE"),
						rset.getString("BOARDNOTICE_CONTENT"),
						rset.getString("BOARDNOTICE_CATEGORY"),
						rset.getInt("ADM_NUM"),
						rset.getDate("BOARDNOTICE_DATE"));
				no.setnWriter(rset.getString("BOARDNOTICE_WRITER"));
				
				list.add(no);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int insertNotice(Connection conn, Notice no) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertNotice");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, no.getnTitle());
			pstmt.setString(2, no.getnContent());
			pstmt.setString(3, no.getnCategory());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Notice detailNotice(Connection conn, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Notice no = null;
		
		String query = prop.getProperty("admDetailNotice");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				no = new Notice(rset.getString("BOARDNOTICE_TITLE"),
								rset.getString("BOARDNOTICE_CONTENT"),
								rset.getDate("BOARDNOTICE_DATE"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return no;
	}

	public int updateNotice(Connection conn, Notice no) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateNotice");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, no.getnTitle());
			pstmt.setString(2, no.getnContent());
			pstmt.setString(3, no.getnCategory());
			pstmt.setInt(4, no.getnNum());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int deleteNotice(Connection conn, int num) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteNotice");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	// 관리자 페이지 공지사항 
	public ArrayList<Notice> admselectNotice(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Notice> list = new ArrayList<Notice>();
		
		String query = prop.getProperty("admSelectNotice");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Notice no = new Notice(rset.getInt("BOARDNOTICE_NUM"),
						rset.getString("BOARDNOTICE_TITLE"),
						rset.getDate("BOARDNOTICE_DATE"),
						rset.getString("ADM_NAME"));
				
				list.add(no);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("selectListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return result;
	}
	public int admInsertNotice(Connection conn, Notice n) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("admInsertNotice");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, n.getnTitle());
			pstmt.setString(2, n.getnContent());
			pstmt.setString(3, n.getAdmName());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Notice admDetailNotice(Connection conn, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Notice no = null;
		
		String query = prop.getProperty("admDetailNotice");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				no = new Notice();
				no.setnNum(rset.getInt("BOARDNOTICE_NUM"));
				no.setnTitle(rset.getString("BOARDNOTICE_TITLE"));
				no.setnContent(rset.getString("BOARDNOTICE_CONTENT"));
				no.setDate(rset.getDate("BOARDNOTICE_DATE"));
				no.setAdmName(rset.getString("ADM_NAME"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return no;
	}

	public int admDeleteNotice(Connection conn, int num) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("admDeleteNotice");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
