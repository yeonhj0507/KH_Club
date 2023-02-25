/*
	유저 DAO
	2022.12.10 생성
	생성자 연현중
	-이하 수정사항 자율 기록-
 */

package userData;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
    Connection conn;
    PreparedStatement pstmt;
    ResultSet rs;
    
	 final String JDBC_URL = "jdbc:mysql://183.111.138.245:3306/khhs?useUnicode=true&serverTimezone=Asia/Seoul";
	 final String db_id = "khhs";
	 final String db_pw = "Fire05dawn!";
    
    public void open() {
		 try {
			 Class.forName("com.mysql.cj.jdbc.Driver");
			 conn = DriverManager.getConnection(JDBC_URL,db_id,db_pw);
		 }catch(Exception e) {e.printStackTrace();}
	 }
	 
	 public void close() {
		 try { pstmt.close(); conn.close();}
		 catch(SQLException e){ e.printStackTrace();}
	 }
	

	public void insert(UserDO user){
		open();
		
		try {
			String sql = "INSERT INTO user(userID, name, grade, pw, permission) VALUES(?, ?, ?, ?, ?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getName());
			pstmt.setInt(3, user.getGrade());
			pstmt.setString(4, user.getPw());
			pstmt.setInt(5, user.getPermission());
	        pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

        close();
	}
	
	public List<UserDO> findAll(){
		open();
		ArrayList<UserDO> users = new ArrayList<UserDO>();
		
		try {
			pstmt = conn.prepareStatement("SELECT * FROM user");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				UserDO user = new UserDO();
				user.setUserID(rs.getString("userID"));
				user.setName(rs.getString("name"));
				user.setGrade(rs.getInt("grade"));
				user.setPw(rs.getString("pw"));
				user.setPermission(rs.getInt("permission"));
				users.add(user);
			}
		}
        catch (SQLException e) { e.printStackTrace();}
		
		close();
		return users;
	}
	
	public UserDO getById(String id) {
		open();
		UserDO user = new UserDO();
		
		try {
			String sql = "SELECT userID, name, grade, pw, permission FROM user WHERE UserID = ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				user.setUserID(rs.getString("userID"));
				user.setName(rs.getString("name"));
				user.setGrade(rs.getInt("grade"));
				user.setPw(rs.getString("pw"));
				user.setPermission(rs.getInt("permission"));	
			}
		}
        catch (SQLException e) { e.printStackTrace();}
		
		close();
		return user;
	}
	
	public void delete(String id) {
        try {
            String sql = "DELETE FROM user WHERE userID = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.execute();
        }
        catch (SQLException e) { e.printStackTrace(); }
        close();
	}
	
	public void delete(UserDO u) {
		delete(u.getUserID());
	}
	
}
