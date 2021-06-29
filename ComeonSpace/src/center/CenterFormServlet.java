package center;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.pageInfo.model.vo.PageInfo;
import faq.model.service.FaqService;
import faq.model.vo.Faq;
import img.model.service.ImgService;
import img.model.vo.Img;
import member.model.service.MemberService;
import member.model.vo.Member;
import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class CenterFormServlet
 */
@WebServlet("/centerView.ce")
public class CenterFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CenterFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원 프로필 사진, 회원 정보 가져오기
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		Img profileImg = null;
		
		int currentPage;
		int listCount;
		int boardLimit;
		int pageLimit;
		int maxPage;
		int startPage;
		int endPage;
		
		listCount = new NoticeService().getListCount();
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		boardLimit = 10;
		pageLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = ((currentPage -1)/pageLimit) * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
	
		if(loginUser != null) {
			int userNum = loginUser.getUserNum();

			profileImg = new ImgService().selectMember(userNum);
		}
		
		ArrayList<Faq> fList = new FaqService().faqSelect();
		ArrayList<Notice> noList = new NoticeService().selectNotice(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("fList", fList);
		request.setAttribute("noList", noList);
		request.setAttribute("prifileImg", profileImg);
		request.getRequestDispatcher("WEB-INF/views/center/centerMain.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
