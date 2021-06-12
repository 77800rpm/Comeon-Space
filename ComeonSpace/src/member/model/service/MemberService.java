package member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;

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

	public int insertMember(Member member) {
		Connection conn = getConnection();
		
		int result = new MemberDAO().insertMember(conn, member);
		
		return result;
	}

	public Member loginMember(Member member) {
		
		Connection conn = getConnection();

		Member loginUser = new MemberDAO().loginMember(conn, member);
		
		close(conn);
		
		return loginUser;
		
	}



	
	

}
