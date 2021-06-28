package qna.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import img.model.service.ImgService;
import img.model.vo.Img;
import member.model.service.MemberService;
import member.model.vo.Member;
import qna.model.service.QnaService;
import qna.model.vo.Qna;

/**
 * Servlet implementation class QnaInsertServlet
 */
@WebServlet("/insertQna.qa")
public class QnaInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int hostNum = Integer.parseInt(request.getParameter("hostNum"));
		int userNum = Integer.parseInt(request.getParameter("userNum"));
		int bId = Integer.parseInt(request.getParameter("bId"));
		String content = request.getParameter("content");
		String userEmail = request.getParameter("userEmail");
		String pName = request.getParameter("pName");
		
		Member member = new MemberService().selectMember(userEmail);
		
		Qna q = new Qna();
		q.setHostNum(hostNum);
		q.setUserNum(userNum);
		q.setpNum(bId);
		q.setQnaContent(content);
		q.setUserNick(member.getUserNic());
		q.setpName(pName);
		
		ArrayList<Qna> qList = new QnaService().insertQna(q);
		
		response.setContentType("application/json; charset=UTF-8");
		
		GsonBuilder gd = new GsonBuilder();
		GsonBuilder dataGd = gd.setDateFormat("yyyy-MM-dd");
		
		Gson gson = dataGd.create();
		gson.toJson(qList, response.getWriter());
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
