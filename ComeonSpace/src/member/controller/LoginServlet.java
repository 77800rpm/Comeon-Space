package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userEmail = request.getParameter("userEmail");
		String userPwd = request.getParameter("userPwd");
		
		Member member = new Member(userEmail,userPwd);
			
		Member loginUser = new MemberService().loginMember(member);
		
		if(loginUser != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			session.setMaxInactiveInterval(600);
			
			 //response.sendRedirect(request.getContextPath());
			response.sendRedirect("main.jsp");
/*					
		} else {
			request.setAttribute("alertMsg", "존재하지 않는 회원입니다. 아이디와 비밀번호를 확인해 주세요.");
			request.setAttribute("historyBack", true);
			RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/member/loginAction.jsp");
			view.forward(request, response);
		}
*/	
		} else {
			request.setAttribute("msg", "존재하지 않는 회원입니다. 아이디와 비밀번호를 확인해 주세요.");
			RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/member/loginAction.jsp");
			view.forward(request, response); // request와 response를 새로 만들기 때문에 내가 담아둔 값 유지되지않는다.
		}
		
	}

	
	
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
