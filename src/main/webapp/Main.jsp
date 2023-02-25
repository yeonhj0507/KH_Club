<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="total.css" rel="stylesheet" type="text/css">
<style type="text/css">
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<title>메인 화면</title>
</head>
<%@ include file="/menu.jsp" %>
<div class="container" style="margin-top : 50px;background-image: url("/contentPage/img/lion.png")" >
	<div class="row" style ="padding-bottom:10%;">
		<video autoplay controls loop muted poster="poser.png" preload="auto" width="640" height="360">
			<source src="movie.mp4" type="video/mp4">
		</video>
	</div>
	<div class="row " style = "padding-bottom:10%;" >
		<div class ="col-7 bg-white border border-secondary rounded-1 shadow-lg align-content-around flex-wrap" style="margin:auto; "> 
		<div style="margin-top:10%; font-size:2.5rem;">
			<div class="text-center">오늘의 급식</div>
			<div class="text-center" style = "padding-bottom:10%; padding-left:10%; padding-right:10%;">${food}</div>
		</div>
	</div>
    </div>
</div>
</body>
</html>