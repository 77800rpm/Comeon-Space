package mypage.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.pageInfo.model.vo.PageInfo;
import member.model.vo.Member;
import order.model.service.OrderService;
import order.model.vo.Order;
import review.model.service.ReviewService;
import review.model.vo.Review;

/**
 * Servlet implementation class MypageOrderListServlet
 */
@WebServlet("/orderList.my")
public class MypageOrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageOrderListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userName = ((Member)session.getAttribute("loginUser")).getUserName();
		
		int currentPage;
		int listCount;
		int startPage;
		int endPage;
		int maxPage;
		int boardLimit;
		int pageLimit;
		
		listCount = new OrderService().getGuestListCount(userName);
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
		
			
		
		ArrayList<Order> list = new OrderService().selectList(userName, pi);
		
		ArrayList<Review> rList = new ReviewService().selectList(userName, pi);
		



        // 오늘 날짜
		long miliseconds = System.currentTimeMillis();
        Date today = new Date(miliseconds);

        
        
        String compare = "";

        ArrayList<String> compareList = new ArrayList<String>();
        
		for(int i = 0; i <list.size(); i++) {
			
			compare = Integer.toString(today.compareTo(list.get(i).getRevDate()));
			
			System.out.println(list.get(i).getRevDate() + "와 오늘을 비교한 반환값 : " + compare);
			
			compareList.add(compare);
		}		
        
		int count1 = Collections.frequency(list, "1");
		int count2 = Collections.frequency(list, "0");
		int count3 = Collections.frequency(list, "-1");
		
		System.out.println("1의 개수 : " + count1 + "0의 개수 : " + count2 + "-1의 개수 : " + count3);


//		System.out.println(compareList);
		
//		System.out.println(compareList.get(0));
//		System.out.println(compareList.get(1));
//		System.out.println(compareList.get(2));
		
		String page = null;
		
		if(list != null) {
			page = "WEB-INF/views/mypage/myPageOrderList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("rList", rList);
			request.setAttribute("compareList", compareList);
			request.setAttribute("pi", pi);
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "마이페이지 조회에 실패하였습니다.");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
