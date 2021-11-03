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
	private PreparedStatement pstmt;
	private DataSource dataFactory;
	
	public MemberDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext= (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	//특정 검색 리스트 가져오기
	public List listMembers(MemberVO memberVO) {
		List member_list = new ArrayList<MemberVO>();
		
		String _name = memberVO.getName();
		
		try {
			conn = dataFactory.getConnection();
			
			String query = "select * from t_member ";
			
			if( (_name != null) && (_name.length() != 0) ) {
				query +=" where name = ? ";
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, _name);
			}else {
				pstmt = conn.prepareStatement(query);
			}
			
			System.out.println("perepareStatement : "+ query);
			
			ResultSet rs =  pstmt.executeQuery();
			
			while (rs.next()) {
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String email = rs.getString("email");
				Date joinDate = rs.getDate("joinDate");
				
				MemberVO memberVo = new MemberVO();
				memberVo.setId(id);
				memberVo.setPwd(pwd);
				memberVo.setName(name);
				memberVo.setEmail(email);
				memberVo.setJoinDate(joinDate);
				
				member_list.add(memberVo);
				
			}
			
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return member_list;
	}
}
