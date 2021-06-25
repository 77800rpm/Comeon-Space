package center;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		if(loginUser != null) {
			int userNum = loginUser.getUserNum();

			profileImg = new ImgService().selectMember(userNum);
		}
		
		ArrayList<Faq> fList = new FaqService().faqSelect();
		ArrayList<Notice> noList = new NoticeService().selectNotice();
		
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
