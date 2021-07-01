package common;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import enroll.model.vo.Enroll;
import img.model.service.ImgService;
import img.model.vo.Img;
import order.model.service.OrderService;
import product.model.service.ProductService;

/**
 * Servlet implementation class MainViewServlet
 */
@WebServlet("/mainView.mv")
public class MainViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Enroll> list = new ProductService().mainCategory();
		int[] top3 = new OrderService().getTop3();
		ArrayList<Enroll> topList = new ProductService().selectTop3(top3);
		ArrayList<Img> topImg = new ImgService().selectEnroll(topList);
		
		request.setAttribute("topImg", topImg);
		request.setAttribute("topList", topList);
		request.setAttribute("list", list);
		request.getRequestDispatcher("test.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
