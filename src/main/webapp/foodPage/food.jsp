<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="total.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<title>이번 달 급식</title>
</head>
<body>
<%@ include file="/menu.jsp" %>

<div class="text-center">
  <img src="/contentPage/img/lion.png" class="rounded" alt="..." width="85" height="125">
</div>
	
<div class="container">
<div class="table-responsive">
<table class="table table-bordered border-dark" style="margin-top:30px;">
 <thead >
     <tr class="text-center table-info" style="background-color: #9E1915;">
     <th scope="col" style="width:300px; background-color: #9E1915; color: white;">월</th>
     <th scope="col" style="width:300px; background-color: #9E1915; color: white;">화</th>
     <th scope="col" style="width:300px; background-color: #9E1915; color: white;">수</th>
     <th scope="col" style="width:300px; background-color: #9E1915; color: white;">목</th>
     <th scope="col" style="width:300px; background-color: #9E1915; color: white;">금</th>
   </tr>
 </thead>
 <tr>
 
 <c:set var="flag" value="false"/>
 
 <c:forEach var="i" begin="1" end ="${date}" step="1">
 	<th scope="col" style="width:300px"></th>
 </c:forEach>
 
 <c:forEach var="i" begin="1" end ="${date1}" step="1">
 	<th scope="col" style="width:300px">${food[i-1]}</th>
 </c:forEach>
 
 </tr>
 
 <c:if test="${not flag}">
 <c:forEach var="i" begin="1" end = "4" step="1">
 	<tr>
 	<c:forEach var="j" begin="0" end="4" step="1">
 		 <th scope="col" style="width:300px">${food[i*5+j+date1]}</th>
 		 <c:if test="${empty food}">
 			<c:set var="flag" value="true"/>
 		 </c:if>
 	</c:forEach>
 	</tr>
</c:forEach>
</c:if>
</table>
</div>
</div>
<script>
function monthly(){
    let f = document.createElement('form');
    f.setAttribute('method', 'post');
    f.setAttribute('action', '/foodCtrl?action=monthly');
    document.body.appendChild(f);
    f.submit();
}

function contentView(){
    let f = document.createElement('form');
    f.setAttribute('method', 'post');
    f.setAttribute('action', '/ContentsCtrl?action=list');
    document.body.appendChild(f);
    f.submit();
}

function main(){
    let f = document.createElement('form');
    f.setAttribute('method', 'post');
    f.setAttribute('action', '/foodCtrl');
    document.body.appendChild(f);
    f.submit();
}
</script>
</body>
</html>