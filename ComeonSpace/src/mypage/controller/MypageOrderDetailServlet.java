package mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import order.model.service.OrderService;
import order.model.vo.Order;

/**
 * Servlet implementation class MypageOrderDetailServlet
 */
@WebServlet("/orderDetail.my")
public class MypageOrderDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageOrderDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		
		Order order = new OrderService().selectOrderDetail(no);
		
		if(order != null) {
			request.setAttribute("order", order);
			request.getRequestDispatcher("WEB-INF/views/mypage/mypageOrderDetail.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "판매내역 상세조회에 실패하였습니다.");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
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
