package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import order.model.service.OrderService;
import order.model.vo.Order;

/**
 * Servlet implementation class RealPayServlet
 */
@WebServlet(urlPatterns="/realPay.me", name="RealPayServlet")
public class RealPayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RealPayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String prodName = request.getParameter("prodName");
		String buyerEmail = request.getParameter("buyerEmail");
		String buyerName = request.getParameter("buyerName");
		String buyerPhone = request.getParameter("buyerPhone");
		String revDate = request.getParameter("revDate");
		int prodNum = Integer.parseInt(request.getParameter("prodNum"));
		int hostNum = Integer.parseInt(request.getParameter("hostNum"));
		
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		
		request.setAttribute("prodName", prodName);
		request.setAttribute("buyerEmail", buyerEmail);
		request.setAttribute("buyerName", buyerName);
		request.setAttribute("buyerPhone", buyerPhone);
		request.setAttribute("prodNum", prodNum);
		request.setAttribute("hostNum", hostNum);
		request.setAttribute("totalPrice", totalPrice);
		request.setAttribute("revDate", revDate);
		
		
		
		Order order = new Order(prodName, buyerEmail, buyerName, buyerPhone, prodNum, hostNum, totalPrice, revDate);
		
		int result = new OrderService().insertOrder(order);

		
		
		request.getRequestDispatcher("/WEB-INF/views/product/realPay.jsp").forward(request, response);
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

