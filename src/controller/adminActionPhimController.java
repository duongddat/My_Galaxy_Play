package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import bo.phimbo;

/**
 * Servlet implementation class adminActionPhimController
 */
@WebServlet("/adminActionPhimController")
public class adminActionPhimController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminActionPhimController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			DiskFileItemFactory factory = new DiskFileItemFactory();
			DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
	
			phimbo pbo = new phimbo();
			String mes = null, alert =null;
			try {
				List<FileItem> fileItems = upload.parseRequest(request);//Lấy về các đối tượng gửi lên
				String maphim = null, tenphim = null, loai = null, 
					   tacgia = null, dienvien = null, img = null, 
					   video = null, mota = null, action = null;
			   long gia = 0;
			   
				if(fileItems != null) {
					//duyệt qua các đối tượng gửi lên từ client gồm file và các control
					for (FileItem fileItem : fileItems) {
			 			 if (!fileItem.isFormField()) {//Nếu ko phải các control=>upfile lên
							// xử lý file
							String name = fileItem.getName();
							if (!name.equals("")) {
								if(fileItem.getFieldName().equals("video")) {
									//Tạo tên miền lưu vào csdl
									video = "video/" + name;
									
							        //Lấy đường dẫn hiện tại, chủ ý xử lý trên dirUrl để có đường dẫn đúng
									String dirUrl = request.getServletContext().getRealPath("") +  File.separator + "video";
									File dir = new File(dirUrl);
									if (!dir.exists()) {//nếu ko có thư mục thì tạo ra
										dir.mkdir();
									}
								    String fileImg = dirUrl + File.separator + name;
								    File file = new File(fileImg);//tạo file
								    try {
								         fileItem.write(file);//lưu file
								         System.out.println("UPLOAD THÀNH CÔNG...!");
								         System.out.println("Đường dẫn lưu file là: "+dirUrl);
								    } catch (Exception e) {
								    	e.printStackTrace();
								    }
								
								} else if(fileItem.getFieldName().equals("img")) {
									//Tạo tên miền lưu vào csdl
									img = "images/" + name;
									
							        //Lấy đường dẫn hiện tại, chủ ý xử lý trên dirUrl để có đường dẫn đúng
									String dirUrl = request.getServletContext().getRealPath("") +  File.separator + "images";
									File dir = new File(dirUrl);
									if (!dir.exists()) {//nếu ko có thư mục thì tạo ra
										dir.mkdir();
									}
								    String fileImg = dirUrl + File.separator + name;
								    File file = new File(fileImg);//tạo file
								    try {
								         fileItem.write(file);//lưu file
								         System.out.println("UPLOAD THÀNH CÔNG...!");
								         System.out.println("Đường dẫn lưu file là: "+dirUrl);
								    } catch (Exception e) {
								    	e.printStackTrace();
								    }
								}
							}
			 			 } else {//Neu la control
			 				//Từ server --> clien === unitcode (utf-8)
			 				response.setCharacterEncoding("utf-8");
			 				//Từ clien --> server === unitcode (utf-8)
			 				request.setCharacterEncoding("utf-8");
							String input=fileItem.getFieldName();
							if(input.equals("maphim"))
								maphim = fileItem.getString();
							if(input.equals("tenphim"))
								tenphim = fileItem.getString("utf-8");
							if(input.equals("gia"))
								gia = Long.parseLong(fileItem.getString().trim());
							if(input.equals("loai"))
								loai  = fileItem.getString();
							if(input.equals("tacgia"))
								tacgia = fileItem.getString("utf-8");
							if(input.equals("dienvien"))
								dienvien = fileItem.getString("utf-8");
							if(input.equals("mota"))
								mota = fileItem.getString("utf-8");
							if(input.equals("them"))
								action = fileItem.getString();
							if(input.equals("sua"))
								action = fileItem.getString();
			 			}
				   }
				   if(action != null && action.equals("Add")) {
					   int check = pbo.Them(maphim, tenphim, gia, loai, tacgia, img, video, dienvien, mota);
					   if(check == 0) {
							mes = "Mã phim đã tồn tại!!!";
							alert = "alert-danger";
						} else {
							mes = "Thêm phim thành công!!!";
							alert = "alert-success";
						}
				   } else if(action != null && action.equals("Update")) {
					   if(img == null) {
						  img = pbo.getImg(maphim);
						  System.out.println(img);
					   }
					   if(video == null) {
						   video = pbo.getVideo(maphim);
						   System.out.println(video);
					   }
					   
					  pbo.Sua(maphim, tenphim, gia, loai, tacgia, img, video, dienvien, mota);
					  mes = "Sửa phim thành công!!!";
					  alert = "alert-success";
				   }
				}
			} catch (FileUploadException e) {
				e.printStackTrace();
			}
			
			request.setAttribute("mes", mes);
			request.setAttribute("alert", alert);
			RequestDispatcher rd = request.getRequestDispatcher("adminPhimController");
			rd.forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
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
