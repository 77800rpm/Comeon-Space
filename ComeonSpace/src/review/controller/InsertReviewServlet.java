package review.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.MyFileRenamePolicy;
import img.model.vo.Img;
import member.model.vo.Member;
import review.model.service.ReviewService;
import review.model.vo.Review;

/**
 * Servlet implementation class InsertReviewServlet
 */
@WebServlet(urlPatterns="/insertReview.re", name="InsertReviewServlet")
public class InsertReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReviewServlet() {
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
			String buyerNic = ((Member)session.getAttribute("loginUser")).getUserNic();
			
			int maxSize = 1024*1024*10;
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "/img_upload/";
			
			System.out.println(savePath);
			
			File f = new File(savePath);
			if(!f.exists()) {
				f.mkdirs();
			}
			
			MultipartRequest multipartRequest = 
					new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multipartRequest.getFileNames();
			
			if(files.hasMoreElements()) {
				String name = files.nextElement();
				
				
				if(multipartRequest.getFilesystemName(name) != null) {
					saveFiles.add(multipartRequest.getFilesystemName(name));
					originFiles.add(multipartRequest.getOriginalFileName(name));
				}
			}
			ArrayList<Img> fileList = new ArrayList<Img>();
			
			for(int i = originFiles.size()-1; i >= 0; i--) {
				Img img = new Img();
				img.setImgPath(savePath);
				img.setImgOrigin(originFiles.get(i));
				img.setImgChange(saveFiles.get(i));
				img.setImgCategory(3);
				img.setUserNum(userNum);
								
				fileList.add(img);
			}
			
			String buyerName = multipartRequest.getParameter("buyerName");
			String prodName = multipartRequest.getParameter("prodName");

			int prodNum = Integer.parseInt(multipartRequest.getParameter("prodNum"));
			int orderNum = Integer.parseInt(multipartRequest.getParameter("orderNum"));
			
			String revContent = multipartRequest.getParameter("revContent");
			String revTitle = multipartRequest.getParameter("revTitle");
			
			request.setAttribute("userNum", userNum);
			Review review = new Review(userNum, prodNum, orderNum, buyerName, buyerNic, revContent, revTitle, prodName);
			
			int result = new ReviewService().insertReview(review);
			
			response.sendRedirect("orderList.my");

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
