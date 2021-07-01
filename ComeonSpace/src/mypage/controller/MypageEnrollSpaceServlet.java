package mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.pageInfo.model.vo.PageInfo;
import enroll.model.vo.Enroll;
import img.model.service.ImgService;
import img.model.vo.Img;
import member.model.vo.Member;
import product.model.service.ProductService;

/**
 * Servlet implementation class MypageEnrollSpaceServlet
 */
@WebServlet("/enrollSpace.my")
public class MypageEnrollSpaceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageEnrollSpaceServlet() {
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
		int maxPage;
		int startPage;
		int endPage;
		
		listCount = new ProductService().getListCount(userNum);
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		boardLimit = 10;
		pageLimit = 10;
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = ((currentPage -1) / pageLimit) * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		
		ArrayList<Enroll> list = new ProductService().selectEnroll(userNum, pi);
		ArrayList<Img> imgList = new ImgService().selectEnroll(userNum);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("imgList", imgList);
		
		request.getRequestDispatcher("WEB-INF/views/mypage/mypageEnrollSpace.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
