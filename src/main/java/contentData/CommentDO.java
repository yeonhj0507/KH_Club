package contentData;

import java.sql.Timestamp;

public class CommentDO {
	
	private int indexComments;
	private String comment;
	private int postNum;
	private int depth;
	private int order;
	private int groupNum;
	private Timestamp createTime;
	private Timestamp editTime;
	private String userID;
	
	public int getIndexComments() {
		return indexComments;
	}
	public void setIndexComments(int indexComments) {
		this.indexComments = indexComments;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getPostNum() {
		return postNum;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getOrder() {
		return order;
	}
	public void setOrder(int order) {
		this.order = order;
	}
	public int getGroupNum() {
		return groupNum;
	}
	public void setGroupNum(int groupNum) {
		this.groupNum = groupNum;
	}
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
	public Timestamp getEditTime() {
		return editTime;
	}
	public void setEditTime(Timestamp editTime) {
		this.editTime = editTime;
	}
	
	
	

}
