package enroll.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.pageInfo.model.vo.PageInfo;
import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class EnrollMainServlet
 */
@WebServlet("/enrollMain.en")
public class EnrollMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnrollMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage;
		int listCount;
		int maxPage;
		int boardLimit;
		int pageLimit;
		int startPage;
		int endPage;
		
		listCount = new NoticeService().getListCount();
		
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
		
		ArrayList<Notice> list = new NoticeService().selectNotice(pi);
		request.setAttribute("list", list);
		request.getRequestDispatcher("WEB-INF/views/enroll/enrollMain.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
