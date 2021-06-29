package qna.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.pageInfo.model.vo.PageInfo;
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
		
		int currentPage;
		int listCount;
		int maxPage;
		int boardLimit;
		int pageLimit;
		int startPage;
		int endPage;
		
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		boardLimit = 10;
		pageLimit = 10;
		
		if(((Member)session.getAttribute("loginUser")).getUserDiv().equals("guest")) {
			listCount = new QnaService().selectUserListCount(hostNum);
		} else {
			listCount = new QnaService().selectHostListCount(hostNum);
		}
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = ((currentPage - 1)/pageLimit) * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
				
		ArrayList<Qna> hostList = null;
		ArrayList<Qna> userList = null;
		
		if(((Member)session.getAttribute("loginUser")).getUserDiv().equals("guest")) {
			userList = new QnaService().selectUserQna(hostNum,pi);
			request.setAttribute("userList", userList);
		} else {
			hostList = new QnaService().selectAllQna(hostNum,pi);
			request.setAttribute("hostList", hostList);
		}
		request.setAttribute("pi", pi);
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
