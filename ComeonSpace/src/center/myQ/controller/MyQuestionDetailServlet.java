package center.myQ.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import center.myQ.model.service.MyQuestionService;
import center.myQ.model.vo.MyQuestion;
import img.model.service.ImgService;
import img.model.vo.Img;
import member.model.vo.Member;

/**
 * Servlet implementation class MyQuestionDetailServlet
 */
@WebServlet("/myQDetail.ce")
public class MyQuestionDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyQuestionDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int bId = Integer.parseInt(request.getParameter("bId"));
		int userNum = ((Member)session.getAttribute("loginUser")).getUserNum();
		
		MyQuestion my = new MyQuestionService().detailMyQuestion(bId);
		Img img = new ImgService().selectMyQ(bId, userNum);
		
		if(my != null) {
			request.setAttribute("my", my);
			request.setAttribute("img", img);
			request.getRequestDispatcher("WEB-INF/views/center/myQdetail.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "내 질문 상세조회에 실패하였습니다.");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
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
