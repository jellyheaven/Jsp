package sec02.ex01;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private DataSource datafactory;
	private ResultSet rs;
	
	public MemberDAO() {
		try {
			Context ctx = new InitialContext();
			Context env = (Context) ctx.lookup("java:/comp/env");
			datafactory = (DataSource) env.lookup("jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	//ID 중복 여부 체크
	public boolean overlappedID(String id) {
		boolean result = false;
		try {
			//1. db 접근
			conn  = datafactory.getConnection();
			//2. pre
			String query =  " select decode(count(*), 1 , 'true', 'false') as result from t_member";
				   query += " where id = ? ";
				   
			System.out.println(query);
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			
			//3. sql 실행
			rs = pstmt.executeQuery();
			
			rs.next();
			
			result =Boolean.valueOf(rs.getString("result"));
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return result;
	}
}
