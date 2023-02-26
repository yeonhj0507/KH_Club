package contentData;

import java.sql.Timestamp;

public class ContentsDO {
	int postID;
	String title;
	String content;
	String writer;
	Timestamp createTime;
	
	public ContentsDO(int postID, String title, String content, String writer, java.sql.Timestamp timestamp) {
		this.postID = postID;
		this.title = title;
		this.content = content;
		this.createTime = timestamp;
		this.writer = writer;
	}
	
	public ContentsDO() {
	}

	public void setPostID(int postID) {
		this.postID = postID;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setContent(String content) {
		this.content = content;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public int getPostID() {
		return this.postID;
	}
	
	public String getTitle() {
		return this.title;
	}
	
	public String getContent() {
		return this.content;
	}
	
	public String getWriter() {
		return this.writer;
	}
	public Timestamp getCreateTime() {
		return this.createTime;
	}
	

}
