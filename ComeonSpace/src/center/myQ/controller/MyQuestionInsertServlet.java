package center.myQ.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import center.myQ.model.service.MyQuestionService;
import center.myQ.model.vo.MyQuestion;
import common.MyFileRenamePolicy;
import img.model.service.ImgService;
import img.model.vo.Img;
import member.model.vo.Member;

/**
 * Servlet implementation class MyQuestionInsertServlet
 */
@WebServlet("/insertMyQ.my")
public class MyQuestionInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyQuestionInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024*1024*10;
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "img_upload";
			
			File f = new File(savePath);
			if(!f.exists()) {
				f.mkdirs();
			}
			
			MultipartRequest multipartRequest = 
					new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String originFiles = null;
			String saveFiles = null;
			
			HttpSession session = request.getSession();
			int userNum = ((Member)session.getAttribute("loginUser")).getUserNum();
			
			Enumeration<String> files = multipartRequest.getFileNames();
			Img img = null;
			
			if(files.hasMoreElements()) {
				String name = files.nextElement();
				if(multipartRequest.getFilesystemName(name) != null) {
					saveFiles = multipartRequest.getFilesystemName(name);
					originFiles = multipartRequest.getOriginalFileName(name);
					
					img = new Img();
					
					img.setImgCategory(2);
					img.setImgChange(saveFiles);
					img.setImgOrigin(originFiles);
					img.setImgPath(savePath);
					img.setUserNum(userNum);
				}
				
			}
			
			String myQTitle = multipartRequest.getParameter("myQtitle");
			String myQCategory = multipartRequest.getParameter("myQCategory");
			String myQContent = multipartRequest.getParameter("myQContent");
			
			MyQuestion myQ = new MyQuestion();
			
			myQ.setMyQTitle(myQTitle);
			myQ.setMyQCategory(myQCategory);
			myQ.setMyQContent(myQContent);
			myQ.setUserNum(userNum);
			
			System.out.println(img == null);

			int result = new MyQuestionService().insertQuestion(myQ);

			if(img != null) {
				int iResult = new ImgService().insertMyQ(img);
				System.out.println(iResult);
				if(result > 0 && iResult > 0) {
					System.out.println("사진 있고 성공했을 때");
					response.sendRedirect("centerView.ce");
				} else {
					System.out.println("사진 있고 실패했을 때");
					request.setAttribute("msg", "문의 작성에 실패하였습니다.");
					request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
				}
			} else {
				if(result > 0) {
					System.out.println("사진없이 성공");
					response.sendRedirect("centerView.ce");
				} else {
					System.out.println("사진도 없고 실패함");
					request.setAttribute("msg", "문의 작성에 실패하였습니다.");
					request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
				}
			}
//			
//			if(result > 0) {
//				request.getRequestDispatcher("WEB-INF/views/center/centerMain.jsp").forward(request, response);
//			} else {
//				request.setAttribute("msg", "문의 작성에 실패하였습니다.");
//				request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
//			}
			
			
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
