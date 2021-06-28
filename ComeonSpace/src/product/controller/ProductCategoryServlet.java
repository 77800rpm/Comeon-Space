package product.controller;

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
import product.model.service.ProductService;

/**
 * Servlet implementation class ProductCategoryServlet
 */
@WebServlet("/search.ca")
public class ProductCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category");
		System.out.println("카테고리 : " + category);
		
		ArrayList<Enroll> list = new ProductService().selectCategory(category);
		ArrayList<Img> fList = new ProductService().selectFList();
		
		request.setAttribute("list", list);
		request.setAttribute("fList", fList);
		request.getRequestDispatcher("WEB-INF/views/product/productSearchList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
