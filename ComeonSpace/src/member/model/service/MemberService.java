package member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import img.model.vo.Img;
import member.model.dao.MemberDAO;
import member.model.vo.Member;

public class MemberService {

	public int checkEmail(String inputEmail) {
		Connection conn = getConnection();
		
		int result = new MemberDAO().checkEmail(conn, inputEmail);
		close(conn);
		return result;
	}

	public int checkNick(String inputNickName) {
		Connection conn = getConnection();
		
		int result = new MemberDAO().checkNick(conn, inputNickName);
		close(conn);
		
		return result;
	}

	public int insertMember(Member member, ArrayList<Img> list) {
		Connection conn = getConnection();
		
		MemberDAO dao = new MemberDAO();
		int result = dao.insertMember(conn, member);
		int imgResult = 0;
		if(!list.isEmpty()) {
			imgResult = dao.insertHostImg(conn, list);
			
			if(imgResult > 0 && result > 0) {
				commit(conn);
				return result;
			} else {
				rollback(conn);
				return 0;
			}
		} else {
			if(result > 0) {
				commit(conn);
				return result;
			} else {
				rollback(conn);
				return 0;
			}
		}
		
		
	}
	public Member loginMember(Member member) {
		
		Connection conn = getConnection();

		Member loginUser = new MemberDAO().loginMember(conn, member);
		
		close(conn);
		
		return loginUser;
		
	}
	
	// 관리자페이지 - 회원조회관리
	public ArrayList<Member> adminSelectUser() {
		Connection conn = getConnection();
		
		ArrayList<Member> selectUser = new MemberDAO().adminSelectUser(conn);
		
		close(conn);
		
		return selectUser;
	}

	public Member selectMember(String userEmail) {
		Connection conn = getConnection();
		
		Member profile = new MemberDAO().selectMember(conn, userEmail);
		
		close(conn);
		
		return profile;
	}

	public int deleteMember(int userNum) {
		Connection conn = getConnection();
		
		int result = new MemberDAO().deleteMember(conn, userNum);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		// 관련 이미지 삭제도 추가해야함
		close(conn);
		
		return result;
	}

	public int checkPwd(Member m) {
		Connection conn = getConnection();
		
		int result = new MemberDAO().checkPwd(conn, m);
		
		close(conn);
		return result;
	}

	public int updateProfile(Member member, String insertPwd) {
		Connection conn = getConnection();
		
		int result = new MemberDAO().updateProfile(conn, member, insertPwd);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}



	
	

}
