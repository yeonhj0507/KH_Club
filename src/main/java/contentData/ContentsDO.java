package contentData;

public class ContentsDO {
	int postID;
	String title;
	String content;
	
	public ContentsDO(int postID, String title, String content) {
		this.postID = postID;
		this.title = title;
		this.content = content;
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

	public int getPostID() {
		return this.postID;
	}
	
	public String getTitle() {
		return this.title;
	}
	
	public String getContent() {
		return this.content;
	}
}
