 package contentData;

 import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.exceptions.RSAException;
 
 public class ContentsDAO {
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
	 
	 public void insert(ContentsDO content){
		 open();
		 
		 try {
			 String sql = "INSERT INTO content(title, content, contentUser, likeCount) VALUES(?,?,?,?)";
			 pstmt=conn.prepareStatement(sql);
			 pstmt.setString(1, content.getTitle());
			 pstmt.setString(2, content.getContent());
			 pstmt.setString(3, content.getWriter());
			 pstmt.setInt(4, content.getLikeCount());
			 pstmt.executeUpdate();
		 }catch(Exception e) {e.printStackTrace();}

		 close();
	 }
	 
	 public List<ContentsDO> getAll(){
		 open();
		 ArrayList<ContentsDO> contents = new ArrayList<ContentsDO>();
		 
		 try {
			 pstmt = conn.prepareStatement("SELECT * FROM content order by postID desc");
			 rs = pstmt.executeQuery();
			 
			 while(rs.next()) {
				 ContentsDO content = new ContentsDO();
				 content.setPostID(rs.getInt("postID"));
				 content.setTitle(rs.getString("title"));
				 content.setWriter(rs.getString("contentUser"));
				 content.setLikeCount(rs.getInt("likeCount"));
				 contents.add(content);
			 }
		 }catch(Exception e) {e.printStackTrace();}
		 
		 close();
		 return contents;
	 }
	 
	public ContentsDO getByID(int id){
		 open();
		 ContentsDO content = new ContentsDO();
		 
		 try {
			 String sql = "SELECT * FROM content where postID = ?";
			 pstmt=conn.prepareStatement(sql);
			 pstmt.setInt(1, id);
			 rs = pstmt.executeQuery();
			 
			 while(rs.next()) {
				 content.setPostID(rs.getInt("postID"));
				 content.setTitle(rs.getString("title"));
				 content.setContent(rs.getString("content"));
				 content.setWriter(rs.getString("contentUser"));
				 content.setCreateTime(rs.getTimestamp("createTime"));
				 content.setLikeCount(rs.getInt("likeCount"));
			 }
		 }catch(Exception e) {e.printStackTrace();}
		 
		 close();
		 return content;
	 }
	 
	 public int getRecentID(){
		open();
		int ri = 0;
		
		try {
			String sql = "SELECT MAX(postID) FROM content";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				ri = rs.getInt("MAX(postID)");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return ri; 
	 }
	 
	 public int getContentsNum(){
		open();
		int ri = 0;
		
		try {
			String sql = "SELECT COUNT(*) FROM content";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				ri = rs.getInt("COUNT(*)");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return ri; 
	 }	 
 }