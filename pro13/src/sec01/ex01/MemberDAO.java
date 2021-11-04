package sec01.ex01;

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
	private PreparedStatement pstmt;
	private DataSource dataFatory;
	
	public MemberDAO() {
		try {
			Context ctx = new InitialContext();
			Context env = (Context) ctx.lookup("java:/comp/env");
			dataFatory = (DataSource) env.lookup("jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	//유저 추가 
	public void addMember(MemberBean memberBean) {
		try {
			String id = memberBean.getId();
			String pwd = memberBean.getPwd();
			String name = memberBean.getName();
			String email = memberBean.getEmail();
			
			conn = dataFatory.getConnection();
			
			String query ="insert into t_member (id, pwd, name, email) values (?,?,?,?) ";
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	//유저 목록
	public List listMembers() {
		List list = new ArrayList();
		
		try {
			conn = dataFatory.getConnection();
			String query = "select id, pwd, name, email, joindate from t_member";
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				//결과 추출
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String email = rs.getString("email");
				Date joindate = rs.getDate("joindate");
				
				MemberBean member = new MemberBean();
				member.setId(id);
				member.setPwd(pwd);
				member.setName(name);
				member.setEmail(email);
				member.setJoinDate(joindate);
				
				list.add(member);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return list;
	}
}
