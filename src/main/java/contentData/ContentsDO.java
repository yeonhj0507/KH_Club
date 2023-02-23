/*
	게시글의 DO.
	2022.12.10 생성
	생성자 연현중
	-이하 수정사항 자율 기록-
 */

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
