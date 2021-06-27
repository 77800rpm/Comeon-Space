package mypage.controller;

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

import common.MyFileRenamePolicy;
import img.model.service.ImgService;
import img.model.vo.Img;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MypateUpdateProfileServlet
 */
@WebServlet("/updateProfile.my")
public class MypateUpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypateUpdateProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			HttpSession session = request.getSession();
			int userNum = ((Member)session.getAttribute("loginUser")).getUserNum();
			
			
			int maxSize = 1024 * 1024 * 10;
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "/img_upload";
			
			File f = new File(savePath);
			if(!f.exists()) {
				f.mkdirs();
			}
					
			MultipartRequest multipartRequest =
					new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			
			Enumeration<String> files = multipartRequest.getFileNames(); 
			Img img = new Img();
			boolean checkImg = false;
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				if(multipartRequest.getFilesystemName(name) != null) {
					img.setImgChange(multipartRequest.getFilesystemName(name));
					img.setImgOrigin(multipartRequest.getOriginalFileName(name));
					img.setUserNum(userNum);
					img.setImgPath(savePath);
					checkImg = true;
				}
			}
			
			Member member = new Member();
			
			String userEmail = multipartRequest.getParameter("userEmail");
			String phone = multipartRequest.getParameter("userPhone");
			String pwd = multipartRequest.getParameter("userPwd");
			String pwdNew = multipartRequest.getParameter("newPwd");
			String nic = multipartRequest.getParameter("userNick");
			
			
			String insertPwd = "";
			
			if(!pwdNew.equals("")) {
				insertPwd = pwdNew;
			} else {
				insertPwd = pwd;
			}
			
			member.setUserEmail(userEmail);
			member.setUserPhone(phone);
			member.setUserNic(nic);
			member.setUserNum(userNum);
			
			int memberResult = new MemberService().updateProfile(member, insertPwd);
			
			if(checkImg) {
				int imgResult = new ImgService().updateProfile(img);
				
				if(imgResult > 0 && memberResult > 0) {
					System.out.println("사진 있고 성공");
					response.sendRedirect("mypageMain.my");
				} else {
					System.out.println("사진있고 실패");
					System.out.println(imgResult);
					System.out.println(memberResult);
					request.setAttribute("msg", "회원정보 수정에 실패하였습니다.");
					request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
				}
			} else {
				if(memberResult > 0) {
					System.out.println("사진없고 성공");
					response.sendRedirect("mypageMain.my");
				} else {
					System.out.println("사진없고 실패");
					request.setAttribute("msg", "회원정보 수정에 실패하였습니다.");
					request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
				}
			}
			
			
			
			
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
