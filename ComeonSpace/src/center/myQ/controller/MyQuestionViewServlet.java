package center.myQ.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import center.myQ.model.service.MyQuestionService;
import center.myQ.model.vo.MyQuestion;
import common.pageInfo.model.vo.PageInfo;
import member.model.vo.Member;

/**
 * Servlet implementation class MyQuestionViewServlet
 */
@WebServlet("/myQView.ce")
public class MyQuestionViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyQuestionViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int userNum = 0;
		
		if(((Member)session.getAttribute("loginUser")) != null) {
			userNum = ((Member)session.getAttribute("loginUser")).getUserNum();
		}
		
		int currentPage;
		int listCount;
		int maxPage;
		int startPage;
		int endPage;
		int pageLimit;
		int boardLimit;
		
		listCount = new MyQuestionService().selectListCount(userNum);
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		boardLimit = 10;
		pageLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		startPage = ((currentPage -1)/pageLimit) * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		
		ArrayList<MyQuestion> list = new MyQuestionService().selectMyQ(userNum, pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.getRequestDispatcher("WEB-INF/views/center/myQView.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
