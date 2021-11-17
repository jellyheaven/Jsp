package sec02.ex01;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {
	private Connection conn;
	private DataSource factory;
	private PreparedStatement pstm;
	private ResultSet rs;
	
	public MemberDAO() {
		try {
			Context ctx = new InitialContext();
			Context env = (Context) ctx.lookup("java:/comp/env");
			factory = (DataSource) env.lookup("jdbc/oracle");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//목록 보기
	public List<MemberVO> listMembers(){
		List<MemberVO> memberlist = new ArrayList<MemberVO>();
		
		String query =  " select id, pwd, name, email, joindate from t_member ";
			   query += " order by joinDate desc ";
		 
		try {
			//1. connection
			conn = factory.getConnection();
			
			System.out.println("====sql start===");
			System.out.println("query : "+ query);
			System.out.println("====sql end===");
			
			pstm = conn.prepareStatement(query);
			rs = pstm.executeQuery();
			
			while (rs.next()) {
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String email = rs.getString("email");
				Date joindate = rs.getDate("joindate");
				
				MemberVO member = new MemberVO(id, pwd, name, email, joindate);
				
				memberlist.add(member);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstm.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return memberlist;
	}
	
	//회원정보 추가 
	public void addMember(MemberVO m) {
		try {
			conn = factory.getConnection();
			
			String query = "insert into t_member(id, pwd, name, email) values(?,?,?,?)";
			String id = m.getId();
			String pwd = m.getPwd();
			String name = m.getName();
			String email = m.getEmail();
			
			System.out.println("====sql start===");
			System.out.println("query : "+ query);
			System.out.println("====sql end===");
			
			pstm = conn.prepareStatement(query);
			pstm.setString(1, id);
			pstm.setString(2, pwd);
			pstm.setString(3, name);
			pstm.setString(4, email);
			
			pstm.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			try {
				pstm.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
