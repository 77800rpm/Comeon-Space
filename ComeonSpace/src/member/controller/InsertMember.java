package member.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.MyFileRenamePolicy;
import common.img.model.vo.Img;
import common.wrapper.SignUpWrapper;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class InsertMember
 */
@WebServlet(urlPatterns="/signUp.do", name="InsertMember")
public class InsertMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10; // 10Mbyte
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "img_upload/";
			
			
			File f = new File(savePath);
			if(!f.exists()) {
				f.mkdirs();
			}
			
			MultipartRequest multiparRequest = 
					new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());

			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multiparRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();//파라미터 명 반환
				
				if(multiparRequest.getFilesystemName(name) != null) {
					saveFiles.add(multiparRequest.getFilesystemName(name));
					originFiles.add(multiparRequest.getOriginalFileName(name));
				} 
			}
			
			ArrayList<Img> list = new ArrayList<Img>();
			if(originFiles != null) {
				for(int i = originFiles.size()-1; i >= 0; i--) {
						Img img = new Img();
						// i == 0 일 때 사업자 등록증 i == 1일 때 통장 사본
						// imgLevel == 1 (사업자) imgLevel == 2 통장사본
						img.setImgPath(savePath);
						img.setImgOrigin(originFiles.get(i));
						img.setImgChange(saveFiles.get(i));
						
						if(i == 0) {
							img.setImgLevel(1);
						} else if(i == 1) {
							img.setImgLevel(2);
						}
						
						list.add(img);
				}
			}
			SignUpWrapper su = new SignUpWrapper();
			
			String userEmail = multiparRequest.getParameter("userEmail");
			String userPwd = su.wrapper(multiparRequest.getParameter("userPwd"));
			String userName = multiparRequest.getParameter("userName");
			String userNic = multiparRequest.getParameter("userNic");
			String userPhone = multiparRequest.getParameter("userPhone");
			String userDiv = multiparRequest.getParameter("userDiv");
			
			Member member = new Member(userEmail, userPwd, userName, userNic, userPhone, userDiv);
			
			int result = new MemberService().insertMember(member, list);
			
			if(result > 0) {
				response.sendRedirect(request.getContextPath());
			} else {
				request.setAttribute("msg", "회원가입에 실패하였습니다.");
				request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
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
