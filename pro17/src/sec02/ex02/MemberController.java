package sec02.ex02;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/*")
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
			//리스트 목록
			List<MemberVO> memberlists = memberDAO.listMembers();
			req.setAttribute("memberlist", memberlists);
			nextPage = "/test03/listMembers.jsp";
		}else if(action.equals("/addMember.do")) {
			//회원 추가
			String id = req.getParameter("id");
			String pwd = req.getParameter("pwd");
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			
			MemberVO member = new MemberVO(id, pwd, name, email);
			memberDAO.addMember(member);
			
			req.setAttribute("msg", "addMember");
			
			nextPage = "/member/listMembers.do";
		
		}else if(action.equals("/memberForm.do")) {
			//회원등록화면 이동
			nextPage = "/test03/memberForm.jsp";
			
		}else if(action.equals("/modMemberForm.do")) {
			//수정 화면 이동
			String id = req.getParameter("id");
			
			MemberVO memberInfo = memberDAO.findMember(id);
			
			req.setAttribute("memInfo", memberInfo);
			
			nextPage = "/test03/modMemberForm.jsp";
		}else if(action.equals("/modMember.do")) {
			//파라미터 가져온다.
			String id = req.getParameter("id");
			String pwd = req.getParameter("pwd");
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			
			MemberVO member = new MemberVO(id, pwd, name, email);
			
			//수정 Dao 추가
			memberDAO.modMember(member);
			
			req.setAttribute("msg", "modified");
			
			nextPage = "/member/listMembers.do";
			
		}else if(action.equals("/delMemberForm.do")) {
			String id = req.getParameter("id");
			
			//삭제 Dao 추가 
			memberDAO.delMember(id);
			req.setAttribute("msg", "deleted");
			nextPage = "/member/listMembers.do";
			
		}else{
			List<MemberVO> memberlists = memberDAO.listMembers();
			req.setAttribute("memberlist", memberlists);
			nextPage = "/test03/listMembers.jsp";
		}
		
		RequestDispatcher dispatch = req.getRequestDispatcher(nextPage);
		
		dispatch.forward(req, resp);
	}
	
}
