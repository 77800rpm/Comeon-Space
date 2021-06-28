package product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import enroll.model.vo.Enroll;
import img.model.service.ImgService;
import img.model.vo.Img;
import member.model.vo.Member;
import product.model.service.ProductService;
import qna.model.service.QnaService;
import qna.model.vo.Qna;

/**
 * Servlet implementation class ProductDetailServlet
 */
@WebServlet("/productDetail.no")
public class ProductDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int no = Integer.parseInt(request.getParameter("no")); // 주소 no=?
		
		HttpSession session = request.getSession();
		int userNum = ((Member)(session.getAttribute("loginUser"))).getUserNum();
		
		Enroll product = new ProductService().selectProduct(no);
		
		ProductService pService = new ProductService();
		Img profile = new ImgService().selectMember(userNum);
		ArrayList<Img> fileList = pService.selectThumbnail(no);
		ArrayList<Qna> qnaList = new QnaService().selectQna(no);

		String page = null;
		
		if(product != null) {
			page = "WEB-INF/views/product/productDetailPage.jsp";
			
			request.setAttribute("img", profile);
			request.setAttribute("qnaList", qnaList);
			request.setAttribute("no", no);
			request.setAttribute("product", product);
			request.setAttribute("fileList", fileList);
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 상세 조회에 실패하였습니다.");
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
