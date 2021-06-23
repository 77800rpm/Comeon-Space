package mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import img.model.service.ImgService;
import img.model.vo.Img;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MypageMainServlet
 */
@WebServlet("/MypageMainServlet")
public class MypageMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userEmail = ((Member)session.getAttribute("loginUser")).getUserEmail();
		int userNum = ((Member)session.getAttribute("loginUser")).getUserNum();
		
		Member profile = new MemberService().selectMember(userEmail);
		Img img = new ImgService().selectMember(userNum);
		
		request.setAttribute("profile", profile);
		request.setAttribute("img", img);
		request.getRequestDispatcher("WEB-INF/views/mypage,mypageMain.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}