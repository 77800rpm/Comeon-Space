package product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.service.ProductService;

/**
 * Servlet implementation class ProductCategoryServlet
 */
@WebServlet("/spaceApproveSuccess.bo")
public class AdmProductSpaceApproveSuccessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdmProductSpaceApproveSuccessServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//공간번호가 null이거나 "" 빈 문자열이라면
		if(request.getParameter("productNum")==null || "".equals(request.getParameter("productNum").toString())){
			request.setAttribute("msg", "공간 승인 처리 불가");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
		}else{
			Integer productNum=Integer.valueOf(request.getParameter("productNum"));
			
			ProductService productService=new ProductService();
			Integer updateSuccess=productService.updateProductApproveSuccess(productNum);
			
			//updateSuccess가 1보다 작으면 update가 되지 않은 것이므로, 에러페이지로 넘김
			if(updateSuccess <= 0){
				request.setAttribute("msg", "공간 승인 처리 실패");
				request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
			}else{
				response.sendRedirect("spaceApproveList.bo");
			}
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
