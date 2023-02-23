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
<% 
      String userID=null;
      if(request.getAttribute("userID")!=null){
         userID=(String)request.getAttribute("userID");
      }
%>
   <nav class="navbar navbar-expand-lg" style="background-color: #9E1915; font-size:20px;">
  <div class="container-fluid">
    <a class="navbar-brand text-light" href="javascript:void(0)" onClick="javascript:main()">경희고등학교</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-between" id="navbarSupportedContent">
      <ul class="navbar-nav mb-2 mb-sm-0">
        <li class="nav-item">
          <a class="nav-link active text-light" aria-current="page" href="javascript:void(0)" onClick="javascript:monthly()">급식안내</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-light" href="javascript:void(0)" onClick="javascript:contentView()">게시판</a>
        </li>
        </ul>
        
        <ul class="navbar-nav" >
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle text-light" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            계정관리
          </a>
          <ul class="dropdown-menu">
          <%
           if(userID==null){
        %>
            <li><a class="dropdown-item" href="/userPage/userLogin.jsp">로그인</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="/userPage/userRegister.jsp">회원가입</a></li>
            <%
           }else{
        %>
           <li><a class="dropdown-item" href="/userPage/userLogin.jsp">${userID}</a></li>
           <li class="dropdown-item">
           <form method="post" action="/userCtrl?action=logout">
             <input type="submit" value="로그아웃">
             </form>         
              </li>
         <%
        }
        %>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
<div class="text-center">
  <img src="img/lion.png" class="rounded" alt="..." width="85" height="125">
</div>
	<div class="container">
		<div class="row">
			<form method="post" action="writeAction.jsp">
				<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="3" style="background-color:#eeeeee; text-align: center;">게시판 글보기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width: 20%;">글 제목</td>
							<td colspan="2">안녕하세요</td>
						</tr>
						<tr>
							<td>내용</td>
							<td colspan="2" style="height:200px; text-align: left;">dㅁㄴㅇㅁㄴㄴㅁㄹㄴㅁㄴㅁㅇㄴㅁㄹㄴㅁㄹㄴㅁㅇㄴㅁㅇㄴㅁㄹㄴㅁㄹㄴㅁk</td>
						</tr>
					</tbody>
				</table>
				<button type="button" onclick="location.href='contentList.jsp'" class="btn text-white" style="background-color: #9E1915">목록</button>
			</form>
		</div>
	</div>
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
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
	    f.setAttribute('action', '/ContentsCtrl');
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