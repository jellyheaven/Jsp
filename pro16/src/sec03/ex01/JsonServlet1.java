package sec03.ex01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

@WebServlet("/json")
public class JsonServlet1 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		doHandle(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		doHandle(req,resp);
	}

	private void doHandle(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException{
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		//PrintWriter out = resp.getWriter();
		String jsonInfo = req.getParameter("jsonInfo");
		
		JSONParser jsonPs = new JSONParser();
		
		try {
			JSONObject jsonObj = (JSONObject) jsonPs.parse(jsonInfo);
			
			System.out.println("* 회원정보 *");
			System.out.println(jsonObj.get("name"));
			System.out.println(jsonObj.get("age"));
			System.out.println(jsonObj.get("gender"));
			System.out.println(jsonObj.get("nickname"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	
}
