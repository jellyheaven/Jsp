package sec01.ex02;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/download.do")
public class FileDownload extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		doHandle(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		doHandle(req, resp);
	}

	private void doHandle(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException{
		
		req.setCharacterEncoding("utf-8");
		
		resp.setContentType("text/html;charset=utf-8");
		
		String file_repo = "C:\\H2Softs\\05_Jsp\\pro15\\WebContent\\uploadfile";
		
		String fileName = req.getParameter("fileName");
		System.out.println("fileName="+fileName);
		
		OutputStream out = resp.getOutputStream(); //출력 스트림 객체 가져옴.
		
		String  downfile = file_repo+"\\"+fileName;
		
		File f = new File(downfile);
		
		//다운로드 
		resp.setHeader("Cache-Control", "no-cache");
		resp.addHeader("Content-disposition", "attachment;fileName="+fileName);
		
		FileInputStream in = new FileInputStream(f);
		
		byte[] buffer = new byte[1024*8]; //8kmbyte
		
		while(true) {
			int count = in.read(buffer);
			if(count == -1) break;
			out.write(buffer, 0, count);
		}
		
		in.close();
		out.close();
	}

}
