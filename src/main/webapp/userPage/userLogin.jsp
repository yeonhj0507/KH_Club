<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<title>경희고등학교 자율 동아리 게시판 사이트</title>
<link href="css/logIn.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<img src="img/lionMark.png"  style = "display: block; margin: 0 auto; margin-left; margin-bottom: 0px; width:137px; height:184.7906976744186px;">
<div class="container-fluid">
<div class="loginbox">
  <h2>경희고등학교</h2>
  <form method="post" action="/KHHS/UserCtrl?action=login">
    <!--작성하지 않아도 문제는 없음-->
    <fieldset>
      <legend style = "margin-top: 0px;">로그인</legend>
      <label for="loginid">아이디(E-mail)</label>
      <input type="text" name="loginid" placeholder="아이디(E-mail)을 입력해 주세요" value="dawnfire05">
      <label for="loginpw">비밀번호</label>
      <input type="password" name="loginpw" placeholder="비밀번호를 입력해 주세요" value = "dawnfire05">
      <ul>
        <li><a href="#">아이디/비밀번호찾기</a></li>
        <li><a href="signUp.jsp">회원가입</a></li>
      </ul>
      <!--데이터를 서버로 전송-->
      <button type="submit" style="background-color: #9E1915">로그인</button>
    </fieldset>
  </form>
</div>
</div>
</body>
</html>