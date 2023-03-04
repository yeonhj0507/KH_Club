<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form method="post" action="CommentCtrl?action=write">
		<input type=text name="postID" value="${postID}" style="display: none">
		<div>
			<div>
				<textarea placeholder="댓글을 입력해주세요" name="comment"></textarea>
			</div>
			<div>
				<button id="btn">댓글달기</button>
			</div>
		</div>
	</form>
</body>
</html>