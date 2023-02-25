package contentData;

import java.sql.Timestamp;

public class ContentsDO {
	int postID;
	String title;
	String content;
	Timestamp createTime;
	
	public ContentsDO(int postID, String title, String content, java.sql.Timestamp timestamp) {
		this.postID = postID;
		this.title = title;
		this.content = content;
		this.createTime = timestamp;
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
	
	public Timestamp getCreateTime() {
		return this.createTime;
	}


}
