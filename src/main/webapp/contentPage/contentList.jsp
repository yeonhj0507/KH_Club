<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content="width=device-width", initial-scale="1">
<!-- CSS only -->
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
			<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color:#eeeeee; text-align: center;">번호</th>
						<th style="background-color:#eeeeee; text-align: center;">제목</th>
						<th style="background-color:#eeeeee; text-align: center;">id</th>
						
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="index" varStatus="vs">
                  <tr class="odd gradeX">
                      <td><c:out value="${vs.index+1}"/></td>
                      <td><a href="/ContentsCtrl?action=view&postID=${list[vs.index].getPostID()}"><c:out value="${list[vs.index].getTitle()}"/></a></td>
                      <td><c:out value="${list[vs.index].getPostID()}"/></td>
                  </tr>
            	</c:forEach>
				</tbody>
			</table>
		</div>
		<%
			if(userID!=null) {
		%>
		<button type="button" onclick="location.href='/contentPage/contentWrite.jsp'" class="btn text-white" style="background-color: #9E1915">글쓰기</button>
		<%
			}
		%>
	</div>
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>

</body>
</html>