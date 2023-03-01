<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content="width=device-width", initial-scale="1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<title>JSP 게시판 웹사이트</title>
</head>
<body>
<%@ include file="/menu.jsp" %>

<div class="text-center">
  <img src="img/lion.png" class="rounded" alt="..." width="85" height="125">
</div>
	<div class="container">
		<div class="row">
			<form method="post" action="/ContentsCtrl?action=write">
				<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color:#eeeeee; text-align: center;">글쓰기</th>
						</tr>
						<% String errorMsg = (String)session.getAttribute("error");
						if (errorMsg != null) {%>
						<tr>
							<td colspan="2" style="background-color:#eeeeee; color:red; text-align: center;"><%out.print(errorMsg); %></td>
						</tr>
						<% }
						session.setAttribute("error", null);
						%>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="50"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용" name="content" maxlength="2048" style="height:350px;"></textarea></td>
						</tr>
					</tbody>
				</table>

				<input type="submit" class="btn pull-right text-light" style="background-color: #9E1915" value="업로드">

			</form>
		</div>
	</div>
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
</body>
</html>