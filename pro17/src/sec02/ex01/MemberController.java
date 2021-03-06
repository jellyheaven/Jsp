package sec02.ex01;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*@WebServlet("/member/*")*/
public class MemberController extends HttpServlet  {

	MemberDAO memberDAO;
	
	@Override
	public void init() throws ServletException {
		memberDAO = new MemberDAO(); 
	}

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
		
		String nextPage = null;
		
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		String action = req.getPathInfo(); //url의 요청명을 가져오기
		
		System.out.println("action : " + action);
		
		if(action == null || action.equals("/listMembers.do")) {
			List<MemberVO> memberlists = memberDAO.listMembers();
			req.setAttribute("memberlist", memberlists);
			nextPage = "/test02/listMembers.jsp";
		}else if(action.equals("/addMember.do")) {
			String id = req.getParameter("id");
			String pwd = req.getParameter("pwd");
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			
			MemberVO member = new MemberVO(id, pwd, name, email);
			memberDAO.addMember(member);
			
			nextPage = "/member/listMembers.do";
		}else if(action.equals("/memberForm.do")) {
			nextPage = "/test02/memberForm.jsp";
		}else{
			List<MemberVO> memberlists = memberDAO.listMembers();
			req.setAttribute("memberlist", memberlists);
			nextPage = "/test02/listMembers.jsp";
		}
		
		RequestDispatcher dispatch = req.getRequestDispatcher(nextPage);
		
		dispatch.forward(req, resp);
	}
	
}
