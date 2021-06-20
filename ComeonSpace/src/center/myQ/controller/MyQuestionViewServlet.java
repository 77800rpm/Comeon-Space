package center.myQ.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import center.myQ.model.service.MyQuestionService;
import center.myQ.model.vo.MyQuestion;
import member.model.vo.Member;

/**
 * Servlet implementation class MyQuestionViewServlet
 */
@WebServlet("/myQView.ce")
public class MyQuestionViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyQuestionViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int userNum = ((Member)session.getAttribute("loginUser")).getUserNum();
		
		ArrayList<MyQuestion> list = new MyQuestionService().selectMyQ(userNum);
		if(!list.isEmpty()) {
			request.setAttribute("list", list);
			request.getRequestDispatcher("WEB-INF/views/center/myQView.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "내 질문 조회에 실패하였습니다.");
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
