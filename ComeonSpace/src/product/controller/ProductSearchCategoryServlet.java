package product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import enroll.model.vo.Enroll;
import img.model.vo.Img;
import product.model.service.ProductService;

/**
 * Servlet implementation class ProductSearchCategoryServlet
 */
@WebServlet("/search.cate")
public class ProductSearchCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductSearchCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String productLocation = request.getParameter("PRODUCT_LOCATION");
		String productCategory = request.getParameter("PRODUCT_CATEGORY");
		String productHoliday = request.getParameter("PRODUCT_HOLIDAY");		
		
		//String search_date = request.getParameter("search-date");		
		
		String allProductLocation = "";
		if(productLocation.equals("모든지역")) {
			allProductLocation = productLocation;
			productLocation = " ";
		}
				
		ArrayList<Enroll> list = new ProductService().selectList(productLocation, productCategory, productHoliday);
		ArrayList<Img> fList = new ProductService().selectFList();
				
		String page = null;
		if(list != null && fList != null) {
			page = "WEB-INF/views/product/productSearchList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("fList", fList);
			
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "상품 조회에 실패하였습니다.");
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
