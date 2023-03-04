package contentData;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.exceptions.RSAException;

public class likeDAO {
	Connection conn = null;
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
	 
	 public void insert(likeDO like){
		 open();
		 
		 try {
			 String sql = "INSERT INTO likeLog(content, userID) VALUES(?,?)";
			 pstmt=conn.prepareStatement(sql);
			 pstmt.setString(1, like.getContentTitle());
			 pstmt.setString(2, like.getUserID());
			 pstmt.executeUpdate();
		 }catch(Exception e) {e.printStackTrace();}

		 close();
	 }
	 public likeDO getByIndex(int index){
		 open();
		 likeDO like = new likeDO();
		 
		 try {
			 String sql = "SELECT * FROM likeLog where index = ?";
			 pstmt=conn.prepareStatement(sql);
			 pstmt.setInt(1, index);
			 rs = pstmt.executeQuery();
			 
			 while(rs.next()) {
				 like.setIndex(rs.getInt("index"));
				 like.setContentTitle(rs.getString("content"));
				 like.setUserID(rs.getString("userID"));
			 }
		 }catch(Exception e) {e.printStackTrace();}
		 
		 close();
		 return like;
	 }
	 
	 public List<likeDO> getAll(){
		 open();
		 ArrayList<likeDO> likeLog = new ArrayList<likeDO>();
		 
		 try {
			 pstmt = conn.prepareStatement("SELECT * FROM likeLog order by index desc");
			 rs = pstmt.executeQuery();
			 
			 while(rs.next()) {
				 likeDO like = new likeDO();
				 like.setIndex(rs.getInt("index"));
				 like.setContentTitle(rs.getString("content"));
				 like.setUserID(rs.getString("userID"));
				 likeLog.add(like);
			 }
		 }catch(Exception e) {e.printStackTrace();}
		 
		 close();
		 return likeLog;
	 }
	 
	 public int getLogNum(){
			open();
			int ri = 0;
			
			try {
				String sql = "SELECT MAX(postID) FROM likeLog";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				
				while(rs.next()) {
					ri = rs.getInt("MAX(index)");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			return ri; 
		 }
	 
	 public int getLikeNum(String content){
			open();
			int ri = 0;
			
			try {
				String sql = "SELECT COUNT(*) FROM likeID";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				
				while(rs.next()) {
					ri = rs.getInt("COUNT("+content+")");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			return ri; 
		 }	 
}
