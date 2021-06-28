package faq.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import faq.model.service.FaqService;
import faq.model.vo.Faq;
import member.model.vo.Member;
import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class FaqInsertServlet
 */
@WebServlet("/faqInsert.bo")
public class FaqInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("UTF-8");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
//		String userName = ((Member)request.getSession().getAttribute("loginUser")).getUserName();
		
		Faq fo = new Faq();
//		fo.setAdmName(userName);
		fo.setBoardFaqTitle(title);
		fo.setBoardFaqContent(content);
		
		int result = new FaqService().admInsertFaq(fo);  
		
		if(result > 0) {
			response.sendRedirect("list.bo");
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
