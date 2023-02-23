/*
	유저 DO
	2022.12.10 생성
	생성자 연현중
	-이하 수정사항 자율 기록-
 */

package userData;

public class UserDO {
	
	String userID;
	String name;
	int grade;
	String pw;
	int permission;
	
	
	public UserDO(String userID, String name, int grade, String pw, int permission) {
		this.userID=userID;
		this.name=name;
		this.grade=grade;
		this.pw = pw;
		this.permission = permission;
	}
	
	//get
	public String getName(){
		return this.name;
	}
	
	public String getUserID() {
		return this.userID;
	}
	
	public int getGrade() {
		return this.grade;
	}
	
	public String getPw() {
		return this.pw;
	}
	
	public int getPermission() {
		return this.permission;
	}

}
