package product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.service.ProductService;
import product.model.vo.Product;

/**
 * Servlet implementation class ProductCategoryServlet
 */
@WebServlet("/spaceApproveList.bo")
public class AdmProductSpaceApproveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdmProductSpaceApproveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*String category = request.getParameter("category");
		System.out.println("카테고리 : " + category);
		
		ArrayList<Enroll> list = new ProductService().selectCategory(category);
		ArrayList<Img> fList = new ProductService().selectFList();
		
		request.setAttribute("list", list);
		request.setAttribute("fList", fList);*/
		
		System.out.println("승인 페이지 진입 완료");
		
		ArrayList<Product> list = new ProductService().selectProductList(0);
		request.setAttribute("list", list);
		
		System.out.println("페이지 번호 : "+request.getParameter("pageNo"));
		
		//페이지 번호 null 인 경우 1로 설정하기
		
		request.getRequestDispatcher("WEB-INF/views/admin/admSpaceApprove.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
