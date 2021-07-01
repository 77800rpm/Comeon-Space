package faq.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.pageInfo.model.vo.PageInfo;
import faq.model.service.FaqService;
import faq.model.vo.Faq;
import notice.model.service.NoticeService;

/**
 * Servlet implementation class FaqSelectServlet
 */
@WebServlet("/list.bo")
public class FaqSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int fCurrentPage;
		int fListCount;
		int fBoardLimit;
		int fPageLimit;
		int fMaxPage;
		int fStartPage;
		int fEndPage;
		
		fListCount = new NoticeService().getListCount();
		
		fCurrentPage = 1;
		if(request.getParameter("fCurrentPage") != null) {
			fCurrentPage = Integer.parseInt(request.getParameter("fCurrentPage"));
		}
		
		fBoardLimit = 10;
		fPageLimit = 10;
		
		fMaxPage = (int)Math.ceil((double)fListCount / fBoardLimit);
		
		fStartPage = ((fCurrentPage -1)/fPageLimit) * fPageLimit + 1;
		fEndPage = fStartPage + fPageLimit - 1;
		if(fEndPage > fMaxPage) {
			fEndPage = fMaxPage;
		}
		
		PageInfo fPi = new PageInfo(fCurrentPage, fListCount, fPageLimit, fBoardLimit, fMaxPage, fStartPage, fEndPage);
		
		ArrayList<Faq> list = new FaqService().faqSelect(fPi);
		
		request.setAttribute("fPi", fPi);
		request.setAttribute("list", list);
		request.getRequestDispatcher("WEB-INF/views/admin/admFaqList.jsp").forward(request, response);
//		request.getRequestDispatcher("admFaqList.jsp").forward(request, response);
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
