package product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import img.model.vo.Img;
import product.model.service.ProductService;
import product.model.vo.Product;

/**
 * Servlet implementation class ProductCategoryServlet
 */
@WebServlet("/spaceApproveDetail.bo")
public class AdmProductSpaceApproveDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdmProductSpaceApproveDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("승인 상세 페이지 진입 완료");
		
		System.out.println("최초 파라미터 : "+request.getParameter("productNum"));
		
		
		//공간번호가 null이거나 "" 빈 문자열이라면
		if(request.getParameter("productNum")==null || "".equals(request.getParameter("productNum").toString())){
			request.setAttribute("msg", "공간 승인 상세 페이지 진입 불가");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
		}else{
			Integer productNum=Integer.valueOf(request.getParameter("productNum"));
			
			ProductService productService=new ProductService();
			Product product=productService.selectProductDetail(productNum);
			request.setAttribute("product", product);
			
			ArrayList<Img> productImgList=productService.selectProductImgList(productNum);
			request.setAttribute("productImgList", productImgList);
			
			request.getRequestDispatcher("WEB-INF/views/admin/admSpaceApproveDetail.jsp").forward(request, response);
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
