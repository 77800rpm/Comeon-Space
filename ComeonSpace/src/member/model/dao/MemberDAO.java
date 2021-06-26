package member.model.dao;

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

import common.wrapper.SignUpWrapper;
import img.model.vo.Img;
import member.model.vo.Member;

public class MemberDAO {
	
	private Properties prop = new Properties();
	
	public MemberDAO() {
		String fileName = MemberDAO.class.getResource("/sql/member/member-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int checkEmail(Connection conn, String inputEmail) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("checkEmail");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, inputEmail);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return result;
	}

	public int checkNick(Connection conn, String inputNickName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("checkNick");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, inputNickName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
				
		}
		
		return result;
	}

	public int insertMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertMember");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUserEmail());
			pstmt.setString(2, member.getUserPwd());
			pstmt.setString(3, member.getUserName());
			pstmt.setString(4, member.getUserNic());
			pstmt.setString(5, member.getUserPhone());
			pstmt.setString(6, member.getUserDiv());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Member loginMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser = null;
		
	
		String query = prop.getProperty("loginMember");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUserEmail());
			pstmt.setString(2, member.getUserPwd());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new Member(rset.getInt("USER_NUM"),
									   rset.getString("USER_EMAIL"),
									   rset.getString("USER_PWD"),
									   rset.getString("USER_NAME"),
									   rset.getString("USER_NIC"),
									   rset.getString("USER_PHONE"),
									   rset.getDate("USER_CREATE"),
									   rset.getString("USER_DIV"),
									   rset.getString("USER_STATUS"));
				
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return loginUser;
	}

	public int insertHostImg(Connection conn, ArrayList<Img> list) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertHostImg");
		
		try {
			for(int i = 0; i < 2; i++) {
				Img img = list.get(i);
				pstmt = conn.prepareStatement(query);
				
				pstmt.setInt(1, img.getImgLevel());
				pstmt.setString(2, img.getImgOrigin());
				pstmt.setString(3, img.getImgChange());
				pstmt.setString(4, img.getImgPath());
			
				result += pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}
	
	// 관리자페이지 - 회원조회관리
	public ArrayList<Member> adminSelectUser(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Member> selectUser = null;
		
		String query = prop.getProperty("adminSelectUser");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			selectUser = new ArrayList<Member>();
			while(rset.next()) {
				Member m = new Member(rset.getString("USER_EMAIL"),
									   rset.getString("USER_NAME"),
									   rset.getString("USER_NIC"),
									   rset.getString("USER_PHONE"));
				selectUser.add(m);
			} 
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return selectUser;
	}


	public Member selectMember(Connection conn, String userEmail) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member profile = null;
		
		String query = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userEmail);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				profile = new Member();
				profile.setUserName(rset.getString("USER_NAME"));
				profile.setUserNic(rset.getString("USER_NIC"));
				profile.setUserDiv(rset.getString("USER_DIV"));
				profile.setUserPwd(rset.getString("USER_PWD"));
				profile.setUserPhone(rset.getString("USER_PHONE"));
				profile.setUserEmail(rset.getString("USER_EMAIL"));
				profile.setUserNum(rset.getInt("USER_NUM"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}				
		
		
		return profile;
	}

	public int deleteMember(Connection conn, int userNum) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userNum);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int checkPwd(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		SignUpWrapper su = new SignUpWrapper();
		String pwd = su.wrapper(m.getUserPwd());
		
		String query = prop.getProperty("checkPwd");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, m.getUserNum());
			pstmt.setString(2, pwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return result;
	}

	
}
