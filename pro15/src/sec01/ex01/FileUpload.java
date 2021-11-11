package sec01.ex01;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

//업로드 실습
@WebServlet("/upload.do")
public class FileUpload extends HttpServlet  {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		doHandle(req, resp);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		doHandle(req, resp);
	}

	private void doHandle(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException{
		
		req.setCharacterEncoding("utf-8");
		
		String encoding = "utf-8";
		
		File currentDirPath = new File("C:\\H2Softs\\05_Jsp\\pro15\\WebContent\\uploadfile"); //업로드 할 물리 경로
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		
		factory.setRepository(currentDirPath);
		factory.setSizeThreshold(1024*1024); // 1M 최대 업로드 용량	
		
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		try {
			List items = upload.parseRequest(req);
			
			for(int i = 0; i < items.size() ; i++) {
				FileItem fileitem = (FileItem) items.get(i); //req 만큼 파일 가져오기 
				
				if(fileitem.isFormField()) { //폼 필드면 매개변수만 출력
					System.out.println(fileitem.getFieldName() +"="+fileitem.getString(encoding));
				}else {
					System.out.println("매개변수이름:"+fileitem.getFieldName());
					System.out.println("파일이름:"+fileitem.getName());
					System.out.println("파일크기:"+fileitem.getSize()+"byte");
					
					if(fileitem.getSize() > 0) {
						int idx = fileitem.getName().lastIndexOf("\\");
						
						if(idx == -1) {
							idx = fileitem.getName().lastIndexOf("/");
						}
						
						String fileName = fileitem.getName().substring(idx+1);
						
						File uploadFile = new File(currentDirPath+"\\"+fileName);
						
						fileitem.write(uploadFile);
					}
					
				}
				
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
