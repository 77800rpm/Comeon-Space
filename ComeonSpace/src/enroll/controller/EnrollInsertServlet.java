package enroll.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.MyFileRenamePolicy;
import img.model.vo.Img;

/**
 * Servlet implementation class EnrollInsertServlet
 */
@WebServlet("/enroll.en")
public class EnrollInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnrollInsertServlet() {
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
			String savePath = root + "/img_upload/";
			
			File f = new File(savePath);
			if(!f.exists()) {
				f.mkdirs();
			}
			
			MultipartRequest multipartRequest = 
					new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multipartRequest.getFileNames();
			
			while(files.hasMoreElements()) {
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
				img.setImgCategory(4);
				
				if(i == originFiles.size() - 1) {
					img.setImgLevel(0);
				} else {
					img.setImgLevel(1);
				}
				
				fileList.add(img);
			}
			
			String name = multipartRequest.getParameter("name");
			int person = Integer.parseInt(multipartRequest.getParameter("number"));
			String shortExp = multipartRequest.getParameter("short_Exp");
			String category = multipartRequest.getParameter("category");
			String longExp = multipartRequest.getParameter("long_Exp");
			String[] irr = multipartRequest.getParameterValues("facility");
			String facility = "";
			if(irr != null) {
				for(int i = 0; i < irr.length; i++) {
					if(i == irr.length - 1) {
						facility += irr[i];
					} else {
						facility += irr[i] + ", ";
					}
				}
			}
			
			
			String address1 = multipartRequest.getParameter("address1");
			String address2 = multipartRequest.getParameter("address2");
			String address3 = multipartRequest.getParameter("address3");
			String address = address1 + address2 + address3;

			int price = Integer.parseInt(multipartRequest.getParameter("money"));
			
			String[] irr2 = multipartRequest.getParameterValues("holiday");
			
			String holiday = "";
			if(irr2 != null) {
				for(int i = 0; i < irr2.length; i++) {
					if(i == irr2.length - 1) {
						holiday += irr2[i];
					} else {
						holiday += irr2[i] + ", ";
					}
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
