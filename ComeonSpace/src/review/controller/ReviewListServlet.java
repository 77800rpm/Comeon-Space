package review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.pageInfo.model.vo.PageInfo;
import img.model.service.ImgService;
import img.model.vo.Img;
import member.model.vo.Member;
import review.model.service.ReviewService;
import review.model.vo.Review;

/**
 * Servlet implementation class ReviewListServlet
 */
@WebServlet("/reviewList.my")
public class ReviewListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int userNum = 0;
		if((Member)session.getAttribute("loginUser") != null) {
			userNum = ((Member)session.getAttribute("loginUser")).getUserNum();
		}
		
		int currentPage;
		int listCount;
		int boardLimit;
		int pageLimit;
		int endPage;
		int startPage;
		int maxPage;
		
		listCount = new ReviewService().getListCount(userNum);
		
		boardLimit = 3;
		pageLimit = 5;
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		maxPage = (int)Math.ceil((double)listCount / boardLimit);		
		
		startPage = ((currentPage -1)/ pageLimit) * pageLimit + 1;
		endPage = startPage + pageLimit -1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Review> re = new ReviewService().selectReview(userNum, pi);
		ArrayList<Img> img = new ImgService().selectReview(userNum, re);
		
		request.setAttribute("pi", pi);
		request.setAttribute("re", re);
		request.setAttribute("img", img);
		
		request.getRequestDispatcher("WEB-INF/views/mypage/mypageReview.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
