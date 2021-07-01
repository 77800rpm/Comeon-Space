package product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PagingUtil;
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
		
		System.out.println("최초 파라미터 : "+request.getParameter("pageNo"));
		
		Integer pageNo=1;
		if(request.getParameter("pageNo")!=null && "".equals(request.getParameter("pageNo").toString())==false){ //페이지번호가 null이 아니고, "" 빈 문자열이 아니라면
			pageNo=Integer.valueOf(request.getParameter("pageNo"));
//			System.out.println("1. pageNo : "+pageNo);
			pageNo=(pageNo==0)?1:pageNo; //페이지 번호가 0일 경우 1로 바꿔주고, 아니면 그대로 pageNo 사용
//			System.out.println("2. pageNo : "+pageNo);
		}
		ProductService productService=new ProductService();
		ArrayList<Product> list = productService.selectProductList(pageNo);
		request.setAttribute("list", list);
		Integer listCnt=productService.selectProductListCnt();
		request.setAttribute("listCnt", listCnt);
		
		PagingUtil paging=new PagingUtil(pageNo,listCnt, 10);
		request.setAttribute("pagingInfo", paging.getPagingInfo());
//		System.out.println("페이징 정보 :"+paging.getPagingInfo());
		
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
