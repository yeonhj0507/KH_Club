package contentData;

import java.sql.Timestamp;

public class ContentsDO {
	private int postID;
	private String title;
	private String content;
	private String writer;
	private Timestamp createTime;
	private int likeCount;
	
	public ContentsDO(int postID, String title, String content, String writer, java.sql.Timestamp timestamp, int likeCount) {

		this.postID = postID;
		this.title = title;
		this.content = content;
		this.createTime = timestamp;
		this.writer = writer;
		this.setLikeCount(likeCount);
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

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

}
