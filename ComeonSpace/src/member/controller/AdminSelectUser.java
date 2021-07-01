package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PagingUtil;
import common.pageInfo.model.vo.PageInfo;
import faq.model.service.FaqService;
import faq.model.vo.Faq;
import member.model.service.MemberService;
import member.model.vo.Member;
import notice.model.service.NoticeService;
import product.model.service.ProductService;
import product.model.vo.Product;

/**
 * Servlet implementation class AdminSelectUser
 */
@WebServlet("/selectUser.me")
public class AdminSelectUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSelectUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Member> list = new MemberService().adminSelectUser();
		
		if(list == null) { 
			System.out.println("NULL ERROR");
			return;
		}
		else System.out.println(list.size());
		request.setAttribute("list", list);
		request.getRequestDispatcher("WEB-INF/views/admin/admSelectUser.jsp").forward(request, response);

		//페이징
//		int fCurrentPage;
//		int fListCount;
//		int fBoardLimit;
//		int fPageLimit;
//		int fMaxPage;
//		int fStartPage;
//		int fEndPage;
//		
//		fListCount = new MemberService().getListCount();
//		
//		fCurrentPage = 1;
//		if(request.getParameter("fCurrentPage") != null) {
//			fCurrentPage = Integer.parseInt(request.getParameter("fCurrentPage"));
//		}
//		
//		fBoardLimit = 10;
//		fPageLimit = 10;
//		
//		fMaxPage = (int)Math.ceil((double)fListCount / fBoardLimit);
//		
//		fStartPage = ((fCurrentPage -1)/fPageLimit) * fPageLimit + 1;
//		fEndPage = fStartPage + fPageLimit - 1;
//		if(fEndPage > fMaxPage) {
//			fEndPage = fMaxPage;
//		}
//		
//		PageInfo fPi = new PageInfo(fCurrentPage, fListCount, fPageLimit, fBoardLimit, fMaxPage, fStartPage, fEndPage);
//		
//		ArrayList<Member> list = new MemberService().adminSelectUser(fPi);
//		
//		request.setAttribute("fPi", fPi);
//		request.setAttribute("list", list);
//		request.getRequestDispatcher("WEB-INF/views/admin/admSelectUser.jsp").forward(request, response);
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
