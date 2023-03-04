package contentData;

public class likeDO {
	private int index;
	private String contentTitle;
	private String userID;
	
	public likeDO (int index, String contentTitle, String userID) {
		this.index = index;
		this.contentTitle = contentTitle;
		this.userID = userID;
	}
	
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public String getContentTitle() {
		return contentTitle;
	}
	public void setContentTitle(String contentTitle) {
		this.contentTitle = contentTitle;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
}
