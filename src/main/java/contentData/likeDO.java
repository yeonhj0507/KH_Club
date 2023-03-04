package contentData;

public class likeDO {
	private int index;
	private String contentTitle;
	private String userID;
	
	public likeDO (String contentTitle, String userID) {
		this.contentTitle = contentTitle;
		this.userID = userID;
	}
	
	public likeDO() {
		// TODO Auto-generated constructor stub
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
