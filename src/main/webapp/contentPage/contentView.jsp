<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
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
  <img src="/contentPage/img/lion.png" class="rounded" alt="..." width="85" height="125">
</div>
	<div class="container">
		<div class="row">
			<form method="post" action="writeAction.jsp">
				<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="3" style="background-color:#eeeeee; text-align: center;">${content.getTitle()}</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width: 20%;">작성일시</td>
							<td colspan="2">${content.getCreateTime()}</td>
						</tr>
						<tr>
							<td>내용</td>
							<td colspan="2" style="height:200px; text-align: left;">${content.getContent()}</td>
						</tr>
					</tbody>
				</table>
				<button type="button" onclick="location.href='/ContentsCtrl?action=list'" class="btn text-white" style="background-color: #9E1915">목록</button>
			</form>
		</div>
	</div>
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>

</body>
</html>