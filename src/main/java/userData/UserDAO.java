/*
	유저 DAO
	2022.12.10 생성
	생성자 연현중
	-이하 수정사항 자율 기록-
 */

package userData;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    Connection conn;
    Statement stmt;
    ResultSet rs;
    
	public UserDAO(){
		String conip = "183.111.138.245:3306";
		String conid = "khhs";
		String conpw = "Fire05dawn!";
	    try{
	    	Class.forName("com.mysql.cj.jdbc.Driver");
	    	String url = "jdbc:mysql://"+ conip +"/khhs?useUnicode=true&serverTimezone=Asia/Seoul";
	    	conn = DriverManager.getConnection(url,conid,conpw);
	    	stmt=conn.createStatement();
	    	System.out.println("연결 성공");
	    }
	    catch(ClassNotFoundException e){
	    	System.out.println("드라이버 로딩 실패");
	    }
	    catch(SQLException e){
	    	System.out.println("에러: " + e);
	    }
	    
	    /*
	    finally{
	        try{
	            if( conn != null && !conn.isClosed()){
	                conn.close();
	            }
	        }
	        catch( SQLException e){
	            e.printStackTrace();
	        }
	    }
	    */
	    
	}
	

	public void insert(UserDO user)throws SQLException{
		String fmt = "INSERT INTO user VALUES('%s', '%s', %d, '%s', %d)";
		String query = String.format(fmt, user.getUserID(), user.getName(), 
				user.getGrade(), user.getPw(), user.getPermission());
        stmt.execute(query);		
	}
	
	public List<UserDO> findAll(){
		ArrayList<UserDO> users = new ArrayList<UserDO>();
		try {
			rs = stmt.executeQuery("SELECT * FROM user");
			while(rs.next()) {
				users.add(new UserDO(rs.getString("userID"), rs.getString("name"),
						rs.getInt("grade"), rs.getString("pw"), rs.getInt("permission")));
			}
		}
        catch (SQLException e) { e.printStackTrace(); }
		return users;
	}
	
	public UserDO findById(String id) {
		UserDO user = null;
		try {
			String fmt = "SELECT userID, name, grade, pw, permission FROM user WHERE UserID = '%s'";
			String q = String.format(fmt, id);
			rs = stmt.executeQuery(q);
			if(rs.next()) {
				user = new UserDO(rs.getString("userID"), rs.getString("name"),
						rs.getInt("grade"), rs.getString("pw"), rs.getInt("permission"));
			}
			else {
				return null;
			}

		}
        catch (SQLException e) { e.printStackTrace();}
		return user;

	}
	
	public void delete(String id) {
        try {
            String fmt = "DELETE FROM user WHERE userID = '%s'";
            String q = String.format(fmt, id);
            stmt.execute(q);
        }
        catch (SQLException e) { e.printStackTrace(); }
	}
	
	public void delete(UserDO u) {
		delete(u.getUserID());
	}
	
	
	
	
	public void kill() {
		try{
            if( conn != null && !conn.isClosed()){
                conn.close();
            }
        }
        catch( SQLException e){
            e.printStackTrace();
        }
	}
	
}
