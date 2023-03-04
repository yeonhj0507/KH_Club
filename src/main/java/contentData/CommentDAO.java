package contentData;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentDAO {
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
	 /*
	 public void insert(CommentDO comment){
		 open();
		 
		 try {
			 String sql = "INSERT INTO content(comment, postNum, depth, order, groupNum, userID) VALUES(?,?,?,?,?,?)";
			 pstmt=conn.prepareStatement(sql);
			 pstmt.setString(1, comment.getComment());
			 pstmt.setInt(2, comment.getPostNum());
			 pstmt.setInt(3, comment.getDepth());
			 pstmt.setInt(4, comment.getOrder());
			 pstmt.setInt(5, comment.getGroupNum());
			 pstmt.setString(6, comment.getUserID());

			 pstmt.executeUpdate();
		 }catch(Exception e) {e.printStackTrace();}

		 close();
	 }*/
	 
	 public void insert(CommentDO comment){
		 open();
		 
		 try {
			 String sql = "INSERT INTO comment(comment, postID,userID) VALUES(?,?,?)";
			 pstmt=conn.prepareStatement(sql);
			 pstmt.setString(1, comment.getComment());
			 pstmt.setInt(2, comment.getPostNum());
			 pstmt.setString(3, comment.getUserID());

			 pstmt.executeUpdate();
		 }catch(Exception e) {e.printStackTrace();}

		 close();
	 }
	 
	 public List<CommentDO> getAll(int postID) {
		 open();
		 ArrayList<CommentDO> comments = new ArrayList<CommentDO>();
		 
		 try {
			 pstmt = conn.prepareStatement("SELECT * FROM comment where postID ="+ postID + "orderby indexComments desc");
			 rs = pstmt.executeQuery();
			 
			 while(rs.next()) {
				 CommentDO comment = new CommentDO();
				 comment.setComment(rs.getString("comment"));
				 comment.setCreateTime(rs.getTimestamp("createTime"));
				 comment.setUserID(rs.getString("userID"));
				 comments.add(comment);
			 }
		 }catch(Exception e) {e.printStackTrace();}
		 
		 close();
		 return comments;
	 }

}
