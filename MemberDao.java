package SD.project.member;
import java.sql.*;

public class MemberDao {
	public MemberDao(){
		
	}
	
	//DB연결 메소드
	public Connection getConn(){
		Connection con = null;
		
		String url = "jdbc:mysql://localhost:3306/test";
		String user = "root";
		String password = "1234";
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(url, user, password);
	
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return con;
		
	}
	
	public int checkIdPw(String id, String pw){
		int flag = 0;
		
		//JDBC 5단계 : 드라이버 로딩, 연결, 명령, 결과 , 자원해제
		
		Connection con = getConn();
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try{
			String sql = "select count(*) from sd_member where id=? and pw=?";
			ps = con.prepareStatement(sql);
			ps.setString(1,id);
			ps.setString(2, pw);
			rs = ps.executeQuery();
			if(rs.next()){
				flag = rs.getInt(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(con, ps, rs);
		}
		return flag;
	}
	
	//회원 정보 저장
	public boolean insert(MemberDto dto){
		boolean saveOk = false;
		Connection con = null;
		PreparedStatement ps = null;
		try{
			con = getConn();
			String sql= "insert into sd_member" + "(id, pw, name, tel, email)" +
			"values(?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPw());
			ps.setString(3, dto.getName());
			ps.setString(4, dto.getTel());
			ps.setString(5, dto.getEmail());
			
			int x = ps.executeUpdate();
			
			if(x == 1){
				saveOk = true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(con,ps);
		}
		
		return saveOk;
	}
	
	private void close(Connection con, PreparedStatement ps){
		if(ps!=null){
			try{
				ps.close();
			}catch(Exception e){}
		}
		
		if(con!=null){
			try{
				con.close();
			}catch(Exception e){}
		}
	}
	
	private void close(Connection con, PreparedStatement ps, ResultSet rs){
		if(rs!=null){
			try{
				rs.close();
			}catch(Exception e){}
		}
		close(con, ps);
	}
}
