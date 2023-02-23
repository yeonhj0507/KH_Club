/*
	게시글 DAO.
	2022.12.10 생성
	생성자 연현중
	- 이하 수정사항 자율 기록 -
 */

 package contentData;

 import java.sql.Connection;
 
 import java.sql.DriverManager;
 import java.sql.Statement;
 import java.util.ArrayList;
 import java.util.List;
 
 import java.sql.ResultSet;
 import java.sql.SQLException;
 
 public class ContentsDAO {
	 Connection conn;
	 Statement stmt;
	 ResultSet rs;
	 
	 public ContentsDAO(){
 
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
 
	 }
	 
	 public void insert(ContentsDO content) throws SQLException{
		 String fmt = "INSERT INTO content VALUES(%d, '%s', '%s')";
		 String query = String.format(fmt, content.getPostID(),
				 content.getTitle(), content.getContent());
		 stmt.execute(query);	
	 }
	 
	 
	 public List<ContentsDO> findTitle(){
		 ArrayList<ContentsDO> contents = new ArrayList<ContentsDO>();
		 try {
			 rs = stmt.executeQuery("SELECT * FROM content");
			 while(rs.next()) {
				 contents.add(new ContentsDO(rs.getInt("postID"),
						 rs.getString("title"), rs.getString("content")));
			 }
 
		 }
		 catch(SQLException e) {e.printStackTrace();}
		 return contents;
	 }

	 public ContentsDO findByID(int id) {
		 ContentsDO content = null;
		 try {
			 String fmt = "SELECT * FROM content where postID = %d";
			 String q = String.format(fmt, id);
			 rs = stmt.executeQuery(q);
			 if(rs.next()) {
				 content = new ContentsDO(rs.getInt("postID"), rs.getString("title"),
						 rs.getString("content"));
			 }
					 
		 }catch (SQLException e) { e.printStackTrace(); }
		 
		 return content; 
	 }

	 public int findRecentID() {
		int mid = 0;
		try {
			String fmt = "SELECT MAX(postID) FROM content";
			rs = stmt.executeQuery(fmt);
			if(rs.next()) {
				mid = rs.getInt("MAX(postID)");
			}
					
		}catch (SQLException e) { e.printStackTrace(); }
		
		return mid; 
	}
	 
	 public void delete(int id) {
		 try {
			 String fmt = "DELETE FROM content WHERE postID = %d";
			 String q = String.format(fmt, id);
			 stmt.execute(q);
		 }
		 catch (SQLException e) { e.printStackTrace(); }
	 }
	 
	 public void delete(ContentsDO u) {
		 delete(u.getPostID());
	 }
	 
	 public void kill() {
		 try{
			 if( conn != null && !conn.isClosed()){
				 conn.close();
				 System.out.println("종료");
			 }
		 }
		 catch( SQLException e){
			 e.printStackTrace();
		 }
	 }
	 
 }
 