/*
	�Խñ��� DO.
	2022.12.10 ����
	������ ������
	-���� �������� ���� ���-
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
