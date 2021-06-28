package qna.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import qna.model.service.QnaService;
import qna.model.vo.Qna;

/**
 * Servlet implementation class QnaListServlet
 */
@WebServlet("/qnaList.my")
public class QnaListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int hostNum = ((Member)session.getAttribute("loginUser")).getUserNum();
		
		ArrayList<Qna> hostList = new QnaService().selectAllQna(hostNum);
		ArrayList<Qna> userList = new QnaService().selectUserQna(hostNum);
		
		request.setAttribute("userList", userList);
		request.setAttribute("hostList", hostList);
		request.getRequestDispatcher("WEB-INF/views/mypage/mypageQna.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
